#!r6rs

(import (rnrs))  ;  Importation en vrac de tous les modules de la biblioth�que
					;  initiale : nous verrons plus tard
					;  comment proc�der plus pr�cis�ment.
					;  Comme vous l'avez devin�, ceci est
					;  un commentaire.

(write (+ 2012 (* (+ 22 1) (/ 14 (- 9 2)))))  ;  (*)
(newline) 
(write "Hello world!") 
(newline) 
(display "Hello world!") 
(newline) 
(write ((lambda (x) (* x x)) 2010))  ;  (**)
(newline)

(define crash  ;  (***)  Pour bien montrer que Scheme n'�value
  (lambda () (/ 0)))  ;  pas sous la forme sp�ciale lambda.

(define derive-wrt
  (lambda (f1 h)
    (lambda (x) (/ (- (f1 (+ x h)) (f1 x)) h))))

(write ((derive-wrt (lambda (x) (* x x)) 0.0001) 2)) 
(newline) 
(write ((derive-wrt + 0.0001) 2))  ;  (****)

(define fact
  (lambda (n) (if (zero? n) 1 (* n (fact (- n 1))))))

(newline) 
(write (fact 6)) 
(newline)


; TP 19/09/12

(define pi
  (* 4 (atan 1)))
(write pi)

(newline)

(newline)
(write (+ (/ 4.1 9.8) (/ (* 2 pi) 3)))

(newline)
(write (+ (exp pi) (+ (log (sin 2.1)) (sin (+ (/ 1 pi) pi)))))

; nos premiere fonctions
(newline)
(newline)

(write "Nos premiere fonctions")
(newline)

(write ((lambda (x) (* x x )) 2012))
(newline)

(write ((lambda (x y) (* x y y)) 2012 2012)) ; => Il faut deux arguments
(newline)

(write ((lambda (x y) (* x y y)) 2012 2011))
(newline)

(write ((lambda (x y) (* x y y)) 2012 2011)) ; 2010)) => Il faut deux pas trois
(newline)

(write 2012)
(newline)

(write (lambda () 2012)) ; Probleme de cloture
(newline)

(write ((lambda () 2012))) ; Evalue la fonction avec argument 2012
(newline)

;(write (2012)) N'est pas une procedure
;(newline)

(write ((lambda () 2012)))
(newline)

;(write (((lambda () 2012)))) Probleme de cloture, attent une procédure
;(newline)

(write (((lambda () (lambda () 2012)))))
(newline)