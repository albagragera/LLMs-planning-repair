(define (problem BW-rand-3)
(:domain blocks)
(:objects b1 b2 b3 - block)
(:init
(handempty)
(ontable b1)
(ontable b2)
(ontable b3)
(clear b1)
(clear b2)
(clear b3)
)
(:goal
(and
(on b2 b3)
(on b1 b2))
)
)
