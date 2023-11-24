FROM ros:humble-ros-core

RUN apt update && apt install -y --no-install-recommends \
    python3-pip python3-colcon-common-extensions \
    build-essential cmake nano git iproute2 udev usbutils \
    ros-humble-mavros-msgs ros-humble-tf2-ros libeigen3-dev\
    ninja-build libasio-dev \
    && rm -rf /var/lib/apt/lists/*

# Create a directory
WORKDIR /ros_ws/src

# Copy files
COPY asio-1.20.0 asio-1.20.0
COPY msp msp
COPY multiwii_ros2 multiwii_ros2

# Build
WORKDIR /ros_ws/src/msp
RUN cmake -B build -GNinja -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
