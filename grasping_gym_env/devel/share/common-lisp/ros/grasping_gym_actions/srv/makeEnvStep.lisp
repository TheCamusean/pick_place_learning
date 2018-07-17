; Auto-generated. Do not edit!


(cl:in-package grasping_gym_actions-srv)


;//! \htmlinclude makeEnvStep-request.msg.html

(cl:defclass <makeEnvStep-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (step_n
    :reader step_n
    :initarg :step_n
    :type cl:integer
    :initform 0))
)

(cl:defclass makeEnvStep-request (<makeEnvStep-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <makeEnvStep-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'makeEnvStep-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasping_gym_actions-srv:<makeEnvStep-request> is deprecated: use grasping_gym_actions-srv:makeEnvStep-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <makeEnvStep-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:action-val is deprecated.  Use grasping_gym_actions-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'step_n-val :lambda-list '(m))
(cl:defmethod step_n-val ((m <makeEnvStep-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:step_n-val is deprecated.  Use grasping_gym_actions-srv:step_n instead.")
  (step_n m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <makeEnvStep-request>) ostream)
  "Serializes a message object of type '<makeEnvStep-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'action))
  (cl:let* ((signed (cl:slot-value msg 'step_n)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <makeEnvStep-request>) istream)
  "Deserializes a message object of type '<makeEnvStep-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'action) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'action)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'step_n) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<makeEnvStep-request>)))
  "Returns string type for a service object of type '<makeEnvStep-request>"
  "grasping_gym_actions/makeEnvStepRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'makeEnvStep-request)))
  "Returns string type for a service object of type 'makeEnvStep-request"
  "grasping_gym_actions/makeEnvStepRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<makeEnvStep-request>)))
  "Returns md5sum for a message object of type '<makeEnvStep-request>"
  "c712a2155849fa75c27303831b1cb309")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'makeEnvStep-request)))
  "Returns md5sum for a message object of type 'makeEnvStep-request"
  "c712a2155849fa75c27303831b1cb309")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<makeEnvStep-request>)))
  "Returns full string definition for message of type '<makeEnvStep-request>"
  (cl:format cl:nil "float32[] action~%int32 step_n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'makeEnvStep-request)))
  "Returns full string definition for message of type 'makeEnvStep-request"
  (cl:format cl:nil "float32[] action~%int32 step_n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <makeEnvStep-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'action) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <makeEnvStep-request>))
  "Converts a ROS message object to a list"
  (cl:list 'makeEnvStep-request
    (cl:cons ':action (action msg))
    (cl:cons ':step_n (step_n msg))
))
;//! \htmlinclude makeEnvStep-response.msg.html

(cl:defclass <makeEnvStep-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (next_state
    :reader next_state
    :initarg :next_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (reward
    :reader reward
    :initarg :reward
    :type cl:float
    :initform 0.0)
   (done
    :reader done
    :initarg :done
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass makeEnvStep-response (<makeEnvStep-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <makeEnvStep-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'makeEnvStep-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasping_gym_actions-srv:<makeEnvStep-response> is deprecated: use grasping_gym_actions-srv:makeEnvStep-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <makeEnvStep-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:success-val is deprecated.  Use grasping_gym_actions-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <makeEnvStep-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:message-val is deprecated.  Use grasping_gym_actions-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'next_state-val :lambda-list '(m))
(cl:defmethod next_state-val ((m <makeEnvStep-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:next_state-val is deprecated.  Use grasping_gym_actions-srv:next_state instead.")
  (next_state m))

(cl:ensure-generic-function 'reward-val :lambda-list '(m))
(cl:defmethod reward-val ((m <makeEnvStep-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:reward-val is deprecated.  Use grasping_gym_actions-srv:reward instead.")
  (reward m))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <makeEnvStep-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasping_gym_actions-srv:done-val is deprecated.  Use grasping_gym_actions-srv:done instead.")
  (done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <makeEnvStep-response>) ostream)
  "Serializes a message object of type '<makeEnvStep-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'next_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'next_state))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'reward))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'done) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <makeEnvStep-response>) istream)
  "Deserializes a message object of type '<makeEnvStep-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'next_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'next_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reward) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'done) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<makeEnvStep-response>)))
  "Returns string type for a service object of type '<makeEnvStep-response>"
  "grasping_gym_actions/makeEnvStepResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'makeEnvStep-response)))
  "Returns string type for a service object of type 'makeEnvStep-response"
  "grasping_gym_actions/makeEnvStepResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<makeEnvStep-response>)))
  "Returns md5sum for a message object of type '<makeEnvStep-response>"
  "c712a2155849fa75c27303831b1cb309")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'makeEnvStep-response)))
  "Returns md5sum for a message object of type 'makeEnvStep-response"
  "c712a2155849fa75c27303831b1cb309")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<makeEnvStep-response>)))
  "Returns full string definition for message of type '<makeEnvStep-response>"
  (cl:format cl:nil "bool success~%string message~%float32[] next_state~%float32 reward~%bool done~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'makeEnvStep-response)))
  "Returns full string definition for message of type 'makeEnvStep-response"
  (cl:format cl:nil "bool success~%string message~%float32[] next_state~%float32 reward~%bool done~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <makeEnvStep-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'next_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <makeEnvStep-response>))
  "Converts a ROS message object to a list"
  (cl:list 'makeEnvStep-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
    (cl:cons ':next_state (next_state msg))
    (cl:cons ':reward (reward msg))
    (cl:cons ':done (done msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'makeEnvStep)))
  'makeEnvStep-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'makeEnvStep)))
  'makeEnvStep-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'makeEnvStep)))
  "Returns string type for a service object of type '<makeEnvStep>"
  "grasping_gym_actions/makeEnvStep")