(define (cube-iter guess x)
  (display guess)
  (newline)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve3 guess x)
                 x)))

(define (improve3 guess x)
  (/ (+ (/ x (square guess)) 
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

;(improve3 1 8)
(cube-iter 1 8)