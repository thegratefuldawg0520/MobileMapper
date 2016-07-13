# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mobile_mapper_alpha: 1 messages, 0 services")

set(MSG_I_FLAGS "-Imobile_mapper_alpha:/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mobile_mapper_alpha_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg" NAME_WE)
add_custom_target(_mobile_mapper_alpha_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mobile_mapper_alpha" "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg" "sensor_msgs/NavSatStatus:std_msgs/Header:sensor_msgs/NavSatFix"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mobile_mapper_alpha
  "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobile_mapper_alpha
)

### Generating Services

### Generating Module File
_generate_module_cpp(mobile_mapper_alpha
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobile_mapper_alpha
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mobile_mapper_alpha_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mobile_mapper_alpha_generate_messages mobile_mapper_alpha_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg" NAME_WE)
add_dependencies(mobile_mapper_alpha_generate_messages_cpp _mobile_mapper_alpha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobile_mapper_alpha_gencpp)
add_dependencies(mobile_mapper_alpha_gencpp mobile_mapper_alpha_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobile_mapper_alpha_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mobile_mapper_alpha
  "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobile_mapper_alpha
)

### Generating Services

### Generating Module File
_generate_module_lisp(mobile_mapper_alpha
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobile_mapper_alpha
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mobile_mapper_alpha_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mobile_mapper_alpha_generate_messages mobile_mapper_alpha_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg" NAME_WE)
add_dependencies(mobile_mapper_alpha_generate_messages_lisp _mobile_mapper_alpha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobile_mapper_alpha_genlisp)
add_dependencies(mobile_mapper_alpha_genlisp mobile_mapper_alpha_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobile_mapper_alpha_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mobile_mapper_alpha
  "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobile_mapper_alpha
)

### Generating Services

### Generating Module File
_generate_module_py(mobile_mapper_alpha
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobile_mapper_alpha
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mobile_mapper_alpha_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mobile_mapper_alpha_generate_messages mobile_mapper_alpha_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/doopy/Documents/PixhawkMobileMapper/src/mobile_mapper_alpha/msg/rtklib.msg" NAME_WE)
add_dependencies(mobile_mapper_alpha_generate_messages_py _mobile_mapper_alpha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobile_mapper_alpha_genpy)
add_dependencies(mobile_mapper_alpha_genpy mobile_mapper_alpha_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobile_mapper_alpha_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobile_mapper_alpha)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobile_mapper_alpha
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(mobile_mapper_alpha_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobile_mapper_alpha)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobile_mapper_alpha
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(mobile_mapper_alpha_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobile_mapper_alpha)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobile_mapper_alpha\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobile_mapper_alpha
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(mobile_mapper_alpha_generate_messages_py sensor_msgs_generate_messages_py)
