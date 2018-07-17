;; Auto-generated. Do not edit!


(when (boundp 'grasping_gym_actions::resetEnv)
  (if (not (find-package "GRASPING_GYM_ACTIONS"))
    (make-package "GRASPING_GYM_ACTIONS"))
  (shadow 'resetEnv (find-package "GRASPING_GYM_ACTIONS")))
(unless (find-package "GRASPING_GYM_ACTIONS::RESETENV")
  (make-package "GRASPING_GYM_ACTIONS::RESETENV"))
(unless (find-package "GRASPING_GYM_ACTIONS::RESETENVREQUEST")
  (make-package "GRASPING_GYM_ACTIONS::RESETENVREQUEST"))
(unless (find-package "GRASPING_GYM_ACTIONS::RESETENVRESPONSE")
  (make-package "GRASPING_GYM_ACTIONS::RESETENVRESPONSE"))

(in-package "ROS")





(defclass grasping_gym_actions::resetEnvRequest
  :super ros::object
  :slots ())

(defmethod grasping_gym_actions::resetEnvRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass grasping_gym_actions::resetEnvResponse
  :super ros::object
  :slots (_state _success _message ))

(defmethod grasping_gym_actions::resetEnvResponse
  (:init
   (&key
    ((:state __state) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _state __state)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; float32[] _state
    (* 4    (length _state)) 4
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _state
     (write-long (length _state) s)
     (dotimes (i (length _state))
       (sys::poke (elt _state i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _state i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass grasping_gym_actions::resetEnv
  :super ros::object
  :slots ())

(setf (get grasping_gym_actions::resetEnv :md5sum-) "088e9c4476fc19677acf3a00f86ee390")
(setf (get grasping_gym_actions::resetEnv :datatype-) "grasping_gym_actions/resetEnv")
(setf (get grasping_gym_actions::resetEnv :request) grasping_gym_actions::resetEnvRequest)
(setf (get grasping_gym_actions::resetEnv :response) grasping_gym_actions::resetEnvResponse)

(defmethod grasping_gym_actions::resetEnvRequest
  (:response () (instance grasping_gym_actions::resetEnvResponse :init)))

(setf (get grasping_gym_actions::resetEnvRequest :md5sum-) "088e9c4476fc19677acf3a00f86ee390")
(setf (get grasping_gym_actions::resetEnvRequest :datatype-) "grasping_gym_actions/resetEnvRequest")
(setf (get grasping_gym_actions::resetEnvRequest :definition-)
      "---
float32[] state
bool success
string message

")

(setf (get grasping_gym_actions::resetEnvResponse :md5sum-) "088e9c4476fc19677acf3a00f86ee390")
(setf (get grasping_gym_actions::resetEnvResponse :datatype-) "grasping_gym_actions/resetEnvResponse")
(setf (get grasping_gym_actions::resetEnvResponse :definition-)
      "---
float32[] state
bool success
string message

")



(provide :grasping_gym_actions/resetEnv "088e9c4476fc19677acf3a00f86ee390")


