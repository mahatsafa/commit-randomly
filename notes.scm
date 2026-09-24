; scheme notes
(define (greet name)
  (string-append "hello " name))

(display (greet "practice"))
(newline)

(define nums (list 1 2 3))
(define doubled (map (lambda (n) (* n 2)) nums))
(display doubled)

; TODO: try recursion deeper next
