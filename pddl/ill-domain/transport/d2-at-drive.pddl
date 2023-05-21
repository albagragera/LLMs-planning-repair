(define (domain transport)
  (:requirements :strips :typing)
  (:types
        location target locatable - object
        vehicle package - locatable
  )

  (:predicates 
     (road ?l1 ?l2 - location)
     (at ?x - locatable ?v - location)
     (in ?x - package ?v - vehicle)
     (empty ?v - vehicle)
  )

  (:action drive
    :parameters (?v - vehicle ?l1 ?l2 - location)
    :precondition (and
        (at ?v ?l1)
        (road ?l1 ?l2)
      )
    :effect (and
        (not (at ?v ?l1))
        (at ?v ?l2)
      )
  )

  (:action pick-up
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and
        (at ?v ?l)
        (at ?p ?l)
        (empty ?v)
      )
    :effect (and
        (not (at ?p ?l))
        (in ?p ?v)
        (not (empty ?v))
      )
  )

  (:action drop
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and
        (at ?v ?l)
        (in ?p ?v)
      )
    :effect (and
        (not (in ?p ?v))
        (at ?p ?l)
        (empty ?v)
      )
  )
)
