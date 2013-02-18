
#lang racket


  (provide (all-defined-out))
  
  (define x 3)
  (define y (+ x 2))
  
  (define cube1
     (lambda (x)
        (* x ( *x x))))
        
  (define cube2
     (lambda (x)
        (* x x x)))
  
  (define (cube3 x)
     (* x x x))
    
  (define (pow1 x y)
     (if (= y 0)
        1
        (* x (pow1 x(- y 1)))))
  
  (define pow2
     (lambda (x)
        (lambda (y)
           (pow1 x y))))
  
  (define three-to-the (pow2 3))
  