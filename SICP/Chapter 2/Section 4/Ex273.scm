(define (put key1 key2 func) (2d-put! key1 key2 func))
(define (get key1 key2) (2d-get key1 key2))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))


(define (deriv exp var)
  (display exp)
  (newline)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var)
	     1
	     0))
	(else ((get 'deriv (operator exp))
	       (operands exp)
	       var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;Algebraic Helper Methods
;(these allow for algebraic rules such as x*0=0 to be implemented)

(define (make-sum a b)
  (list '+ a b))

(define (make-prod a b)
  (list '* a b))

(define (make-expt a b)
  (list '** a b))

;Packages

(define (install-+-deriv)
  (define (+-deriv exp var)
    (make-sum (deriv (car exp) var) (deriv (cadr exp) var)))
  (put 'deriv '+ +-deriv)
  'done)

(define (install-*-deriv)
  (define (*-deriv exp var)
    (make-sum
     (make-prod (car exp) (deriv (cadr exp) var))
     (make-prod (cadr exp) (deriv (car exp) var))
     ))
  (put 'deriv '* *-deriv)
  'done)

(define (install-**-deriv)
  (define (**-deriv exp var)
    (make-prod
     (make-prod
      (cadr exp) (make-expt (car exp) (- (cadr exp) 1)))
     (deriv (car exp) var)))
  (put 'deriv '** **-deriv)
  'done)

;We cannot assimilate number? and variable? because they have no specific type associated with them -- they define the type, whereas operators such as + and * can be defind by '+ and '*. Given that the table can only compare the type specified for a function and the type passed to get, we cannot use predicates to specift types.

;There is nothing special about the order of the keys, so if we want to access by (get operator 'deriv) instead, we simply have to reverse the order we (put) the keys in. (e.g. for install-*-deriv we would do (put '* 'deriv *-deriv)
