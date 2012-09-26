(define (sqrt-iter guess x)
  (display guess)
  (newline)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))


(define (sqrt-iter2 guess x lastguess)
  (display "guess: ")
  (display guess)
  (newline)
  (display "lastguess: ")
  (display lastguess)
  (newline)
  (if (good-enough2? guess lastguess)
      guess
      (sqrt-iter2 (improve guess x)
                 x guess)))

(define (good-enough2? guess lastguess)
  (if (= lastguess 0) #f 
      (< (/ (abs (- guess lastguess))
        lastguess) 0.01)))
  
(sqrt-iter2 2 9999 0)
