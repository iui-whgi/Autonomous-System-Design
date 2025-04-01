#!/usr/bin/env python3

import rospy
import time
import actionlib
from my_custom_pkg.msg import CountingAction, CountingFeedback, CountingResult

def execute_cb(goal):
    max_num = goal.max_number
    feedback = CountingFeedback()
    result = CountingResult()

    for i in range(1, max_num + 1):
        feedback.current_number = i
        server.publish_feedback(feedback)
        rospy.loginfo(f"Counting: {i}")
        time.sleep(1)

    result.result_message = f"Finished counting up to {max_num}!"
    server.set_succeeded(result)

def main():
    global server
    rospy.init_node('counting_server')
    server = actionlib.SimpleActionServer('counting', CountingAction, execute_cb, False)
    server.start()
    rospy.loginfo("Counting Action Server Started")
    rospy.spin()

if __name__ == '__main__':
    main()

