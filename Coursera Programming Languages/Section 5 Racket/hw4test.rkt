#lang racket

(require "hw4.rkt") 

(print "Test 1: ")  
(equal? (sequence 3 11 2) (list 3 5 7 9 11))
(print "Test 1: ")
(equal? (sequence 3 8 3) (list 3 6))
(print "Test 1: ")
(equal? (sequence 3 2 1) null)

(print "Test 2: ")
(equal? (string-append-map (list "foo1" "foo2" "foo3") "bar")
        (list "foo1bar" "foo2bar" "foo3bar"))

(print "Test 3: ")
(= 3 (list-nth-mod (list 1 2 3 4 5) 12))

(print "Test 5: ")
(equal? (stream-for-n-steps funny-number-stream 10)
        (list 1 2 3 4 -5 6 7 8 9 -10))

(print "Test 6: ")
(equal? (stream-for-n-steps dan-then-dog 10)
        (list "dan.jpg" "dog.jpg" "dan.jpg" "dog.jpg" "dan.jpg" "dog.jpg" "dan.jpg" "dog.jpg" "dan.jpg" "dog.jpg"))

(print "Test 7: ")
(equal? (stream-for-n-steps (stream-add-zero funny-number-stream) 10)
        (list (cons 0 1) (cons 0 2) (cons 0 3) (cons 0 4) (cons 0 -5) (cons 0 6) (cons 0 7) (cons 0 8) (cons 0 9) (cons 0 -10)))

(print "Test 8: ")
(equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b")) 10)
        (list (cons 1 "a") (cons 2 "b") (cons 3 "a") (cons 1 "b") (cons 2 "a") (cons 3 "b") (cons 1 "a") (cons 2 "b") (cons 3 "a") (cons 1 "b")))
(print "Test 8: ")
(equal? (stream-for-n-steps (cycle-lists (list 1 2 3 4 5) (list "a" "b" "c")) 12)
        (list (cons 1 "a") (cons 2 "b") (cons 3 "c") (cons 4 "a") (cons 5 "b") (cons 1 "c") (cons 2 "a") (cons 3 "b") (cons 4 "c") (cons 5 "a") (cons 1 "b") (cons 2 "c")))

(print "Test 9a: ")
(equal? (vector-assoc 5 (vector 1 (cons 5 32))) (cons 5 32))

(print "Test 9b: ")
(equal? (vector-assoc 5 (vector 1 2 (cons 5 32) 3 (cons 5 33) 4 5 6 7)) (cons 5 32))

(print "Test 10: ")
(define myfunc (cached-assoc 
                (list (cons 1 2) (cons 2 4) (cons 3 8) (cons 4 16) (cons 5 32) (cons 6 64)) 3))
(equal? (myfunc 3) (cons 3 8))

#|
(define a 2)
(while-less 7 do (begin (set! a (+ a 1)) (print "x") a))
(print "Test 11: ")
(= a 7)
(while-less 7 do (begin (set! a (+ a 1)) (print "x") a))
(print "Test 11: ")
(= a 8)
|#