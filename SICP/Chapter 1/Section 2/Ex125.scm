(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;This would work, but it would have bad time complexity, as remainder is being passed an number that is much larger than n (which is the # being tested, which is both exp and m) . For example, if remainder has log n complexity, it would still make the expmod procedure have O(n) complexity (because log a^n = n log a). This is opposed to the regular expmod procedure which deals with numbers not bigger than n and has log(n) complexity.
