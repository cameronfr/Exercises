(load "Paint.scm")

(define (wave-painter frame); adding a nose!
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
     (make-segment (make-vect 0.5 0.8) (make-vect 0.5 0.7))
     )) frame))

(define (corner-split painter n); two ups in bottom right
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1))))
	(let ((top-left (beside up up))
	      (bottom-right (beside up up))
	      (corner (corner-split painter
				    (- n 1))))
	  (beside (below painter top-left)
		  (below bottom-right
			 corner))))))

(define (square-limit painter n); circular pattern
  (let ((combine4
	 (square-of-four flip-vert
			 rotate-90
			 rotate-270
			 identity)))
    (combine4 (corner-split painter n))))
