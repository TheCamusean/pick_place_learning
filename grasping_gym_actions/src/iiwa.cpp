#include "grasping_gym_actions/iiwa.h"


namespace robots
{

Iiwa::Iiwa(std::string first_segment, std::string last_segment) : Robot(first_segment, last_segment, {"lbr_iiwa_joint_1", "lbr_iiwa_joint_2", "lbr_iiwa_joint_3", "lbr_iiwa_joint_4",
 "lbr_iiwa_joint_5", "lbr_iiwa_joint_6","lbr_iiwa_joint_7"})
{
  // Generate the solvers
  // Use the robot chain to generate a forward kinematic solver
  fk_solver_ = std::make_unique<KDL::ChainFkSolverPos_recursive>(chain_);
  // Create joint arrays with joint limits
  KDL::JntArray lower_joint_limits(chain_.getNrOfJoints());
  KDL::JntArray upper_joint_limits(chain_.getNrOfJoints());
  for(unsigned int ii = 0; ii < chain_.getNrOfJoints(); ii++)
  {
    lower_joint_limits.data[ii] = -2.0F*M_PI;
    upper_joint_limits.data[ii] = 2.0F*M_PI;
  }
  ik_solver_ = std::make_unique<TRAC_IK::TRAC_IK>(chain_, lower_joint_limits, upper_joint_limits);
}

int Iiwa::JntToCart(const KDL::JntArray &joints, KDL::Frame &cartesian)
{
  return fk_solver_->JntToCart(joints, cartesian);
}

int Iiwa::CartToJnt(const KDL::JntArray &joints_init, const KDL::Frame &cartesian, KDL::JntArray &joints)
{
  return ik_solver_->CartToJnt(joints_init, cartesian, joints);
}

}


