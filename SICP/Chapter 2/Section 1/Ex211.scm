(load "Ex210.scm")

(define (neg? a)
  (< a 0))

(define (pos? a)
  (> a 0))

(define (mul-interval x y)
  (let
      (
       (p1 (lower-bound x))
       (p2 (upper-bound x))
       (p3 (lower-bound y))
       (p4 (upper-bound y))
       (p1? (pos? (lower-bound x)))
       (p2? (pos? (upper-bound x)))
       (p3? (pos? (lower-bound y)))
       (p4? (pos? (upper-bound y))))
    (cond
     ((and (not p1?) p2? (not p3?) (not p4?))
      (make-interval (* p2 p3) (* p1 p3)))
     ((and (not p1?) p2? p3? p4?)
      (make-interval (* p1 p4) (* p2 p4)))
     ((and (not p1?) (not p2?) p3? p4?)
      (make-interval (* p1 p4) (* p2 p3)))
     ((and (not p1?) (not p2?) (not p3?) p4?)
      (make-interval (* p1 p4) (* p1 p3)))
     ((and (not p1?) (not p2?) (not p3?) (not p4?))
      (make-interval (* p2 p4) (* p1 p3)))
     ((and p1? p2? (not p3?) (not p4?))
      (make-interval (* p2 p3) (* p1 p4)))
     ((and p1? p2? (not p3?) p4?)
      (make-interval (* p2 p3) (* p2 p4)))
     ((and p1? p2? p3? p4?)
      (make-interval (* p1 p3) (* p2 p4)))
     (else
      (let ((m1 (* p1 p3))
	    (m2 (* p1 p4))
	    (m3 (* p2 p3))
	    (m4 (* p2 p4)))
	(make-interval (min m1 m2 m3 m4) (max m1 m2 m3 m4)))))))
	  
;this was not a fun exercise
