#include "grasping_gym_actions/actions.hpp"

#include "grasping_gym_actions/iiwa.h"

#include <tf/transform_listener.h>


graspingActions::graspingActions()
{

    ROS_INFO("Managers created");
    //----------------Services to comunicate with environment------------------
    makeEnvStep_=nh_.advertiseService("makeEnvStep",&graspingActions::makeEnvStepCb,this);
    resetEnv_=nh_.advertiseService("resetEnv",&graspingActions::resetEnvCb,this);
    //--------------Services to comunicate with gazebo ------------------------

    resetGazeboEnv_=nh_.serviceClient<std_srvs::Empty>("gazebo/reset_world"); //To reset the simulation
    setModelState_=nh_.serviceClient<gazebo_msgs::SetModelState>("gazebo/set_model_state");
    getModelState_ = nh_.serviceClient<gazebo_msgs::GetModelState>("/gazebo/get_model_state");
    gazeboPausePhysics_=nh_.serviceClient<std_srvs::Empty>("/gazebo/pause_physics");
    gazeboResumePhysics_=nh_.serviceClient<std_srvs::Empty>("/gazebo/unpause_physics");

    // ------------- Topic & Srvices to interact with enviroment ------------------ //
    
    joint_states_sub = nh_.subscribe("/iiwa/joint_states", 1000, &graspingActions::jointStateCb, this);
    //odom_subscriber_=nh_.subscribe("odom",1,&graspingActions::getOdomCb,this);
    action_publisher_arm_ =nh_.advertise<trajectory_msgs::JointTrajectory>("/arm_controller/command",1000);
    action_publisher_gripper_ =nh_.advertise<trajectory_msgs::JointTrajectory>("/gripper_controller/command",1000);


    // -------------- TF Listener -------------- //
    listener_ = new tf::TransformListener();

    //-------------- Variables -------------- //


    //addTableToScene(1.0,3.0,0.1);
    action_dim_= 7;
    state_dim_ = 7;
    max_step=1000;

    collision_= false;

    joint_states_.position.resize(7,0.0);

    // --- Action msg ------ //
    action_msg_.points.resize(1);
    action_msg_.joint_names.resize(7);
    action_msg_.joint_names[0] = "iiwa_joint_1" ;
    action_msg_.joint_names[1] = "iiwa_joint_2" ;
    action_msg_.joint_names[2] = "iiwa_joint_3" ;
    action_msg_.joint_names[3] = "iiwa_joint_4" ;
    action_msg_.joint_names[4] = "iiwa_joint_5" ;
    action_msg_.joint_names[5] = "iiwa_joint_6" ;
    action_msg_.joint_names[6] = "iiwa_joint_7" ;

    action_msg_.points[0].positions.resize(7,0.0);
    action_msg_.points[0].velocities.resize(7,0.0);
    action_msg_.points[0].accelerations.resize(7,0.0);

}

graspingActions::~graspingActions() 
{
    ROS_INFO("DONE");
}

bool graspingActions::makeEnvStepCb(grasping_gym_actions::makeEnvStep::Request & req, grasping_gym_actions::makeEnvStep::Response & res)
{
  // Step counter
  std_srvs::Empty empty;
  int step_n=req.step_n;

  // Send a Comand
  bool failed = false;
  if(!failed)
  {
    controlLoop(req.action);
  }

  // Obtain the reward
  std::cout << step_n << std::endl;
  float reward=getReward(step_n,failed);

  // Get new state
  std::vector<float> new_state(state_dim_,0);
  computeNewState(new_state);

  // Set response message
  res.reward=reward;
  res.next_state=new_state;
  res.done=(step_n==max_step);
  res.success=true;
  res.message="";

  return true;
}

void graspingActions::computeNewState(std::vector<float> &new_state)
{
  for(int i=0 ; i< new_state.size(); i++)
  {
    new_state[i] = joint_states_.position[i];
  }
}



void graspingActions::controlLoop(std::vector<float> action_vec)
{
  // Empty
  std_srvs::Empty empty;
  // Determine Size of action Vector
  //int size = sizeof(action_vec)/sizeof(action_vec[0]);
  int size = action_vec.size();
  for(int i=0; i<size ; i++)
  {
    action_msg_.points[0].positions[i] = joint_states_.position[i] + action_vec[i];
  }

  // Play - Set Command - Stop
  ros::service::waitForService("/gazebo/unpause_physics",ros::Duration(3.0));
  gazeboResumePhysics_.call(empty);
  //ACTION U
  action_msg_.header.stamp = ros::Time::now();
  action_msg_.points[0].time_from_start = ros::Duration(0.02);
  action_publisher_arm_.publish(action_msg_);
  sleep(0.05);
  ros::service::waitForService("/gazebo/pause_physics",ros::Duration(3.0));
  gazeboPausePhysics_.call(empty);
}



