#ifndef GRASP_ROBOT_H
#define GRASP_ROBOT_H

// STD LIBRARY
#include <memory>
#include <vector>
#include <string>

// ROS LIBRARY
#include <sensor_msgs/JointState.h>
#include <trajectory_msgs/JointTrajectory.h>

// KDL LIBRARY
#include <kdl/frames.hpp>
#include <kdl/jntarray.hpp>
#include <kdl/chain.hpp>


namespace robots
{

class Robot
{
public:
  Robot(std::string first_segment, std::string last_segment, std::vector<std::string> valid_joints);
  virtual int JntToCart(const KDL::JntArray& , KDL::Frame& ) { return -1; }
  virtual int CartToJnt(const KDL::JntArray& , const KDL::Frame& , KDL::JntArray& ) { return -1; }
  unsigned int getNumberOfJoints();
  KDL::JntArray jointStateToKDL(const sensor_msgs::JointState& joint_state);
  sensor_msgs::JointState KDLToJointState(const KDL::JntArray& joints);
  trajectory_msgs::JointTrajectory FormJointTrajectory(const std::vector<KDL::JntArray>& joints, const std::vector<int> secs_from_start = {1}, const std::vector<int> nsecs_from_start = {0});
  KDL::JntArray kdlJntArraySubstraction(KDL::JntArray& first, KDL::JntArray& second);


protected:
  std::vector<std::string> valid_joint_names_;
  void getJointOrder();

  KDL::Chain chain_;

private:
  std::vector<std::string> joint_order_;
};

}


#endif
