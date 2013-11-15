#lang racket/base
;
; The throw syntactic construct.
;

(require unstable/error)

(require (for-syntax racket/base))

(provide throw)


(define-syntax (throw stx)
  (syntax-case stx ()
    ((_ (make-exn exn-arg ...) compose-arg ...)
     #'(raise (make-exn (compose-error-message compose-arg ...)
                        (current-continuation-marks)
                        exn-arg ...)))
    ((_ make-exn compose-arg ...)
     #'(raise (make-exn (compose-error-message compose-arg ...)
                        (current-continuation-marks))))))


; vim:set ts=2 sw=2 et:
