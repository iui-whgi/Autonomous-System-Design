
(cl:in-package :asdf)

(defsystem "my_custom_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CountingAction" :depends-on ("_package_CountingAction"))
    (:file "_package_CountingAction" :depends-on ("_package"))
    (:file "CountingActionFeedback" :depends-on ("_package_CountingActionFeedback"))
    (:file "_package_CountingActionFeedback" :depends-on ("_package"))
    (:file "CountingActionGoal" :depends-on ("_package_CountingActionGoal"))
    (:file "_package_CountingActionGoal" :depends-on ("_package"))
    (:file "CountingActionResult" :depends-on ("_package_CountingActionResult"))
    (:file "_package_CountingActionResult" :depends-on ("_package"))
    (:file "CountingFeedback" :depends-on ("_package_CountingFeedback"))
    (:file "_package_CountingFeedback" :depends-on ("_package"))
    (:file "CountingGoal" :depends-on ("_package_CountingGoal"))
    (:file "_package_CountingGoal" :depends-on ("_package"))
    (:file "CountingResult" :depends-on ("_package_CountingResult"))
    (:file "_package_CountingResult" :depends-on ("_package"))
    (:file "Motion" :depends-on ("_package_Motion"))
    (:file "_package_Motion" :depends-on ("_package"))
    (:file "Person" :depends-on ("_package_Person"))
    (:file "_package_Person" :depends-on ("_package"))
  ))