(load "Differentiation.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product
	   (multiplier exp)
	   (deriv (multiplicand exp) var))
	  (make-product
	   (deriv (multiplier exp) var)
	   (multiplicand exp))))
	((exponentiation? exp)
	 (make-product
	  (make-product
	  (power exp)
	  (make-exponentiation
	   (base exp)
	   (- (power exp) 1)))
	 (deriv (base exp) var)))
	(else (error "unknown expression 
                      type: DERIV" exp))))


(define (make-exponentiation b p)
  (cond
   ((= p 0) 1)
   ((= p 1) b)
   (else (list '** b p))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (power x) (caddr x))



