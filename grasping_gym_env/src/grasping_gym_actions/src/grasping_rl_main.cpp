#include <ros/ros.h>
#include "grasping_gym_actions/actions.hpp"



int main(int argc, char **argv)
{

	ros::init (argc, argv, "state_machine");
	ros::NodeHandle nh;
	
	ROS_INFO("Starting program...");
		
	ros::AsyncSpinner spinner(0);
	spinner.start();


	graspingActions* grasping_node = new graspingActions();

	while(nh.ok())
	{}



	ros::waitForShutdown();

	ROS_INFO("Program finished");
   
  return 0;	


}