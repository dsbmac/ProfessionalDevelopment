
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
           
                 
                           
