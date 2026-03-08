(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

(defun leap-year-p (year)
  (flet ((year-zerop (num) (zerop (mod year num))))
    (and (zero-rem-p 4)
         (or (not (zero-rem-p 100))
             (zero-rem-p 400)))))

