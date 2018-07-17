import logging
from gym.envs.registration import register

logger = logging.getLogger(__name__)

# Gazebo
# ----------------------------------------

# Example envs
register(
    id='GraspingGym-v0',
    entry_point='grasping_gym_env.envs.box:GraspingGym',
    # More arguments here
)