#!r6rs
(import (rnrs))

(define (writeln/return x)
  (write x)
  (newline)
  x)

;;  Start

(writeln/return (cons 0 1))
(writeln/return (cons 0.1 0.1))
(writeln/return (cons (cons 0.1 0.1) 1))
(writeln/return (cons 0.1 '()))
(writeln/return (cons '() '()))
(define current-year 2012)
(define next-year (+ current-year 1))
(define academic-year (cons current-year next-year))
(define academic-year-0 (cons current-year 'next-year))
(define academic-year-1 (cons 'current-year 'next-year))
(define operations (cons + -))
(define symbols (cons '+ '-))
(define two-numbers (cons 0 1))
(define something (cons (cons 0.1 0.1) 1))

(writeln/return academic-year)
(writeln/return (quote academic-year))
(writeln/return 'academic-year)
(writeln/return 'undefined)
;(writeln/return undefined)
(writeln/return +)
(writeln/return '+)
;(writeln/return (0 . 1))
(writeln/return '(0 . 1))
;(writeln/return (+ . 1))
(writeln/return '(+ . 1))
(writeln/return (car academic-year))
(writeln/return (cdr academic-year))
;(writeln/return (car next-year))
(writeln/return academic-year-0)
(writeln/return (cdr academic-year-0))
(writeln/return academic-year-1)
(writeln/return ((car operations) (car two-numbers) (cdr two-numbers)))
;(writeln/return ((cdr symbols) (cdr two-numbers) (car two-numbers)))
(writeln/return (cons (cdr symbols) (car two-numbers)))
(writeln/return (cons (cdr operations) (cdr two-numbers)))
(writeln/return ((cdr operations) (cdr two-numbers)))
(writeln/return (car something))
(writeln/return (cdr (car something)))
;(writeln/return (car (cdr something)))

;; Playing with Pairs

;;  (writeln/return (pair-op + '(30 . 10) '(5 . 11)))
;;  (writeln/return (pair-op - '(30 . 10) '(5 . 11)))

;;  ;;  Lists

;;  (writeln/return '(A . ((String . ()) . ((() . of) . (Pearls . ())))))
;;  (writeln/return '((In . ()) . (() . the) (Mood . ())))
;;  (writeln/return '((Walk . ((() . ()) . on)) . ((() . the) . ((Wild . (Side . **)) . ()))))
;;  (writeln/return (****replace**** (****replace**** 'Walking 'on 'the 'Moon) '()))
;;  (writeln/return (****replace**** 'Keep (****replace**** 'it '(up))))
;;  (writeln/return (****replace*** (****replace**** 'Just 'a) (****replace**** 'cast (****replace**** 'away '()))))

;;  (writeln/return (****replace**** (****replace**** 'I 'hope) (****replace**** '(that) '(someone))
;;                                   (****replace**** 'gets '(my))))

;;  (writeln/return (****replace**** 'Message (****replace**** '((in a)) (****replace**** 'Bottle))))

;;  (writeln/return (reviota 12))

;;  (writeln/return (repeat-each '(7 10 2012)))

;;  Merge sort

;;  (define (merge-groups group-list)
;;    (cond ((null? group-list) ***fill-in***)
;;          ((null? (cdr group-list)) (list ***fill-in***))
;;          (else (cons ***fill-in*** ***fill-in***))))

;;  (define (make-groups l rel-2?)
;;    (if (null? (cdr l))
;;        ***fill-in***
;;        (let ((next-groups (make-groups (cdr l) rel)))
;;          (if (rel-2? (car l) (cadr l)) ***fill-in*** ***fill-in***))))

;;  (writeln/return (mergesort '(1 5 4 7 8 4 6 0)))

(define cp-list-example
  '((5 . 5) (6 . 0) (3 . 3) (6 . 1) (7 . 7) (1 . 1) (6 . 2)))

(define simple-list-example (map car cp-list-example))

;;  (writeln/return simple-list-example)

;;  (writeln/return (mergesort simple-list-example))
;;  (writeln/return (mergesort-v2 simple-list-example <=))
;;  (writeln/return (mergesort-v2 simple-list-example >=))

;;  Intermezzo

;;  (writeln/return (car cp-list-example))
;;  (writeln/return (caar cp-list-example))
;;  (writeln/return (cdr cp-list-example))
;;  (writeln/return (cadr cp-list-example))
;;  (writeln/return (cdadr cp-list-example))
;;  (writeln/return (caddr cp-list-example))

;;  Final

(define dates 
  '((9 11 1998) (11 11 1997) (1 1 1900) (17 11 1997) (29 2 2000) (25 12 1999)))

(define dates-v2
  '((9 Nov 1998) (11 Nov 1997) (1 Jan 1900) (17 Nov 1997)
    (29 Feb 2000) (25 Dec 1999)))

(define (position x l)
  (let thru ((l0 l)
	     (current-position 0))
    (cond ((null? l0) #f)
	  ((equal? (car l0) x) current-position)
	  (else (thru (cdr l0) (+ current-position 1))))))

;;  (writeln/return (<arithmetical? 2011 2012 (lambda () 'ko)))
;;  (writeln/return (<arithmetical? 2011 2011 (lambda () 'ok)))
;;  (writeln/return (<arithmetical? 2012 2011 (lambda () (/ 0))))

(define composers 
  '((Schoenberg 1874 1951) (Gorecki 1933 2010) (Messiaen 1908 1992)
    (Varese 1883 1965) (Rozsa 1907 1995) (Boulez 1925 **)
    (Artiomov 1940 **) (Webern 1883 1945) (Penderecki 1933 **)
    (Schnittke 1934 1998) (Berg 1883 1935) (Svetlanov 1928 2000)
    (Jaume 1940 **)))

;;  (writeln/return (mergesort cp-list-example (lambda (x y) (<= (car x) (car y)))))
;;  (writeln/return (mergesort cp-list-example (lambda (x y) (< (car x) (car y)))))

;;  (writeln/return (mergesort-plus cp-list-example <= car))
;;  (writeln/return (mergesort-plus cp-list-example < car))

;;  (writeln/return (mergesort-plus simple-list-example))
;;  (writeln/return (mergesort-plus cp-list-example (lambda (x y) (< (car x) (car y)))))
;;  (writeln/return (mergesort-plus cp-list-example (lambda (x y) (> (car x) (cdr y)) values)))

(define add-something
  (case-lambda
   ((x) (+ x 1))
   ((x y) (+ x y))))

;;  (writeln/return (add-something 2010))
;;  (writeln/return (add-something 2010 30))

(define (diagonal? v)
  (if (equal? 0 v)
      0
      (if (= (car v) (cdr v))
          #t
          #f)))
(define (scal-prod v w)
  (+ (* (car v) (car w) (* (car v) (car w)))))

(define (pair-op f2 v w)
  (cons ((f2 (car v) (car w)) (f2 (cdr v) (cdr w)))))