(define (problem strips-gripper-x-1)
   (:domain gripper-strips)
   (:objects rooma roomb ball2 ball1 left right)
(:init
  (room rooma)
  (room roomb)
  (ball ball2)
  (ball ball1)
  (at-robby rooma)
  (free left)
  (free right)
  (at ball2 rooma)
  (at ball1 roomb)
  (gripper left)
  (gripper right)
)
   (:goal (and (at ball2 roomb)
               (at ball1 roomb))
   )
)