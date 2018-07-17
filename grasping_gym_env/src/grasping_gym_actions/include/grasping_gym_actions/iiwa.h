#ifndef GRASP_ROBOT_IIWA_H
#define GRASP_ROBOT_IIWA_H

#include "grasping_gym_actions/robot.h"

// STD LIBRARY
#include <memory>

// KDL LIBRARY
#include <kdl/chainfksolverpos_recursive.hpp>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
// TRAC_IK LIBRARY
#include <trac_ik/trac_ik.hpp>
#pragma GCC diagnostic pop



namespace robots
{

class Iiwa : Robot
{
public:
  Iiwa(std::string first_segment, std::string last_segment);
  int JntToCart(const KDL::JntArray &joints, KDL::Frame &cartesian);
  int CartToJnt(const KDL::JntArray &joints_init, const KDL::Frame &cartesian, KDL::JntArray &joints);
  using Robot::jointStateToKDL;
  using Robot::KDLToJointState;
  using Robot::FormJointTrajectory;
  using Robot::getNumberOfJoints;
  using Robot::kdlJntArraySubstraction;

private:
  std::unique_ptr<KDL::ChainFkSolverPos_recursive> fk_solver_;
  std::unique_ptr<TRAC_IK::TRAC_IK> ik_solver_;
};

}



#endif
