(define (domain barman)
  (:requirements :strips)
  (:predicates
    (ontable ?x - object)
    (handempty ?h - hand)
    (holding ?x - object ?h - hand)
    (clean ?x - object)
    (dirty ?x - object)
    (empty ?x - container)
    (contains ?c - cocktail ?x - container)
    (dispenses ?d - dispenser ?i - ingredient)
    (shaker-empty-level ?s - shaker ?l - level)
    (shaker-level ?s - shaker ?l - level)
    (next ?l1 ?l2 - level)
  )

  (:action pickup
    :parameters (?x - object ?h - hand)
    :precondition (and (ontable ?x) (handempty ?h))
    :effect (and (not (ontable ?x)) (not (handempty ?h)) (holding ?x ?h))
  )

  (:action putdown
    :parameters (?x - object ?h - hand)
    :precondition (holding ?x ?h)
    :effect (and (ontable ?x) (handempty ?h) (not (holding ?x ?h)))
  )

  (:action clean-obj
    :parameters (?x - object)
    :precondition (dirty ?x)
    :effect (and (clean ?x) (not (dirty ?x)))
  )

  (:action fill
    :parameters (?x - container ?i - ingredient)
    :precondition (and (empty ?x) (dispenses ?d ?i))
    :effect (and (not (empty ?x)) (contains (make-cocktail) ?x) (not (dispenses ?d ?i)))
  )

  (:action empty-shaker
    :parameters (?s - shaker)
    :precondition (and (shaker-empty-level ?s ?l) (clean ?s))
    :effect (and (not (shaker-empty-level ?s ?l)) (shaker-level ?s ?l))
  )

  (:action add-to-shaker
    :parameters (?i - ingredient ?s - shaker ?l1 ?l2 - level)
    :precondition (and (holding ?i ?h) (holding ?s ?h) (shaker-level ?s ?l1) (next ?l1 ?l2))
    :effect (and (not (holding ?i ?h)) (not (shaker-level ?s ?l1)) (shaker-level ?s ?l2))
  )

  (:action shake
    :parameters (?s - shaker ?l - level)
    :precondition (and (shaker-level ?s ?l) (clean ?s))
    :effect (and (shaker-empty-level ?s ?l) (not (shaker-level ?s ?l)))
  )

  (:action make-cocktail
    :parameters (?c - cocktail ?x - container ?i1 ?i2 - ingredient)
    :precondition (and (contains ?c ?x) (holding ?i1 ?h) (holding ?i2 ?h))
    :effect (and (contains ?c ?x) (not (contains (make-cocktail) ?x)) (not (holding ?i1 ?h)) (not (holding ?i2 ?h))))
)
