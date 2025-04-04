// Generated by gencpp from file my_custom_pkg/CountingActionGoal.msg
// DO NOT EDIT!


#ifndef MY_CUSTOM_PKG_MESSAGE_COUNTINGACTIONGOAL_H
#define MY_CUSTOM_PKG_MESSAGE_COUNTINGACTIONGOAL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <actionlib_msgs/GoalID.h>
#include <my_custom_pkg/CountingGoal.h>

namespace my_custom_pkg
{
template <class ContainerAllocator>
struct CountingActionGoal_
{
  typedef CountingActionGoal_<ContainerAllocator> Type;

  CountingActionGoal_()
    : header()
    , goal_id()
    , goal()  {
    }
  CountingActionGoal_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , goal_id(_alloc)
    , goal(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
  _goal_id_type goal_id;

   typedef  ::my_custom_pkg::CountingGoal_<ContainerAllocator>  _goal_type;
  _goal_type goal;





  typedef boost::shared_ptr< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> const> ConstPtr;

}; // struct CountingActionGoal_

typedef ::my_custom_pkg::CountingActionGoal_<std::allocator<void> > CountingActionGoal;

typedef boost::shared_ptr< ::my_custom_pkg::CountingActionGoal > CountingActionGoalPtr;
typedef boost::shared_ptr< ::my_custom_pkg::CountingActionGoal const> CountingActionGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator1> & lhs, const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.goal_id == rhs.goal_id &&
    lhs.goal == rhs.goal;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator1> & lhs, const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace my_custom_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "436c70b188a4f65f17994edafb64bfe7";
  }

  static const char* value(const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x436c70b188a4f65fULL;
  static const uint64_t static_value2 = 0x17994edafb64bfe7ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_custom_pkg/CountingActionGoal";
  }

  static const char* value(const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"CountingGoal goal\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: my_custom_pkg/CountingGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# CountingAction.action\n"
"# Goal\n"
"int32 max_number\n"
;
  }

  static const char* value(const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.goal_id);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CountingActionGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_custom_pkg::CountingActionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_custom_pkg::CountingActionGoal_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "goal_id: ";
    s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "goal: ";
    s << std::endl;
    Printer< ::my_custom_pkg::CountingGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_CUSTOM_PKG_MESSAGE_COUNTINGACTIONGOAL_H
