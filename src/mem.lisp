(in-package :cl-mongo)

(defun gen-clean (gen)
  (let ((thr (sb-ext:generation-minimum-age-before-gc gen)))
    (setf (sb-ext:generation-minimum-age-before-gc gen) 0.d0)
    (sb-ext:gc :gen gen)
    (setf (sb-ext:generation-minimum-age-before-gc gen) thr)))

  
(defun reclaim-memory()
  (dotimes (gen 7) 
    (progn 
      ;;(format t "hello ~A~%" gen)
      (gen-clean gen))))