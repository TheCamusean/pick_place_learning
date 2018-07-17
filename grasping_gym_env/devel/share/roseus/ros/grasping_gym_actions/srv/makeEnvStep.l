;; Auto-generated. Do not edit!


(when (boundp 'grasping_gym_actions::makeEnvStep)
  (if (not (find-package "GRASPING_GYM_ACTIONS"))
    (make-package "GRASPING_GYM_ACTIONS"))
  (shadow 'makeEnvStep (find-package "GRASPING_GYM_ACTIONS")))
(unless (find-package "GRASPING_GYM_ACTIONS::MAKEENVSTEP")
  (make-package "GRASPING_GYM_ACTIONS::MAKEENVSTEP"))
(unless (find-package "GRASPING_GYM_ACTIONS::MAKEENVSTEPREQUEST")
  (make-package "GRASPING_GYM_ACTIONS::MAKEENVSTEPREQUEST"))
(unless (find-package "GRASPING_GYM_ACTIONS::MAKEENVSTEPRESPONSE")
  (make-package "GRASPING_GYM_ACTIONS::MAKEENVSTEPRESPONSE"))

(in-package "ROS")





(defclass grasping_gym_actions::makeEnvStepRequest
  :super ros::object
  :slots (_action _step_n ))

(defmethod grasping_gym_actions::makeEnvStepRequest
  (:init
   (&key
    ((:action __action) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:step_n __step_n) 0)
    )
   (send-super :init)
   (setq _action __action)
   (setq _step_n (round __step_n))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:step_n
   (&optional __step_n)
   (if __step_n (setq _step_n __step_n)) _step_n)
  (:serialization-length
   ()
   (+
    ;; float32[] _action
    (* 4    (length _action)) 4
    ;; int32 _step_n
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _action
     (write-long (length _action) s)
     (dotimes (i (length _action))
       (sys::poke (elt _action i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _step_n
       (write-long _step_n s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _action
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _action (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _action i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _step_n
     (setq _step_n (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass grasping_gym_actions::makeEnvStepResponse
  :super ros::object
  :slots (_success _message _next_state _reward _done ))

(defmethod grasping_gym_actions::makeEnvStepResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    ((:next_state __next_state) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:reward __reward) 0.0)
    ((:done __done) nil)
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   (setq _next_state __next_state)
   (setq _reward (float __reward))
   (setq _done __done)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:next_state
   (&optional __next_state)
   (if __next_state (setq _next_state __next_state)) _next_state)
  (:reward
   (&optional __reward)
   (if __reward (setq _reward __reward)) _reward)
  (:done
   (&optional __done)
   (if __done (setq _done __done)) _done)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ;; float32[] _next_state
    (* 4    (length _next_state)) 4
    ;; float32 _reward
    4
    ;; bool _done
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; float32[] _next_state
     (write-long (length _next_state) s)
     (dotimes (i (length _next_state))
       (sys::poke (elt _next_state i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _reward
       (sys::poke _reward (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _done
       (if _done (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _next_state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _next_state (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _next_state i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _reward
     (setq _reward (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _done
     (setq _done (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass grasping_gym_actions::makeEnvStep
  :super ros::object
  :slots ())

(setf (get grasping_gym_actions::makeEnvStep :md5sum-) "c712a2155849fa75c27303831b1cb309")
(setf (get grasping_gym_actions::makeEnvStep :datatype-) "grasping_gym_actions/makeEnvStep")
(setf (get grasping_gym_actions::makeEnvStep :request) grasping_gym_actions::makeEnvStepRequest)
(setf (get grasping_gym_actions::makeEnvStep :response) grasping_gym_actions::makeEnvStepResponse)

(defmethod grasping_gym_actions::makeEnvStepRequest
  (:response () (instance grasping_gym_actions::makeEnvStepResponse :init)))

(setf (get grasping_gym_actions::makeEnvStepRequest :md5sum-) "c712a2155849fa75c27303831b1cb309")
(setf (get grasping_gym_actions::makeEnvStepRequest :datatype-) "grasping_gym_actions/makeEnvStepRequest")
(setf (get grasping_gym_actions::makeEnvStepRequest :definition-)
      "float32[] action
int32 step_n
---
bool success
string message
float32[] next_state
float32 reward
bool done


")

(setf (get grasping_gym_actions::makeEnvStepResponse :md5sum-) "c712a2155849fa75c27303831b1cb309")
(setf (get grasping_gym_actions::makeEnvStepResponse :datatype-) "grasping_gym_actions/makeEnvStepResponse")
(setf (get grasping_gym_actions::makeEnvStepResponse :definition-)
      "float32[] action
int32 step_n
---
bool success
string message
float32[] next_state
float32 reward
bool done


")



(provide :grasping_gym_actions/makeEnvStep "c712a2155849fa75c27303831b1cb309")


