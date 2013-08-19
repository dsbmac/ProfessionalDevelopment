;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname work) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

(require 2htdp/image)
(require 2htdp/universe)

(define BLANK (square 50 "outline" "white"))
(define IMG1 (rectangle 100 160 "solid" "blue"))
(define IMG2 (circle 50 "solid" "green"))

;; Image -> Image
;; consumes an image and makes it a hat the same width of the consumed img
(check-expect (make-hat BLANK) (triangle (image-width BLANK) "solid" "red"))
(check-expect (make-hat IMG1) (triangle (image-width IMG1) "solid" "red"))

;(define (make-hat img) BLANK) ;stub  

(define (make-hat img)
  (triangle (image-width img) "solid" "red"))
  
  
;; ListOfImage -> ListOfImage
;; consumes a list of images and produces a list of each of those images with a "hat" on top.
;; The hat should be a triangle of the same width as the image.
(check-expect (add-hat empty) empty) 
(check-expect (add-hat (list IMG1)) 
              (list(above (make-hat IMG1)
                     IMG1)))    
(check-expect (add-hat (list IMG1 IMG2)) 
              (list (above (make-hat IMG1)
                     IMG1) 
                    (above (make-hat IMG2)
                     IMG2)))

; (define (add-hat loi) empty) ;stub

(define (add-hat loi)
  (local [(define (put-hat-on img)
            (above (make-hat img)
                   img))]            
    (map put-hat-on loi)))