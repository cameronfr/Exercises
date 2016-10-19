(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;Normal Order:
(define (r a b) (remainder a b))
(gcd 206 40)
(gcd 40 (r 206 40))
(gcd (r 206 40) (r 40 (r 206 40)))
(gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
(gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))
(r (r 206 40) (r 40 (r 206 40)))
(r 6 (r 40 6))
(r 6 4)
2
;when if was evaluated(i.e each time gcd was called), b was evaluated
;in total: 14(from evaluating b each call) + 4(from evaluating a at the end) = 18

;Applicative Order
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)
2
;remainder was called 4 times
