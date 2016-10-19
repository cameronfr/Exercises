(define (sum-of-squares-of-largest-two-args x y z)
  (cond
    ((> x y) (if (> y z) (sum-of-squares y x) (sum-of-squares x z)))
    ((or (< x y) (= x y)) (if (> x z) (sum-of-squares y x) (sum-of-squares y z)))
    ))
    
