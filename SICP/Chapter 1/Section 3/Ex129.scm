(load "Sum.scm")

(define (integral-simp fn a b n)
  (define (term k x)
    (cond
     ((= k 0) (fn x))
     ((= k n) (fn x))
     ((= (remainder k 2) 0) (* 2.0 (fn x)))
     (else (* 4.0 (fn x)))))
  (define (sum-int k h)
    (cond
     ((> k n) 0)
     (else
      (+ 
       (term k (+ a (* k h)))
       (sum-int (+ k 1) h)
       ))
     ))
  (define (integrate h)
    (* (sum-int 0 h) (/ h 3)))
  (integrate (/ (- b a) n)))

;(integral-simp cube 0 1 100):  .24999999999999992
;(integral-simp cube 0 1 1000): .2500000000000002
;(integral cube 0 1 0.01):      .24998750000000042
;(integral cube 0 1 0.001):     .24999987500000073
;1.25 e -7 for midpoint rienmann sum (1000 steps), 2e-16 error for simpsons
;simpson's is much more accurate in fewer steps
