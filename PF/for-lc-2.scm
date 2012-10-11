#!r6rs

(import (rnrs))

(define (writeln/return x)
  ;;  Fonction tr�s utile pour pouvoir afficher un r�sultat suivi d'un passage
  ;;  � la ligne, tout en pouvant r�cup�rer ce r�sultat dans une variable. Les
  ;;  trois expressions suivantes sont �valu�es en s�quence et la valeur de la
  ;;  derni�re est retourn�e.
  (write x)
  (newline)
  x)

(define (fact n)
  (if (zero? n) 1 (* n (fact (- n 1)))))

;(define (alternate-series u epsilon)
;  (touch-next-step (u 0) u 1 epsilon))
;
;(define (exponential-minus-v2 x)
;  ;;  "-v2" est mis pour "version no. 2".
;  (let ((minus-x (- x)))
;    (alternate-series (lambda (n) (inexact (/ (expt minus-x n) (fact n)))) 0.001)))

(define (mystery n p)
  ;;
  (define (rec-mystery n0 p0)
    ;;  Des formes sp�ciales "define" internes � une d�finition �quivalent �
    ;;  l'introduction de variables locales au moyen de la forme sp�ciale
    ;;  "letrec*" :
    (if (zero? (mod n0 p0)) (rec-mystery (div n0 p0) p0) n0))
  ;;
  ;;  Principal call:
  (if (or (zero? p) (zero? n)) n (rec-mystery n p)))


;; TP2

(define (in-inches miles0 yards0 feet0 inches0)
  (let* ((inyards (+ (* 1760 miles0) yards0))
        (infeet (+ (* 3 inyards) feet0))
        (ininches (+ (* 12 infeet) inches0)))
    ininches))

(define (inches-to-meters inches)
  (/ (* inches 25.4) 1000.0))

(define (british-to-metric miles0 yards0 feet0 inches0)
  (inches-to-meters (in-inches miles0 yards0 feet0 inches0)))

(define (to-metric nb1 nb2 nb3 metric0)
  (lambda (x1 x2 x3 x4)
    (let* ((in-unit1 x1)
           (in-unit2 (+ (* nb1 in-unit1) x2))
           (in-unit3 (+ (* nb2 in-unit2) x3))
           (in-unit4 (+ (* nb3 in-unit3) x4)))
      (* in-unit4 metric0))))

(define british-metricV2 (to-metric 1760 3 12 0.0254))
(writeln/return (british-metricV2 3 61 2 10))

(define to-kilo (to-metric 14 16 437.5 0.065))
(writeln/return (to-kilo 2 10 11 320))

(define to-euro (to-metric 10 2 12 0.004902917))
(writeln/return (to-euro 12 3 1 6))

(define to-sec (to-metric 24 60 60 1))
(writeln/return (to-sec 1 3 47 48)) 
