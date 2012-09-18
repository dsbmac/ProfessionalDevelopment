;ex 1.3

(define (sumSquareMax x y z)
  (cond ((= (min x y z) x) (+ (expt y 2) (expt z 2)))
        ((= (min x y z) y) (+ (expt x 2) (expt z 2)))
        ((= (min x y z) z) (+ (expt x 2) (expt y 2)))))

(sumSquareMax 3 2 3)