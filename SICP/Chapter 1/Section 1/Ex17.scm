

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;;
 ;Small numbers: sqrt(0.000004) is 0.002, but (sqrt 0.000004) ~= 0.03, because (sqrt) stops when the square guess is within 0.001 of the number we want the root of, even though 0.001 is a huge error for this root

;My scheme compiler crashes before large numbers I put in are big enough to lack precision, but the basic principle is that in the good-enough? method, the lack of precision for very large numbers would mean that that good-enough? would return true when it should be returning false: i.e. that the guess is farther away from the root than it ought to be

(define (new-sqrt-iter prevGuess currGuess x)
  (if (new-good-enough? prevGuess currGuess)
      currGuess
      (new-sqrt-iter currGuess (improve currGuess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2 ))

(define (abs x)
  (if (< x 0) (- x) x))

(define (square x) (* x x))


(define (new-good-enough? prevGuess currGuess)
  (< (/ (abs (- prevGuess currGuess)) currGuess)  0.001))

(define (new-sqrt x)
  (new-sqrt-iter 0 1.0 x))

;New method works much better for small numbers, though lack of precision in divison and subtraction can still cripple it

