

(define (problem BW-rand-7)
(:domain blocks)
(:objects b1 b2 b3 b4 b5 b6 b7 - block)
(:init
(handempty)
(on b1 b5)
(on b2 b1)
(ontable b3)
(on b4 b7)
(ontable b5)
(ontable b6)
(on b7 b2)
(clear b3)
(clear b4)
(clear b6)
)
(:goal
(and
(on b1 b3)
(on b3 b2)
(on b6 b5)
(on b7 b1))
)
)


