(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;Normal: will return 0
;Applicative: (p) will evaluate to a variable when the compiler expects a number, nothing will return 
