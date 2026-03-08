(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

(defun leap-year-p (year)
  (flet ((year-rem-zerop (num) (zerop (mod year num))))
    (and (year-rem-zerop 4)
         (or (not (year-rem-zerop 100))
             (year-rem-zerop 400)))))

