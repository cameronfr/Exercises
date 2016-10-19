(load "Ex212.scm")

(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

(define (center-interval i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define a (make-center-percent 10 0.02))
(define b (make-center-percent 50 0.1))
(center a)
(percent a)
(par1 a b)
(par2 a b)
(percent (div-interval a a))
(center (div-interval a a))
(percent (div-interval a b))
(center (div-interval a b))
(percent (div-interval b b))
(percent (div-interval b a))
;the problem is that A/A algebraeically is 1, but the program treats it as two different intervals, thus for some operations uncertainty increases when it should not. also, multiplication leads to a wider interval than addition.
