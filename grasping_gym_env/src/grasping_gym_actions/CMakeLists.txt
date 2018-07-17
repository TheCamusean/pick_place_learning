cmake_minimum_required(VERSION 2.8.3)
project(grasping_gym_actions)

## Compile as C++14, supported in ROS Kinetic and newer
add_compile_options(-std=c++14)

## Complain about everything
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")


find_package(catkin REQUIRED COMPONENTS 
	std_msgs
	sensor_msgs 
	trajectory_msgs 
	roscpp rospy 
	actionlib 
	control_msgs
	message_generation
	cmake_modules

	kdl_parser
	trac_ik_lib
	)


find_package(Eigen3 REQUIRED)

find_package(orocos_kdl REQUIRED)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)
#find_package(fcl REQUIRED)

set(eigen_functionalities_DIR "/usr/local/lib/cmake/eigen_functionalities")
find_package(eigen_functionalities REQUIRED)

set(trajectory_generator_DIR "/usr/local/lib/cmake/trajectory_generator")
find_package(trajectory_generator REQUIRED)


## Generate services in the 'srv' folder
 add_service_files(
   FILES
    makeEnvStep.srv
    resetEnv.srv

 )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
generate_messages(
   DEPENDENCIES
   std_msgs
 )

###################################
## catkin specific configuration ##
###################################
catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS message_runtime kdl_parser trac_ik_lib
#  DEPENDS system_lib
)

###########
## Build ##
###########




include_directories(include ${catkin_INCLUDE_DIRS} ${Eigen_INCLUDE_DIRS} ${EIGEN_FUNCTIONALITIES_INCLUDE_DIRS} ${TRAJECTORY_GENERATOR_INCLUDE_DIRS})

add_library(actions src/actions.cpp include/grasping_gym_actions/actions.hpp)
add_library(robot_lib src/robot.cpp src/iiwa.cpp)

target_link_libraries(robot_lib ${catkin_LIBRARIES} ${EIGEN_FUNCTIONALITIES_LIBRARIES}  ${TRAJECTORY_GENERATOR_LIBRARIES})

add_dependencies(robot_lib ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})



target_link_libraries(actions robot_lib ${catkin_LIBRARIES} ${EIGEN_FUNCTIONALITIES_LIBRARIES}  ${TRAJECTORY_GENERATOR_LIBRARIES})

add_dependencies(actions robot_lib ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})




add_executable(grasping_rl_main src/grasping_rl_main.cpp)
target_link_libraries(grasping_rl_main  actions ${catkin_LIBRARIES} ${EIGEN_FUNCTIONALITIES_LIBRARIES}  ${TRAJECTORY_GENERATOR_LIBRARIES})
add_dependencies(grasping_rl_main actions ${catkin_LIBRARIES} ${EIGEN_FUNCTIONALITIES_LIBRARIES}  ${TRAJECTORY_GENERATOR_LIBRARIES})
