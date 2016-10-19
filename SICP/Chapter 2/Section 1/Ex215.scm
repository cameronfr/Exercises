(load "Ex214.scm")
;yes. A repetition of a variable will lead to wider bounds. for example, the expression 
; (A * A) / A is equal to A, but...
 (define A (make-interval 2 4))
A ;2,4
(div-interval (mul-interval A A) A);1,8
;thus par2 is better because it has two unknowns, instead of four unknowns (the program is indifferent to the fact that unknowns may be equal to each other)
