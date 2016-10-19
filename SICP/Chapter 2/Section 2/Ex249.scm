(load "Ex248.scm")
(load "PaintTools.scm")

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame)
	 (start-segment segment))
	((frame-coord-map frame)
	 (end-segment segment))))
     segment-list)))

;output for processing
(define (draw-line x y)
  (define size 500)
  (display "line(")
  (display (* (xcor-vect x) size))
  (display ",")
  (display (* (ycor-vect x) size))
  (display ",")
  (display (* (xcor-vect y) size))
  (display ",")
  (display (* (ycor-vect y) size))
  (display ");")
  (newline))

(define (outline-painter frame)
  ((segments->painter
    (list
     (make-segment (make-vect 0 0) (make-vect 0 1))
     (make-segment (make-vect 0 0) (make-vect 1 0))
     (make-segment (make-vect 1 1) (make-vect 0 1))
     (make-segment (make-vect 1 1) (make-vect 0 1))
     )) frame))

(define (x-painter frame)
  ((segments->painter
    (list
     (make-segment (make-vect 0 0) (make-vect 1 1))
     (make-segment (make-vect 0 1) (make-vect 1 0))
     )) frame))

(define (diamond-painter frame)
  ((segments->painter
    (list
     (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
     (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
     (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
     (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
     )) frame))

(define (wave-painter frame); pretty close!
  ((segments->painter
    (list
     (make-segment (make-vect 0.2 0) (make-vect 0.3 0.5))
     (make-segment (make-vect 0.3 0.5) (make-vect 0.15 0.4))
     (make-segment (make-vect 0.15 0.4) (make-vect 0 0.55))
     (make-segment (make-vect 0 0.6) (make-vect 0.15 0.55))
     (make-segment (make-vect 0.15 0.55) (make-vect 0.3 0.6))
     (make-segment (make-vect 0.3 0.6) (make-vect 0.2 0.75))
     (make-segment (make-vect 0.2 0.75) (make-vect 0.4 1))
     (make-segment (make-vect 0.6 1) (make-vect 0.8 0.75))
     (make-segment (make-vect 0.8 0.75) (make-vect 0.7 0.6))
     (make-segment (make-vect 0.7 0.6) (make-vect 1 0.3))
     (make-segment (make-vect 1 0.25) (make-vect 0.7 0.5))
     (make-segment (make-vect 0.7 0.5) (make-vect 0.8 0))
     (make-segment (make-vect 0.3 0) (make-vect 0.5 0.3))
     (make-segment (make-vect 0.7 0) (make-vect 0.5 0.3))
     )) frame))











































