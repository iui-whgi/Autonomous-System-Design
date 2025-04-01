;; Auto-generated. Do not edit!


(when (boundp 'my_custom_pkg::Motion)
  (if (not (find-package "MY_CUSTOM_PKG"))
    (make-package "MY_CUSTOM_PKG"))
  (shadow 'Motion (find-package "MY_CUSTOM_PKG")))
(unless (find-package "MY_CUSTOM_PKG::MOTION")
  (make-package "MY_CUSTOM_PKG::MOTION"))

(in-package "ROS")
;;//! \htmlinclude Motion.msg.html


(defclass my_custom_pkg::Motion
  :super ros::object
  :slots (_move_x _move_y ))

(defmethod my_custom_pkg::Motion
  (:init
   (&key
    ((:move_x __move_x) 0)
    ((:move_y __move_y) 0)
    )
   (send-super :init)
   (setq _move_x (round __move_x))
   (setq _move_y (round __move_y))
   self)
  (:move_x
   (&optional __move_x)
   (if __move_x (setq _move_x __move_x)) _move_x)
  (:move_y
   (&optional __move_y)
   (if __move_y (setq _move_y __move_y)) _move_y)
  (:serialization-length
   ()
   (+
    ;; int32 _move_x
    4
    ;; int32 _move_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _move_x
       (write-long _move_x s)
     ;; int32 _move_y
       (write-long _move_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _move_x
     (setq _move_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _move_y
     (setq _move_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_custom_pkg::Motion :md5sum-) "a4a87f7185f394984e658d3952988396")
(setf (get my_custom_pkg::Motion :datatype-) "my_custom_pkg/Motion")
(setf (get my_custom_pkg::Motion :definition-)
      "int32 move_x
int32 move_y
")



(provide :my_custom_pkg/Motion "a4a87f7185f394984e658d3952988396")


