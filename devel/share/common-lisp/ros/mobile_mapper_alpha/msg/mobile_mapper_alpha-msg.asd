
(cl:in-package :asdf)

(defsystem "mobile_mapper_alpha-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "rtklib" :depends-on ("_package_rtklib"))
    (:file "_package_rtklib" :depends-on ("_package"))
  ))