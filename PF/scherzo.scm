#!r6rs

(import (rnrs))

(define (write/return x)
  (write x)
  (newline)
  x)

(define absolute-zero -273.15)

(define body->volume-at
  (lambda (lambda-b)
    (lambda( t V0) (* V0 (+1 (* lambda-b t))))))

(define gas-volume-at (body->volume-at (/ (- absolute-zero))))

(define body-f->volume-at
  (lambda (lambda-b-thunk)
    (let ((lambda-b (lambda-b-thunk)))
      (lambda (t V0) (* V0(+ 1 (* lambda-b t)))))))

(write/return ((body-f->volume-at (lambda () 1e-5)) 30 1))


(define pi
  (* 4 (atan 1)))
(write pi)
(newline)


(define fq->power
  (lambda (f)
    (let ((coef (cos (* 2 pi f))))
      (lambda (u i)
        (* u i coef)))))

(write/return ((fq->power 50) 220 7))