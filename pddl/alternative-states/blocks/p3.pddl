(define (problem BW-rand-4-alt)
(:domain blocks)
(:objects b1 b2 b3 b4 - block)
(:init
(on b1 b2)
(on b2 b4)
(on b4 b3)
(ontable b3)
(clear b1)
(handempty)
)
(:goal
(and
(on b1 b4)
(on b3 b1))
)
)
