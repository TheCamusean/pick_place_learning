import gym
import rospy
import roslaunch
import time
import numpy as np

from gym import utils, spaces
from grasping_gym_env.envs import gazebo_env
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty

from sensor_msgs.msg import JointState
from nav_msgs.msg import Odometry

from grasping_gym_actions.srv import makeEnvStep
from grasping_gym_actions.srv import resetEnv
from math import pi as pi


from gym.utils import seeding

class GraspingGym(gazebo_env.GazeboEnv):

    def __init__(self):
        # gazebo_env.GazeboEnv.__init__(self, "iiwa_gripper_spawn.launch")

        print("Add reset and step services")
        self.reset_env_srv_ = rospy.ServiceProxy("resetEnv",resetEnv)
        self.make_step_srv_ = rospy.ServiceProxy("makeEnvStep",makeEnvStep)
        print("-----------------------------")

        self.episode_step_n_ = 0
        self.max_episode_step_n_=1000
        self.action_space_dim_=7
        self.observation_space_dim_=7
        self.box_pose_constant_=True

        action_up_bounds_=0.05*np.ones(self.action_space_dim_)
        action_down_bounds_=-action_up_bounds_

        observation_space_up_bounds_=np.ones(self.observation_space_dim_)
        observation_space_up_bounds_[0]*=1
        observation_space_up_bounds_[1]*=1
        observation_space_up_bounds_[2]*=1
        observation_space_up_bounds_[3]*=1
        observation_space_up_bounds_[4]*=1
        observation_space_up_bounds_[5]*=1

        observation_space_down_bounds_=-observation_space_up_bounds_

        self.action_space=spaces.Box(action_down_bounds_, action_up_bounds_)
        self.observation_space=spaces.Box(observation_space_down_bounds_, observation_space_up_bounds_)

        print("End Initialization")

    def add_episode_step(self):
        self.episode_step_n_=self.episode_step_n_+1

    def reset_episode_step(self):
        self.episode_step_n_ = 0
    def set_max_episode_n(self,n):
        self.max_episode_step_n_=n

    def _step(self, action):
        rospy.wait_for_service("makeEnvStep")
        self.add_episode_step()
        try:
            step_res=self.make_step_srv_(action, self.episode_step_n_)
            return step_res.next_state, step_res.reward, step_res.done, {}

        except (rospy.ServiceException):
            rospy.logerr("Error calling reset service.")

        print("step")

    def _reset(self):
        print("reset")
        rospy.wait_for_service("resetEnv")
        print("reset_work")
        print(self.episode_step_n_)
        self.reset_episode_step()
        print(self.episode_step_n_)
        try:
            reset_res=self.reset_env_srv_()
            state = reset_res.state
            #print(state)
            return state

        except rospy.ServiceException:
            rospy.logerr("Error calling reset service.")

    def _configure(self):
        print("configure")

    def _seed(self, seed_val=0):
        print("seed")

    def _close(self):
        print("close")

    def _render(self, mode="human", close=False):
        print("render")
