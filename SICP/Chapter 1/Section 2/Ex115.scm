(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;1. s stands for the function sine below
;(s 12.15)
;(p (s 4.05))
;(p (p (s 1.35)))
;(p (p (p (s 0.45))))
;(p (p (p (p (s 0.15)))))
;(p (p (p (p (p (s 0.05))))))
; p is applied 5 times

;Space: log_3(a) -- i.e. how many times n has to be divided before reaching <0.1
;Time: log_3 (a) as well
