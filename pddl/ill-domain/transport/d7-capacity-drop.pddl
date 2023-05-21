(define (domain transport)
  (:requirements :strips)
  (:predicates
    (at ?obj - object ?loc - location)
    (in ?obj - object ?truck - vehicle)
    (empty ?truck - vehicle)
    (capacity ?truck - vehicle ?c - capacity-number)
    (can-move ?truck - vehicle ?loc1 - location ?loc2 - location)
  )

  (:action move
    :parameters (?truck - vehicle ?loc1 - location ?loc2 - location)
    :precondition (and 
      (at ?truck ?loc1)
      (can-move ?truck ?loc1 ?loc2)
      (not (empty ?truck))
    )
    :effect (and 
      (at ?truck ?loc2)
      (not (at ?truck ?loc1))
      (forall (?obj - object) 
        (when (in ?obj ?truck)
          (not (at ?obj ?loc1))
          (at ?obj ?loc2)
        )
      )
    )
  )

  (:action load
    :parameters (?truck - vehicle ?package - package)
    :precondition (and 
      (at ?package ?loc)
      (at ?truck ?loc)
      (capacity ?truck ?c)
      (not (in ?package ?truck))
      (<= (+ ?c (capacity-predecessor ?c ?p)) (total-capacity))
    )
    :effect (and 
      (in ?package ?truck)
      (not (at ?package ?loc))
      (decrease (capacity ?truck) ?p)
    )
  )

  (:action unload
    :parameters (?truck - vehicle ?package - package ?loc - location)
    :precondition (and 
      (at ?truck ?loc)
      (in ?package ?truck)
    )
    :effect (and 
      (not (in ?package ?truck))
      (at ?package ?loc)
      (increase (capacity ?truck) ?p)
    )
  )

  (:action pickup
    :parameters (?truck - vehicle ?package - package ?loc - location)
    :precondition (and 
      (at ?truck ?loc)
      (at ?package ?loc)
      (not (in ?package ?truck))
      (capacity ?truck ?c)
      (<= (+ ?c (capacity-predecessor ?c ?p)) (total-capacity))
    )
    :effect (and 
      (in ?package ?truck)
      (not (at ?package ?loc))
      (decrease (capacity ?truck) ?p)
    )
  )

  (:action dropoff
    :parameters (?truck - vehicle ?package - package ?loc - location)
    :precondition (and 
      (at ?truck ?loc)
      (in ?package ?truck)
    )
    :effect (and 
      (not (in ?package ?truck))
      (at ?package ?loc)
      (increase (capacity ?truck) ?p)
    )
  )
)
