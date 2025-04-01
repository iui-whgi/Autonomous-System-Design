; Auto-generated. Do not edit!


(cl:in-package my_custom_pkg-msg)


;//! \htmlinclude CountingResult.msg.html

(cl:defclass <CountingResult> (roslisp-msg-protocol:ros-message)
  ((final_numbers
    :reader final_numbers
    :initarg :final_numbers
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (result_message
    :reader result_message
    :initarg :result_message
    :type cl:string
    :initform ""))
)

(cl:defclass CountingResult (<CountingResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CountingResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CountingResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_custom_pkg-msg:<CountingResult> is deprecated: use my_custom_pkg-msg:CountingResult instead.")))

(cl:ensure-generic-function 'final_numbers-val :lambda-list '(m))
(cl:defmethod final_numbers-val ((m <CountingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_custom_pkg-msg:final_numbers-val is deprecated.  Use my_custom_pkg-msg:final_numbers instead.")
  (final_numbers m))

(cl:ensure-generic-function 'result_message-val :lambda-list '(m))
(cl:defmethod result_message-val ((m <CountingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_custom_pkg-msg:result_message-val is deprecated.  Use my_custom_pkg-msg:result_message instead.")
  (result_message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CountingResult>) ostream)
  "Serializes a message object of type '<CountingResult>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'final_numbers))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'final_numbers))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result_message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result_message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CountingResult>) istream)
  "Deserializes a message object of type '<CountingResult>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'final_numbers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'final_numbers)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result_message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result_message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CountingResult>)))
  "Returns string type for a message object of type '<CountingResult>"
  "my_custom_pkg/CountingResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CountingResult)))
  "Returns string type for a message object of type 'CountingResult"
  "my_custom_pkg/CountingResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CountingResult>)))
  "Returns md5sum for a message object of type '<CountingResult>"
  "943ce6579b0573eb104ddf192af3fcae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CountingResult)))
  "Returns md5sum for a message object of type 'CountingResult"
  "943ce6579b0573eb104ddf192af3fcae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CountingResult>)))
  "Returns full string definition for message of type '<CountingResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Result~%int32[] final_numbers~%string result_message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CountingResult)))
  "Returns full string definition for message of type 'CountingResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Result~%int32[] final_numbers~%string result_message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CountingResult>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'final_numbers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:length (cl:slot-value msg 'result_message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CountingResult>))
  "Converts a ROS message object to a list"
  (cl:list 'CountingResult
    (cl:cons ':final_numbers (final_numbers msg))
    (cl:cons ':result_message (result_message msg))
))
