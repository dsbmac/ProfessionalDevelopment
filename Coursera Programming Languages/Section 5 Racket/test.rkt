#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

(define (f x y)
  (if (= x y)
      "match"
      (error "Blowme")))

(define (c x y)
  (cond [(= x 0) 0]
        [(= x y) "blow"]
        [#t x]))

        