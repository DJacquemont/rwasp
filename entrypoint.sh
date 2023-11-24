#!/bin/bash
set -e

source /opt/ros/humble/setup.bash

cd /ros_ws
colcon build --symlink-install
source /ros_ws/install/setup.bash

# ros2 run multiwii_node multiwii_node

exec "$@"
