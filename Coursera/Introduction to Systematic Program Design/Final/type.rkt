;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname type) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(X -> Number ) Number(z) ListOf(l) -> Number

(define (foo s z l) 
  (cond [(empty? l) z] ;l is a list  z is a number
        [else
         (+ (s (first l)) ;this returns a number
            (foo s z (rest l)))]))

(X X -> X) (W -> Y) (W -> W) (W -> Boolean) X Y -> X
(Y Y -> Y) (X -> Y) (X -> X ) (X -> Boolean) Y X -> Y
(define (bar c f r p z l)
  (cond [(p l) z]
        [else
         (c (f l)
            (bar c f r p z (r l)))]))

; c: Y Y -> Y
; f: X -> Y
; r: X -> X
; p: X -> Boolean
; z: Y
; l: X

(X Y -> Y) (X -> Y) (X -> Y) (X -> Y) X Y -> Y
(Y X -> X) (Y -> X) (Y -> W) (Y -> Boolean) X W -> X
; c: Y X-> X
; f: Y -> X
; r: Y -> W 
; p: Y -> Boolean
; z: X
; l: W