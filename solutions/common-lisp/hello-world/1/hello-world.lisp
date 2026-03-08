(defpackage #:hello-world
  (:use #:common-lisp)
  (:export #:hello-world)
  (:nicknames #:hw))

(in-package #:hello-world)

(defun hello-world (&optional (name nil name-given-p))
  (if name-given-p
    (format t "Hello ~A!" name)
    (format t "Hello ~A!" "World")))
