(load "NestMap.scm")
(load "Ex240.scm")

(define (unique-triples n)
  (flatmap (lambda (i)
	     (map (lambda (p) (cons i p))
		  (unique-pairs (- i 1))))
	   (enumerate-interval 1 n)))
