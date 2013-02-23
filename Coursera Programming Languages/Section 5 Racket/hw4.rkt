#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

;p1
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ stride low) high stride))))
;p2
(define (string-append-map xs suffix)
  (if (null? xs)
      null
      (cons (string-append (car xs) suffix)
            (string-append-map (cdr xs) suffix))))
;p3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (list-ref xs (remainder
                          (length xs)
                          n))]))                 
;p4
(define (stream-for-n-steps s n)
  (if (= n 0)
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))
;p5
(define funny-number-stream 
  (letrec ([f (lambda (x) (cons 
                           (if (= 0 (modulo x 5))
                                    (* x -1)
                                    x) 
                           (lambda () 
                             (f (+ x 1)))))])
    (lambda () (f 1))))
;p6
(define dan-then-dog
  (letrec ([f (lambda (x) (cons
                           x
                           (lambda ()
                             (f (if (string=? x "dog.jpg")
                               "dan.jpg"
                               "dog.jpg")))))])
    (lambda () (f "dan.jpg"))))
;p7
(define (stream-add-zero s)
  (letrec 
      ([fn (lambda (x) (cons 0 x))]
       [f (lambda (x)
            (cons (fn (car (x))) (lambda () (f (cdr (x))))))])
    (lambda () (f s))))
  
;p8
(define (cycle-lists xs ys)
  (letrec
      ([f (lambda (x)
            (cons (cons (list-ref xs x) (list-ref ys x)) 
                  (lambda () (f (+ x 1)))))])
    (lambda () (f 0))))
 
(define list1 (list 1 2 3))
(define list2 (list "a" "b"))
