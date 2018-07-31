Here Comes the Python Packages .

Python is going to take the work of running the algorithms and we will communicate with Cpp part through  ROS Services.

In order to have The services in the workspace  root do :

source devel/setup.bash

Once, we have access to services we need to install in our conda enviroment the python packages. For that:

sudo pip install -e .

Once installed, we can jump to examples and run box_gym.py:

python box_gym.py