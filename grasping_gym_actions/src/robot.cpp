#include "grasping_gym_actions/robot.h"

// STD LIBRARY
#include <stdexcept>

// ROS LIBRARY
#include <ros/ros.h>

// KDL Library
#include <kdl_parser/kdl_parser.hpp>



namespace robots
{

Robot::Robot(std::string first_segment, std::string last_segment, std::vector<std::string> valid_joints) : valid_joint_names_(valid_joints)
{
  // Get the robot URDF from the parameter
  ros::NodeHandle nh;
  std::string robot_description;
  if(!nh.getParam("robot_description", robot_description))
  {
    throw std::runtime_error("Unable to retrieve param :robot_description");
  }
  // Parse the robot URDF to form a tree
  KDL::Tree robot_tree;
  if (!kdl_parser::treeFromString(robot_description, robot_tree))
  {
    throw std::runtime_error("Unable to parse robot URDF to form the KDL::Tree, aborting execution...");
  }
  if(!robot_tree.getChain(first_segment, last_segment, chain_))
  {
    throw std::runtime_error("Unable to get a KDL::Chain from the KDL::Tree, aborting execution...");
  }
  getJointOrder();
}

unsigned int Robot::getNumberOfJoints()
{
  return chain_.getNrOfJoints();
}

KDL::JntArray Robot::jointStateToKDL(const sensor_msgs::JointState& joint_state)
{
  KDL::JntArray joints(chain_.getNrOfJoints());
  for(unsigned int ii = 0; ii < joints.rows(); ii++)
  {
    for(unsigned int jj = 0; jj < joint_order_.size(); jj++)
    {
      if(joint_state.name[ii] == joint_order_[jj])
      {
        joints(jj) = joint_state.position[ii];
        break;
      }
    }
  }
  return joints;
}

sensor_msgs::JointState Robot::KDLToJointState(const KDL::JntArray& joints)
{
  // Create a message with joint variations
  sensor_msgs::JointState joint_state;
  for(unsigned int ii = 0; ii < chain_.getNrOfJoints(); ii++)
  {
    joint_state.name.push_back(joint_order_[ii]);
    joint_state.position.push_back(joints(ii));
  }
  return joint_state;
}

trajectory_msgs::JointTrajectory Robot::FormJointTrajectory(const std::vector<KDL::JntArray>& joints_trajectory, const std::vector<int> secs_from_start, const std::vector<int> nsecs_from_start)
{
  if (secs_from_start.size() != nsecs_from_start.size())
  {
    throw std::invalid_argument("Seconds vector size must match nanoseconds vector size");
  }
  if (secs_from_start.size() != joints_trajectory.size() && secs_from_start.size() != 1)
  {
    throw std::invalid_argument("Size of time vectors must match joints_trajectory vector");
  }

  trajectory_msgs::JointTrajectory trajectory;
  trajectory.header.stamp = ros::Time::now();
  trajectory.joint_names = joint_order_;
  size_t jj = 0;
  for (auto joints : joints_trajectory)
  {
    trajectory_msgs::JointTrajectoryPoint point;
    point.time_from_start = ros::Duration(secs_from_start[jj], nsecs_from_start[jj]);
    if (secs_from_start.size() != 1)
    {
      jj++;
    }
    for(unsigned int ii = 0; ii < joints.rows(); ii++)
    {
      point.positions.push_back(joints(ii));
    }
    trajectory.points.push_back(point);
  }
  return trajectory;
}

void Robot::getJointOrder()
{
  joint_order_.clear();
  // Look for the first robot segment that has a valid joint
  for(auto ii = 0; joint_order_.size() < chain_.getNrOfJoints(); ii++)
  {
    std::string joint_name = chain_.segments[ii].getJoint().getName();
    if(std::find(valid_joint_names_.begin(), valid_joint_names_.end(), joint_name) != valid_joint_names_.end())
    {
      joint_order_.push_back(joint_name);
    }
  }
}

KDL::JntArray Robot::kdlJntArraySubstraction(KDL::JntArray& first, KDL::JntArray& second)
{
  // If joint array sizes does not match throw exception
  if (first.rows() != second.rows())
  {
    throw std::invalid_argument("Joint array operators sizes don't match");
  }
  KDL::JntArray substraction = first;
  for (unsigned int ii = 0; ii < substraction.rows(); ii++)
  {
    substraction(ii) -= second(ii);
  }
  return substraction;
}

}


