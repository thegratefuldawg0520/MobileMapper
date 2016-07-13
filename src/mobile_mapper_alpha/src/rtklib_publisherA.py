#!/usr/bin/env python
import rospy
import roslib
import numpy as np
import subprocess
from std_msgs.msg import String
import socket
from sensor_msgs.msg import Imu, NavSatFix, NavSatStatus
from mobile_mapper_alpha.msg import rtklib

#This class is designed to test the three different RTK Processing Modes in
#RTKRCV, convert them into ECEF coordinates, store the data into their rtklib 
#ROS message and publish the message over the ROS environment
class RtklibPublisher(object):
	
	#RtklibPublisher Node Constructor
	def __init__(self):
		
		#Initialize the ROS Node
		rospy.init_node('rtklib_publisher')
		
		subprocess.call(["/home/doopy/Documents/RTKLIB-master/app/rtkrcv/gcc/rtkrcv", "-s", "-o", "/home/doopy/Documents/RTKLIB-master/app/rtkrcv/gcc/confFiles/rtkDynamicGRAC0.conf"])
		
		#Initialize and store the ROS Topics
		self.static_pub = rospy.Publisher('rtklib', rtklib, queue_size=2)
		
		#Call the callback function
		self.callback()
		
	def callback(self):
		
		#Publish data at 1 Hz
		rate = rospy.Rate(1)
		
		#Define the RTKRCV server ports corresponding to each of the processing
		#Modes
		port = 5801
		
		sock = socket.socket()
		host = socket.gethostname()
		sock.connect((host, port))
		
		#WGS84 Parameters
		e2 = 6.69437999014e-3
		a = 6378137.0
		
		#At a rate of 1 hz, create an rtklib message for each socket and publish
		#the data over 
		while not rospy.is_shutdown():
		
			#Create and RTKLIB and a NavSatFix data structure
			rtk = rtklib()
			navsat = NavSatFix()
					
			#Set the data structure header time to the current system time
			navsat.header.stamp = rospy.Time.now()
			rtk.header.stamp = rospy.Time.now()	
					
			#Get the position message from the RTKRCV server
			msgStr = socket.recv(1024)
				
			#Split the message
			msg = msgStr.split()
					
			#Save the latitude, longitude and ellipsoid height
			navsat.latitude = float(msg[2])
			navsat.longitude = float(msg[3])
			navsat.altitude = float(msg[4])
					
			#Save the position covariance
			navsat.position_covariance = [float(msg[7]),float(msg[10]),float(msg[12]),float(msg[10]),float(msg[8]),float(msg[11]),float(msg[12]),float(msg[11]),float(msg[9])]
			navsat.position_covariance_type = NavSatFix.COVARIANCE_TYPE_KNOWN
					
			#Compute the radius of curvature in the 
			N = 1.0*a/np.sqrt(1-e2*(np.sin(float(msg[2])*np.pi/180.0)**2))
					
			#Compute and store the ECEF position
			rtk.x =  (N+float(msg[4]))*np.cos(float(msg[2])*np.pi/180.0)*np.cos(float(msg[3])*np.pi/180.0)
			rtk.y = (N+float(msg[4]))*np.cos(float(msg[2])*np.pi/180.0)*np.sin(float(msg[3])*np.pi/180.0)
			rtk.z = (N*(1-e2)+float(msg[4]))*np.sin(float(msg[2])*np.pi/180.0)
			rtk.delay = float(msg[13])
			rtk.ftest = float(msg[14])
					
			#Store the NavSatFix data
			rtk.state = navsat
				
			pubs[i].publish(rtk)
				
			rate.sleep()

#Main Function
if __name__ == '__main__':
	
	node = RtklibPublisher()
	rospy.spin()
