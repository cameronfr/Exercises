(load "Trees.scm")
(load "../../Chapter 1/Section 2/Ex119.scm")

(define (filter predicate sequence)
  (cond ((null? sequence) `())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate
		       (cdr sequence))))
	(else  (filter predicate
		       (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      `()
      (cons low
	    (enumerate-interval
	     (+ low 1)
	     high))))

(define (enumerate-tree tree)
  (cond ((null? tree) `())
	((not (pair? tree)) (list tree))
	(else (append
	       (enumerate-tree (car tree))
	       (enumerate-tree (cdr tree))))))

(define (odd? x)
  (not (= (remainder x 2) 0)))

(define (sum-odd-squares tree)
  (accumulate
   +
   0
   (map square
	(filter odd?
		(enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate
   cons
   `()
   (filter even?
	   (map fib
		(enumerate-interval 0 n)))))

(define (list-fib-squares n)
  (accumulate
   cons
   `()
   (map square
	(map fib
	     (enumerate-interval 0 n)))))

(define
  (product-of-squares-of-odd-elements
   sequence)
  (accumulate
   *
   1
   (map square (filter odd? sequence))))
