(define (cbrt-iter prevGuess currGuess x)
  (if (new-good-enough? prevGuess currGuess)
      currGuess
      (cbrt-iter currGuess (improve currGuess x) x)))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 3))

(define (new-good-enough? prevGuess currGuess)
  (< (/ (abs (- prevGuess currGuess)) currGuess)  0.001))

(define (abs x)
  (if (< x 0) (- x) x))

(define (cbrt x)
    (cbrt-iter 0 1.0 x))
