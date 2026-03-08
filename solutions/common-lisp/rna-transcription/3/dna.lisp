(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defparameter *input*  '(#\G #\C #\T #\A))
(defparameter *output* '(#\C #\G #\A #\U))

(defun to-rna (str)
  (flet ((is-not-dna-p (dna-str)
           (every #'(lambda (nucleotide)
                      (find nucleotide *input*))
                  dna-str)))
    (if (is-not-dna-p str)
        'error
        (map 'string
             #'(lambda (nucleotide)
                 (case nucleotide
                   (#\G #\C)
                   (#\C #\G)
                   (#\T #\A)
                   (#\A #\U)))
             str))))
