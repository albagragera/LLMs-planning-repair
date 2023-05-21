(define (domain barman)
  (:requirements :strips)
  (:predicates
    (ontable ?x - object)
    (handempty ?h - hand)
    (holding ?x - object ?h - hand)
    (clean ?x - object)
    (empty ?x - shot)
    (shaker-empty-level ?s - shaker ?l - level)
    (shaker-level ?s - shaker ?l - level)
    (next ?l1 - level ?l2 - level)
    (contains ?s - shot ?c - cocktail)
    (cocktail-part1 ?c - cocktail ?i - ingredient)
    (cocktail-part2 ?c - cocktail ?i - ingredient)
    (dispenses ?d - dispenser ?i - ingredient)
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

  (:action clean-object
    :parameters (?x - object)
    :precondition (not (clean ?x))
    :effect (clean ?x)
  )

  (:action fill-shaker
    :parameters (?s - shaker ?i - ingredient)
    :precondition (and (clean ?s) (handempty left) (dispenses ?d ?i))
    :effect (and (not (handempty left)) (not (clean ?s)) (shaker-level ?s l2) (not (shaker-empty-level ?s l2)))
  )

  (:action pour-shot
    :parameters (?s - shot ?h - hand ?s-l - level)
    :precondition (and (holding ?s ?h) (shaker-level shaker1 ?s-l) (not (shaker-empty-level shaker1 ?s-l)))
    :effect (and (not (holding ?s ?h)) (empty ?s) (not (handempty ?h)) (shaker-empty-level shaker1 ?s-l) (not (shaker-level shaker1 ?s-l)) (contains ?s cocktail1))
  )

  (:action make-cocktail
    :parameters (?c - cocktail ?s1 - shot ?s2 - shot ?s3 - shot)
    :precondition (and (empty ?s1) (empty ?s2) (empty ?s3) (cocktail-part1 ?c ?i1) (cocktail-part2 ?c ?i2) (contains ?s1 cocktail1) (contains ?s2 cocktail2) (contains ?s3 cocktail3))
    :effect (and (not (empty ?s1)) (not (empty ?s2)) (not (empty ?s3)) (contains ?s1 ?c) (contains ?s2 ?c) (contains ?s3 ?c))
  )
)
