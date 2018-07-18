//
// Created by airiondo on 4/4/18.
//

#ifndef ACTIONS_HPP
#define ACTIONS_HPP

#include <ros/ros.h>
#include "grasping_gym_actions/resetEnv.h"
#include "grasping_gym_actions/makeEnvStep.h"
#include <std_srvs/Empty.h>
#include <gazebo_msgs/SetModelState.h>
#include <gazebo_msgs/ModelState.h>
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/DeleteModel.h>
#include <gazebo_msgs/ContactsState.h>
#include <geometry_msgs/Pose.h>
#include <nav_msgs/Odometry.h>
#include <stdlib.h>
#include <vector>
#include <std_msgs/String.h>
#include <eigen_functionalities.h>
#include <std_msgs/Float64.h>

#include "sensor_msgs/JointState.h"
#include "trajectory_msgs/JointTrajectory.h"

#include "grasping_gym_actions/iiwa.h"



class graspingActions{

private:
    ros::NodeHandle nh;

    // ----------- Gym Interaction ----------------- //
    ros::ServiceServer makeEnvStep_;
    ros::ServiceServer resetEnv_;

    // ----------- Gazebo Interaction -------------- //
    ros::ServiceClient resetGazeboEnv_;
    ros::ServiceClient setModelState_;
    ros::ServiceClient getModelState_;
    ros::ServiceClient gazeboPausePhysics_;
    ros::ServiceClient gazeboResumePhysics_;

    // ---------- Enviroment interacton -------------//
    ros::Subscriber omnirob_link_collision_subscriber_;
    ros::Subscriber joint_states_sub;   
    ros::Publisher action_publisher_arm_;
    ros::Publisher action_publisher_gripper_;

    //tf::TransformListener tfListener_;
 
    bool collision_;
    float current_x_;
    float current_y_;
    float current_yaw_;
    float box_x_;
    float box_y_;
    int action_dim_;
    int state_dim_;
    int max_step;
    std::string groundPlaneGazeboName_;

    bool makeEnvStepCb(grasping_gym_actions::makeEnvStep::Request & req, grasping_gym_actions::makeEnvStep::Response & res);
    bool resetEnvCb(grasping_gym_actions::resetEnv::Request & req, grasping_gym_actions::resetEnv::Response & res);

    bool setGazeboModelPose(std::string modelName, std::string referenceFrame,geometry_msgs::Pose pose);
    bool getModelPose(std::string modelName,geometry_msgs::Pose & pose);
    float getRandomDouble(float min, float max);

    bool addTableToScene(float height, float width,float thickness);
    void checkCollisionCb(const gazebo_msgs::ContactsState::ConstPtr & msg);

    float getReward(int time,bool failed,  KDL::Frame cartesian_frame);

    std::vector<float> getPose();


    void jointStateCb(const sensor_msgs::JointState::ConstPtr& msg);
    sensor_msgs::JointState joint_states_;
    trajectory_msgs::JointTrajectory action_msg_;

    // Related with Inverse Kinematics
    robots::Iiwa robot_;








public:
    graspingActions();
    ~graspingActions();
    bool setRobotInitialPose();
    //bool setMiiwaBaseInitialPoseByJoints();
    bool setBoxInitialPose();

};
#endif //grasping_gym_actions_MIIWA_grasping_gym_actions_HPP
