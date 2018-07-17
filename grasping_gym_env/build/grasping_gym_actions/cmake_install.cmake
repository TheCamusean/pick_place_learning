# Install script for directory: /home/jurain/Documents/conda_3.6/grasping_gym_env/src/grasping_gym_actions

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jurain/Documents/conda_3.6/grasping_gym_env/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasping_gym_actions/srv" TYPE FILE FILES
    "/home/jurain/Documents/conda_3.6/grasping_gym_env/src/grasping_gym_actions/srv/makeEnvStep.srv"
    "/home/jurain/Documents/conda_3.6/grasping_gym_env/src/grasping_gym_actions/srv/resetEnv.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasping_gym_actions/cmake" TYPE FILE FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/build/grasping_gym_actions/catkin_generated/installspace/grasping_gym_actions-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/devel/include/grasping_gym_actions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/devel/share/roseus/ros/grasping_gym_actions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/devel/share/common-lisp/ros/grasping_gym_actions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/devel/share/gennodejs/ros/grasping_gym_actions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/jurain/Documents/conda_3.6/grasping_gym_env/devel/lib/python2.7/dist-packages/grasping_gym_actions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/devel/lib/python2.7/dist-packages/grasping_gym_actions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/build/grasping_gym_actions/catkin_generated/installspace/grasping_gym_actions.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasping_gym_actions/cmake" TYPE FILE FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/build/grasping_gym_actions/catkin_generated/installspace/grasping_gym_actions-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasping_gym_actions/cmake" TYPE FILE FILES
    "/home/jurain/Documents/conda_3.6/grasping_gym_env/build/grasping_gym_actions/catkin_generated/installspace/grasping_gym_actionsConfig.cmake"
    "/home/jurain/Documents/conda_3.6/grasping_gym_env/build/grasping_gym_actions/catkin_generated/installspace/grasping_gym_actionsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasping_gym_actions" TYPE FILE FILES "/home/jurain/Documents/conda_3.6/grasping_gym_env/src/grasping_gym_actions/package.xml")
endif()

