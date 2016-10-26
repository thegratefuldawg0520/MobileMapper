cmake_minimum_required(VERSION 2.8.3)
project(mobile_mapper_alpha)

find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  image_transport
  roscpp
  rospy
  std_msgs
  mavros
  tf
  sensor_msgs
  geometry_msgs
  usb_cam
)

find_package(OpenCV)
find_package(PCL)
find_package(message_generation)

include_directories(
  ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS} ${PCL_INCLUDE_DIRS}
)

add_executable(world_to_imu_tf src/world_to_imu_tf.cpp)
target_link_libraries(world_to_imu_tf ${catkin_LIBRARIES})

add_message_files(
  FILES
  rtklib.msg
)

generate_messages(
  DEPENDENCIES
  sensor_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime
)

#add_executable(imgConv src/imgConv.cpp)
#target_link_libraries(imgConv ${catkin_LIBRARIES} ${OpenCV_LIBRARIES} ${PCL_LIBRARIES})
#add_dependencies(imgConv ${catkin_EXPORTED_TARGETS})
