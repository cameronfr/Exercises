(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;if b is greater than 0, the function (+ a b) will be carried out
;if b is less than or equal to 0 ,the function (- a b) will be carried out, which is equal to (+ a (-b))
;thus the function is equal to (+ a (abs b))
