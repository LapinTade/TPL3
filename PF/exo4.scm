#!r6rs
(import (rnrs))

(define (writeln/return x)
  (write x)
  (newline)
  x)

(define(average x y)
  (/ (+ x y) 2))

(define (close-enough? x y epsi)
  (< (abs (- x y)) epsi))

(define (look-for-root f negative-point positive-point epsi)
  (let ((new-point (average negative-point positive-point)))
    (if (close-enough? negative-point positive-point epsi)
        new-point
        (let ((new-image(f new-point)))
    (cond ((zero? new-image) new-point)
          ((positive? new-image)
           (look-for-root negative-point new-point epsi))
          (else (look-for-root new-point positive-point epsi)))))))

(define (dichotomy f r1 r2 epsi)
  (let ((image-1 (f r1))
        (image-2 (f r2)))
    (if (negative? (* image-1 image-2))
        (if (< image-1 image-2)
            (look-for-root f r1 r2 epsi)
            (look-for-root f r2 r1 epsi))
        #f)))