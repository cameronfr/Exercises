(load "Ex22.scm")

;representation 1
(define (make-rect bot-left top-right)
  (cons bot-left top-right))

(define (height-rect r)
  (- (y-point (cdr r))
     (y-point (car r))))

(define (width-rect r)
  (- (x-point (cdr r))
     (x-point (car r))))

;representation 2
(define (make-rect top-seg bot-seg)
  (cons top-seg bot-seg))

(define (height-rect r)
  (-
   (y-point (start-segment (car r)))
   (y-point (start-segment (cdr r)))
   ))

(define (width-rect r)
  (-
   (x-point (end-segment (car r)))
   (x-point (start-segment (car r)))
   ))
;higher level abstraction methods
(define (area r)
  (* (height-rect r) (width-rect r)))

(define (perimeter r)
  (+ (* 2 (height-rect r)) (* 2 (width-rect r))))

