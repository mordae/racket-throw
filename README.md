# throw

Simple throw construct for Racket.

I have been getting tired of Racket's weird exception raising,
so here is my take on that:

```racket
;; Without exception arguments, equivalent to error*:
(throw exn:fail 'error "things are broken"
                "milk" "spilled")

;; With a custom exception that takes more arguments:
(define-struct (exn:fail:custom exn:fail) (number))
(throw (exn:fail:custom 42)
       'things "broken for no obvious reason"
       "tea" "cold")
```

It merely raises exception constructed by the constructor with
optional additional arguments and message created with
`compose-error-message`.
