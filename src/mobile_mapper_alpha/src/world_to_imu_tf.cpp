#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <sensor_msgs/Imu.h>



tf::StampedTransform transform_;
tf::Quaternion tmp_;

void imuCallback(const sensor_msgs::Imu& imu_msg){
	
	static tf::TransformBroadcaster tfB_;
	
	tf::quaternionMsgToTF(imu_msg.orientation, tmp_);
	
	tfScalar yaw, pitch, roll;
	
	tf::Matrix3x3(tmp_).getRPY(roll, pitch, yaw);
	
	tmp_.setRPY(roll, pitch, yaw);
	
	transform_.setRotation(tmp_);
	
	transform_.stamp_ = imu_msg.header.stamp;
	
	tfB_.sendTransform(transform_);
	
}

int main(int argc, char** argv){
	
  //Initialize transform node
  ros::init(argc, argv, "world_to_imu_tf_publisher");
  
  ros::NodeHandle node;

  std::string p_base_stabilized_frame_ = "map";
  std::string p_base_frame_ = "fcu";  

  transform_.getOrigin().setX(0.0);
  transform_.getOrigin().setY(0.0);
  transform_.getOrigin().setZ(0.0);

  transform_.frame_id_ = p_base_stabilized_frame_;
  transform_.child_frame_id_ = p_base_frame_;
  
  ros::Subscriber sub = node.subscribe("mavros/imu/data", 100, &imuCallback);
  
  ros::spin();
  
  return 0;
}

