;1.2
( / (+ 5 
       4
       (- 2 (- 3 (+ 6 (/ 4 5)))))
    (* 3 
       (- 6 2) 
       (- 2 7)))

;ex 1.3

(define (sumSquareMax x y z)
  (cond ((= (min x y z) x) (+ (expt y 2) (expt z 2)))
        ((= (min x y z) y) (+ (expt x 2) (expt z 2)))
        ((= (min x y z) z) (+ (expt x 2) (expt y 2)))))

;1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 2 -3)

