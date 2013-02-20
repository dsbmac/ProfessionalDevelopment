
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


                           
