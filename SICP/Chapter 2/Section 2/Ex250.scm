(load "PaintTools.scm")

(define (flip-horiz painter)
  (transform-painter
   painter
   (make-vect 1.0 0.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)
   ))

(define (rotate-180 painter)
  (transform-painter
   painter
   (make-vect 1.0 1.0)
   (make-vect 0.0 1.0)
   (make-vect 1.0 0.0)
   ))

(define (rotate-270 painter)
  (transform-painter
   painter
   (make-vect 0.0 1.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)
   ))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bot
	   (transform-painter
	    painter1
	    (make-vect 0.0 0.0)
	    (make-vect 1.0 0.0)
	    split-point))
	  (paint-top
	   (transform-painter
	    painter2
	    split-point
	    (make-vect 1.0 0.5)
	    (make-vect 0.0 1.0))))
      (lambda (frame)
	(paint-top frame)
	(paint-bot frame)))))

(define (below painter1 painter2)
  (lambda (frame)
    ((rotate-90
     (beside
      (rotate-270 painter1)
      (rotate-270 painter2))) frame))
  )
























