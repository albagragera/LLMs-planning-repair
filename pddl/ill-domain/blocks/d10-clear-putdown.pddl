(define (domain blocks)
  (:requirements :strips :typing)
  (:types block)
  (:predicates (on ?x - block ?y - block)
               (ontable ?x - block)
               (clear ?x - block)
               (handempty)
               (holding ?x - block)
  )

  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect
      (and
        (not (ontable ?x))
        (not (clear ?x))
        (not (handempty))
        (holding ?x)
        (forall (?y - block) (when (on ?x ?y) (and (clear ?y) (not (on ?x ?y))))) ; ADDITIONAL EFFECT
      )
  )

  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect
      (and
        (not (holding ?x))
        (handempty)
        (ontable ?x)
        (forall (?y - block) (when (clear ?y) (not (on ?x ?y))))) ; ADDITIONAL EFFECT
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect
      (and
        (not (holding ?x))
        (not (clear ?y))
        (clear ?x)
        (handempty)
        (on ?x ?y)
        (forall (?z - block) (when (on ?z ?x) (and (clear ?z) (not (on ?z ?x))))) ; ADDITIONAL EFFECT
      )
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect
      (and
        (holding ?x)
        (clear ?y)
        (not (clear ?x))
        (not (handempty))
        (not (on ?x ?y))
        (forall (?z - block) (when (clear ?z) (not (on ?x ?z))))) ; ADDITIONAL EFFECT
  )
)
