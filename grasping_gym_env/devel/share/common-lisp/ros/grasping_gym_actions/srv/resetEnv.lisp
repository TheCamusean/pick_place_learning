; Auto-generated. Do not edit!


(cl:in-package grasping_gym_actions-srv)


;//! \htmlinclude resetEnv-request.msg.html

(cl:defclass <resetEnv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass resetEnv-request (<resetEnv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetEnv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetEnv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasping_gym_actions-srv:<resetEnv-request> is deprecated: use grasping_gym_actions-srv:resetEnv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetEnv-request>) ostream)
  "Serializes a message object of type '<resetEnv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetEnv-request>) istream)
  "Deserializes a message object of type '<resetEnv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetEnv-request>)))
  "Returns string type for a service object of type '<resetEnv-request>"
  "grasping_gym_actions/resetEnvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetEnv-request)))
  "Returns string type for a service object of type 'resetEnv-request"
  "grasping_gym_actions/resetEnvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetEnv-request>)))
  "Returns md5sum for a message object of type '<resetEnv-request>"
  "088e9c4476fc19677acf3a00f86ee390")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetEnv-request)))
  "Returns md5sum for a message object of type 'resetEnv-request"
  "088e9c4476fc19677acf3a00f86ee390")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetEnv-request>)))
  "Returns full string definition for message of type '<resetEnv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetEnv-request)))
  "Returns full string definition for message of type 'resetEnv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetEnv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetEnv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'resetEnv-request
))
;//! \htmlinclude resetEnv-response.msg.html

(cl:defclass <resetEnv-response> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass resetEnv-response (<resetEnv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetEnv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetEnv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasping_gym_actions-srv:<resetEnv-response> is deprecated: use grasping_gym_actions-srv:resetEnv-response instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <resetEnv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:state-val is deprecated.  Use grasping_gym_actions-srv:state instead.")
  (state m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <resetEnv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:success-val is deprecated.  Use grasping_gym_actions-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <resetEnv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:message-val is deprecated.  Use grasping_gym_actions-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetEnv-response>) ostream)
  "Serializes a message object of type '<resetEnv-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'state))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetEnv-response>) istream)
  "Deserializes a message object of type '<resetEnv-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetEnv-response>)))
  "Returns string type for a service object of type '<resetEnv-response>"
  "grasping_gym_actions/resetEnvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetEnv-response)))
  "Returns string type for a service object of type 'resetEnv-response"
  "grasping_gym_actions/resetEnvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetEnv-response>)))
  "Returns md5sum for a message object of type '<resetEnv-response>"
  "088e9c4476fc19677acf3a00f86ee390")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetEnv-response)))
  "Returns md5sum for a message object of type 'resetEnv-response"
  "088e9c4476fc19677acf3a00f86ee390")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetEnv-response>)))
  "Returns full string definition for message of type '<resetEnv-response>"
  (cl:format cl:nil "float32[] state~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetEnv-response)))
  "Returns full string definition for message of type 'resetEnv-response"
  (cl:format cl:nil "float32[] state~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetEnv-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetEnv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'resetEnv-response
    (cl:cons ':state (state msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'resetEnv)))
  'resetEnv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'resetEnv)))
  'resetEnv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetEnv)))
  "Returns string type for a service object of type '<resetEnv>"
  "grasping_gym_actions/resetEnv")