(load "Ex249.scm")
(load "Ex250.scm")

(define f (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))

((flip-horiz wave-painter) f)
((rotate-180 wave-painter) f)
