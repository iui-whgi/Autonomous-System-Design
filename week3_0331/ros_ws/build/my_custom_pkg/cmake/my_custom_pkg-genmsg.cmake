# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "my_custom_pkg: 9 messages, 0 services")

set(MSG_I_FLAGS "-Imy_custom_pkg:/home/son/Desktop/ros_ws/src/my_custom_pkg/msg;-Imy_custom_pkg:/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(my_custom_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" ""
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" ""
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" "my_custom_pkg/CountingActionFeedback:my_custom_pkg/CountingActionResult:my_custom_pkg/CountingFeedback:actionlib_msgs/GoalID:my_custom_pkg/CountingActionGoal:my_custom_pkg/CountingGoal:my_custom_pkg/CountingResult:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" "std_msgs/Header:my_custom_pkg/CountingGoal:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:actionlib_msgs/GoalID:my_custom_pkg/CountingResult"
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" "my_custom_pkg/CountingFeedback:actionlib_msgs/GoalStatus:std_msgs/Header:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" ""
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" ""
)

get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" NAME_WE)
add_custom_target(_my_custom_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_custom_pkg" "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_cpp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
)

### Generating Services

### Generating Module File
_generate_module_cpp(my_custom_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(my_custom_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(my_custom_pkg_generate_messages my_custom_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_cpp _my_custom_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_custom_pkg_gencpp)
add_dependencies(my_custom_pkg_gencpp my_custom_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_custom_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_eus(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
)

### Generating Services

### Generating Module File
_generate_module_eus(my_custom_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(my_custom_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(my_custom_pkg_generate_messages my_custom_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_eus _my_custom_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_custom_pkg_geneus)
add_dependencies(my_custom_pkg_geneus my_custom_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_custom_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_lisp(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
)

### Generating Services

### Generating Module File
_generate_module_lisp(my_custom_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(my_custom_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(my_custom_pkg_generate_messages my_custom_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_lisp _my_custom_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_custom_pkg_genlisp)
add_dependencies(my_custom_pkg_genlisp my_custom_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_custom_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_nodejs(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(my_custom_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(my_custom_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(my_custom_pkg_generate_messages my_custom_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_nodejs _my_custom_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_custom_pkg_gennodejs)
add_dependencies(my_custom_pkg_gennodejs my_custom_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_custom_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)
_generate_msg_py(my_custom_pkg
  "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
)

### Generating Services

### Generating Module File
_generate_module_py(my_custom_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(my_custom_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(my_custom_pkg_generate_messages my_custom_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Person.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/src/my_custom_pkg/msg/Motion.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingAction.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingActionFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingGoal.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingResult.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/son/Desktop/ros_ws/devel/share/my_custom_pkg/msg/CountingFeedback.msg" NAME_WE)
add_dependencies(my_custom_pkg_generate_messages_py _my_custom_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_custom_pkg_genpy)
add_dependencies(my_custom_pkg_genpy my_custom_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_custom_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_custom_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(my_custom_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(my_custom_pkg_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_custom_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(my_custom_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(my_custom_pkg_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_custom_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(my_custom_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(my_custom_pkg_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_custom_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(my_custom_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(my_custom_pkg_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_custom_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(my_custom_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(my_custom_pkg_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
