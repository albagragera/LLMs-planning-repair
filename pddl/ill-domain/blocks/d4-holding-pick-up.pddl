(define (domain blocks)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (holding ?x)
    (handempty))
  (:action pick-up
    :parameters (?x)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)))
  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and
              (not (holding ?x))
              (clear ?x)
              (handempty)
              (ontable ?x)))
  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (not (holding ?x))
              (not (clear ?y))
              (clear ?x)
              (handempty)
              (on ?x ?y)
              (ontable ?y))) ; add ontalbe ?y effect
  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (clear ?x))
              (not (handempty))
              (not (on ?x ?y))
              (ontable ?x)))) ; add ontalbe ?x effect