bool graspingActions::resetEnvCb(grasping_gym_actions::resetEnv::Request & req, grasping_gym_actions::resetEnv::Response & res) {
    collision_=false;
    std_srvs::Empty empty_srv;
    if(resetGazeboEnv_.call(empty_srv)){
        setRobotInitialPose();
        setBoxInitialPose();
        std::vector<float> reset_state(state_dim_,0);
        res.state = getPose();
        res.success = true;
        collision_= false;
        return true;
    }
    else return false;
}

std::vector<float> graspingActions::getPose()
{
    std::vector<float> new_state(state_dim_,0);
    for (auto ii = 0; ii < state_dim_; ii++)
    {
        new_state[ii] = joint_states_.position[ii];
    }
    return new_state;
}

bool graspingActions::setGazeboModelPose(std::string modelName, std::string referenceFrame,geometry_msgs::Pose pose) {

    gazebo_msgs::SetModelState setmodelstate;
    gazebo_msgs::ModelState modelstate;
    modelstate.model_name = modelName;
    modelstate.reference_frame = referenceFrame;
    modelstate.pose = pose;
    setmodelstate.request.model_state = modelstate;
    if (setModelState_.call(setmodelstate))
    {
        ROS_INFO("%f, %f",modelstate.pose.position.x,modelstate.pose.position.y);
    }
    else
    {
        ROS_ERROR("Failed to call setGazeboModelPose service. ");
        return false;
    }
    return true;
}
bool graspingActions::getModelPose(std::string modelName, geometry_msgs::Pose &pose) {

    gazebo_msgs::GetModelState getModelState;
    getModelState.request.model_name = modelName;

    if(getModelState_.call(getModelState)){
        pose=getModelState.response.pose;
        return true;
    }else return false;
}
float graspingActions::getRandomDouble(float min, float max) {
    float random = min + static_cast <float> (rand()) /( static_cast <float> (RAND_MAX/(max-min)));
    return random;
}
bool graspingActions::setBoxInitialPose() {
    std_srvs::Empty empty;

    geometry_msgs::Pose boxPose;
    ros::service::waitForService("/gazebo/unpause_physics",ros::Duration(3.0));
    gazeboResumePhysics_.call(empty);

    if(!getModelPose("obj1",boxPose)){
        ROS_ERROR("Error getting box pose.");
        return false;
    }

    double x=boxPose.position.x;
    double y=boxPose.position.y;
    double z=boxPose.position.z;

    boxPose.position.x = 0.0;
    boxPose.position.y = 0.0;  
    boxPose.position.z = 0.0;
    boxPose.orientation.x=0.0;
    boxPose.orientation.y=0.0;
    boxPose.orientation.z=0.0;
    boxPose.orientation.w=0.0;


    if(!setGazeboModelPose("obj1","world",boxPose)){
        ROS_ERROR("Error setting box pose.");
        return false;
    }

    sleep(2);
    ros::service::waitForService("/gazebo/pause_physics",ros::Duration(3.0));
    gazeboPausePhysics_.call(empty);

    return true;
}

