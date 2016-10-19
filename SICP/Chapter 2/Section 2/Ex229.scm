(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))

(define (total-weight m)
  (if (not (pair? m))
      m
      (+ (total-weight (branch-structure (left-branch m)))
	 (total-weight (branch-structure (right-branch m))))
	))	   
  
(define (balanced-mobile? m)
  (if (not (pair? m))
      true
      (and
       (= (* (branch-length (left-branch m)) (total-weight (branch-structure (left-branch m))))
	  (*  (branch-length (right-branch m)) (total-weight (branch-structure (right-branch m))))
	  )
       (balanced-mobile? (branch-structure (left-branch m)))
       (balanced-mobile? (branch-structure (right-branch m)))
       )
      )
  )

;If the constructors are changed, we only need to refactor the selectors
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (cdr m))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cdr b))
 
 
