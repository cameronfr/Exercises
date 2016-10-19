(define (inc n) (+ n 1))

(define (identity x) x)

(define (cube x)
  (* x x x))

(define (sum-recur term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))


(define (sum term a next b)
  (sum-iter term a next b 0))
  
(define (sum-iter term a next b curSum)
  (if (> a b)
      curSum
      (sum-iter term (next a) next b (+ curSum (term a)))))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-integers a b)
  (sum identity a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
    (sum pi-term a pi-next b))
      
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
