(load "NestMap.scm")

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
	prime-sum?
	(unique-pairs n))))

(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j)
		    (list i j))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (i)
	     (map (lambda (p) (cons i p))
		  (unique-pairs (- i 1))))
	   (enumerate-interval 1 n)))
