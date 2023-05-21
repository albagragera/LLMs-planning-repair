(define (domain transport)
  (:requirements :strips)
  (:predicates 
    (at ?x - location)
    (has ?x - item)
    (goal ?x - item)
  )

  (:action pick-up
    :parameters (?x - item ?l - location)
    :precondition (and (at ?l) (has none))
    :effect (and (has ?x) (not (has none)))
  )

  (:action move-to
    :parameters (?from - location ?to - location)
    :precondition (at ?from)
    :effect (and (not (at ?from)) (at ?to))
  )

  (:action drop-off
    :parameters (?x - item ?l - location)
    :precondition (and (at ?l) (has ?x))
    :effect (and (not (has ?x)) (has none) (goal ?x))
  )
)
