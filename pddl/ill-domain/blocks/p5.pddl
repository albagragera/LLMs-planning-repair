

(define (problem BW-rand-4)
(:domain blocks)
(:objects b1 b2 b3 b4 - block)
(:init
(handempty)
(on b1 b4)
(on b2 b3)
(on b3 b1)
(ontable b4)
(clear b2)
)
(:goal
(and
(on b1 b3)
(on b4 b2))
)
)


