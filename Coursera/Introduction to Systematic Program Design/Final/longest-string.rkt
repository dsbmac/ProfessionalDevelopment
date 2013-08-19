;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname longest-string) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; ListOfString -> String
;; A function that consumes a list of strings and produces the longest string in the list.
;; ASSUME that the list is non-empty.
(check-expect (longest-string (list "a")) "a")
(check-expect (longest-string (list "a" "be" "cee")) "cee")
(check-expect (longest-string (list "a" "bee" "ce")) "bee")

;(define (longest-string los) "yo!") ;stub

;; (X Y -> Y) Y (listof X) -> Y
;; (foldr f base (list x-1 ... x-n)) = (f x-1 ... (f x-n base))
(define (longest-string los) 
  (local [(define (longer-string s1 s2)
            (if (> (string-length s2)
                   (string-length s1))
                s2
                s1))]
    (foldr longer-string (first los) los)))


