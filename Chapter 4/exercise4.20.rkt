(define (letrec? expr) (tagged-list? expr 'letrec))
(define (letrec-inits expr) (cadr expr))
(define (letrec-body expr) (cddr expr))
(define (declare-variables expr)
  (map (lambda (x) (list (car x) '*unassigned*)) (letrec-inits expr)))
(define (set-variables expr)
  (map (lambda (x) (list 'set! (car x) (cadr x))) (letrec-inits expr)))
(define (letrec-let expr)
  (list 'let (declare-variables expr)
        (make-begin (append (set-variables expr) (letrec-body expr)))))