bool graspingActions::setRobotInitialPose() {
    std_srvs::Empty empty;

    // OPEN GRIPPER

    ros::service::waitForService("/gazebo/unpause_physics",ros::Duration(3.0));
    gazeboResumePhysics_.call(empty);

    trajectory_msgs::JointTrajectory gripper_msg;

    gripper_msg.header.stamp = ros::Time(0);
    gripper_msg.joint_names.resize(2);
    gripper_msg.joint_names[0] = "schunk_wsg50_joint_left_jaw" ;
    gripper_msg.joint_names[1] = "schunk_wsg50_joint_right_jaw";

    gripper_msg.points.resize(1);
    gripper_msg.points[0].positions.resize(2,0.04);
    gripper_msg.points[0].velocities.resize(2,0.0);
    gripper_msg.points[0].accelerations.resize(2,0.0);

    gripper_msg.points[0].time_from_start = ros::Duration(0.1);

    action_publisher_gripper_.publish(gripper_msg);

    double error2 = 1000;
    while(error2 > 0.1)
    {
        error2 = 0;
        for(unsigned int i=0; i<2; i++)
        {
            error2 += fabs(joint_states_.position[7+i] - gripper_msg.points[0].positions[i]);
        }
        std::cout << error2 << std::endl;

    }

    std::cout << "move Hand" << std::endl;

    // MOVE HAND


    trajectory_msgs::JointTrajectory robotPose;

    robotPose.header.stamp = ros::Time(0);

    robotPose.joint_names.resize(7);
    robotPose.joint_names[0] = "lbr_iiwa_joint_1" ;
    robotPose.joint_names[1] = "lbr_iiwa_joint_2" ;
    robotPose.joint_names[2] = "lbr_iiwa_joint_3" ;
    robotPose.joint_names[3] = "lbr_iiwa_joint_4" ;
    robotPose.joint_names[4] = "lbr_iiwa_joint_5" ;
    robotPose.joint_names[5] = "lbr_iiwa_joint_6" ;
    robotPose.joint_names[6] = "lbr_iiwa_joint_7" ;

    robotPose.points.resize(1);
    robotPose.points[0].positions.resize(7,0.0);
    robotPose.points[0].velocities.resize(7,0.0);
    robotPose.points[0].accelerations.resize(7,0.0);

    robotPose.points[0].positions[0] =  0.06499912268108687;
    robotPose.points[0].positions[1] =  0.628004613309634;
    robotPose.points[0].positions[2] =  0.00;
    robotPose.points[0].positions[3] = -1.37;
    robotPose.points[0].positions[4] =  0.00;
    robotPose.points[0].positions[5] =  1.1099931864086061;
    robotPose.points[0].positions[6] =  0.8819996932826806;


    robotPose.points[0].time_from_start = ros::Duration(0.02);

    //action_publisher_arm_.publish(robotPose);

    double error = 1000;

    for(unsigned int i=0; i<7; i++)
    {
        error += fabs(joint_states_.position[i] - robotPose.points[0].positions[i]);
    }

    while(error > 0.03)
    {
        robotPose.header.stamp = ros::Time::now();
        robotPose.points[0].time_from_start = ros::Duration(0.1);
        action_publisher_arm_.publish(robotPose);

        error = 0;
        for(unsigned int i=0; i<7; i++)
        {
            error += fabs(joint_states_.position[i] - robotPose.points[0].positions[i]);
        }
        //std::cout << error << std::endl;
    }

    ros::service::waitForService("/gazebo/pause_physics",ros::Duration(3.0));
    gazeboPausePhysics_.call(empty);



    return true;

}

bool graspingActions::getTCPPose(std::vector<double> &tcp_pose)
  {
    // Get TCP-WORLD trasnform with tf
    tf::StampedTransform transform;
    try
    {
      // Lookup transform
      listener_->lookupTransform("/world", "/iiwa_link_7", ros::Time(0), transform);
    }
    catch(tf::TransformException &ex)
    {
      ROS_WARN("%s",ex.what());
      return false;
    }

    // From Transform to Eigen::Vector3d
    tcp_pose.resize(6);
    tcp_pose[0] = transform.getOrigin().x();
    tcp_pose[1] = transform.getOrigin().y();
    tcp_pose[2] = transform.getOrigin().z();
    tcp_pose[3] = transform.getRotation().getX();
    tcp_pose[4] = transform.getRotation().getY();
    tcp_pose[5] = transform.getRotation().getZ();

    return true;
   }


float graspingActions::getReward(int time, bool failed)
{
  float error = 0.0;

  // Compute TCP Pose
  std::vector<double> cartesian_frame(6,0.0);
  getTCPPose(cartesian_frame);

  // Compute reward
  error = 0.6;
  float reward;
  if (error < 0.5)
  {
      reward = 1/(error);
  }
  if(failed)
  {
      reward -= 1000;
  }
  return reward;
}

bool graspingActions::addTableToScene(float height, float width, float thickness) {
    std::vector<std::vector<double> > primitives_dimensions_list;
    std::vector<std::vector<double> > primitives_xyz_list;
    std::vector<std::vector<double> > primitives_rpy_list;
    std::vector<std::string> primitives_type_list;
    std::vector<double> xyz(3,0), rpy(3,0);
    std::vector<double> primitive_dimension(3,0);

    primitive_dimension[0]=width;
    primitive_dimension[1]=thickness;
    primitive_dimension[2]=height;

    xyz[0] =width/2; xyz[1] = 1.5-height/2; xyz[2] = 0.75;
    rpy[0] = M_PI_2; rpy[1] = 0; rpy[2] = 0.0;

    primitives_dimensions_list.push_back(primitive_dimension);
    primitives_xyz_list.push_back(xyz);
    primitives_rpy_list.push_back(rpy);
    primitives_type_list.push_back("BOX");
}

void graspingActions::checkCollisionCb(const gazebo_msgs::ContactsState::ConstPtr & msg){
  if(msg->states.size()>0){
      for(int i=0;i<msg->states.size();i++){
          if(msg->states.data()->collision1_name.compare(groundPlaneGazeboName_)!=0 && msg->states.data()->collision2_name.compare(groundPlaneGazeboName_)!=0){
              collision_=true;
              ROS_INFO("Collision!");
              break;
          }

      }
  }

}
void graspingActions::jointStateCb(const sensor_msgs::JointState::ConstPtr& msg)
{
    joint_states_ = *msg;
}
