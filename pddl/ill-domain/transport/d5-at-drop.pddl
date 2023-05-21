(define (domain transport)
  (:requirements :strips :typing)
  (:types
        location target locatable - object
        vehicle package - locatable
        capacity-number - object
  )

  (:predicates 
     (road ?l1 ?l2 - location)
     (at ?x - locatable ?v - location)
     (in ?x - package ?v - vehicle)
     (capacity ?v - vehicle ?s1 - capacity-number)
     (capacity-predecessor ?s1 ?s2 - capacity-number)
     (available ?p - package)
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
        (increase (total-cost) (road-length ?l1 ?l2))
      )
  )

 (:action pick-up
    :parameters (?v - vehicle ?l - location ?p - package ?s1 ?s2 - capacity-number)
    :precondition (and
        (at ?v ?l)
        (at ?p ?l)
        (capacity-predecessor ?s1 ?s2)
        (capacity ?v ?s2)
        (available ?p)
      )
    :effect (and
        (not (at ?p ?l))
        (in ?p ?v)
        (capacity ?v ?s1)
        (not (capacity ?v ?s2))
        (not (available ?p))
        (increase (total-cost) 1)
      )
  )

  (:action drop
    :parameters (?v - vehicle ?l - location ?p - package ?s1 ?s2 - capacity-number)
    :precondition (and
        (at ?v ?l)
        (in ?p ?v)
        (capacity-predecessor ?s1 ?s2 - capacity-number)
        (capacity ?v ?s1)
      )
    :effect (and
        (not (in ?p ?v))
        (capacity ?v ?s2)
        (not (capacity ?v ?s1))
        (available ?p)
        (increase (total-cost) 1)
      )
  )

  (:action load
    :parameters (?l - location ?p - package)
    :precondition (and
        (at ?p ?l)
        (available ?p)
      )
    :effect (and
        (not (available ?p))
      )
  )

  (:action unload
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and
        (at ?v ?l)
        (in ?p ?v)
      )
    :effect (and
        (available ?p)
      )
  )

)
