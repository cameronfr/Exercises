(load "Sum.scm")

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))


(define (factorial n)
  (product identity 1 inc n))

(define (pi-prod n)
  (define (term a)
    (/ (* a a) (* (- a 1) (+ a 1))))
  (define (next a)
    (+ a 2))
  (* 4 (/ 2 3) (product term 4.0 next (+ n 4))))

