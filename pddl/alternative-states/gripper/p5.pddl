(define (problem strips-gripper-x-2)
   (:domain gripper-strips)
   (:objects rooma roomb ball4 ball3 ball2 ball1 left right)
   (:init (room rooma)
          (room roomb)
          (ball ball4)
          (ball ball3)
          (ball ball2)
          (ball ball1)
          (at-robby rooma)
          (free left)
          (free right)
          (at ball4 rooma)
          (at ball3 rooma)
          (at ball1 rooma)
          (gripper left)
          (gripper right)
          ; Add the following information to the initial state
          (at ball2 rooma)
          (at ball1 roomb))
   (:goal (and (at ball4 roomb)
               (at ball3 roomb)
               (carry ball2 left)
               (not (at ball2 rooma)))))
