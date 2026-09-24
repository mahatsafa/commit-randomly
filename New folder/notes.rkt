; racket notes
(define (greet name)
  (string-append "hello " name))

(displayln (greet "practice"))

(define nums (list 1 2 3))
(define doubled (map (lambda (n) (* n 2)) nums))
(displayln doubled)

; TODO: try macros next
