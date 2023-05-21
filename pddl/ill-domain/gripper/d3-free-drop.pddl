(define (domain gripper-strips)
  (:requirements :strips)
  (:predicates 
    (room ?r)
    (ball ?b)
    (gripper ?g)
    (at-robby ?r)
    (at ?b ?r)
    (free ?g)
    (carry ?o ?g)
    (not-at ?b ?r)
    (not-carrying ?o ?g)
  )

  (:action move
    :parameters (?from ?to)
    :precondition (and  
      (room ?from) 
      (room ?to) 
      (at-robby ?from)
    )
    :effect (and 
      (at-robby ?to)
      (not (at-robby ?from))
      (forall (?b) 
        (when (and (ball ?b) (at ?b ?from))
          (and (not (at ?b ?from)) (at ?b ?to) (not-carrying ?b ?g))
        )
      )
    )
  )

  (:action pick
    :parameters (?obj ?room ?gripper)
    :precondition (and 
      (ball ?obj) 
      (room ?room) 
      (gripper ?gripper)
      (at ?obj ?room) 
      (at-robby ?room) 
      (free ?gripper)
      (not-carrying ?obj ?gripper)
    )
    :effect (and 
      (carry ?obj ?gripper)
      (not (at ?obj ?room)) 
      (not (free ?gripper))
      (not-at ?obj ?room)
    )
  )

  (:action drop
    :parameters (?obj ?room ?gripper)
    :precondition (and 
      (ball ?obj) 
      (room ?room) 
      (gripper ?gripper)
      (carry ?obj ?gripper) 
      (at-robby ?room)
      (not-at ?obj ?room)
    )
    :effect (and 
      (at ?obj ?room)
      (not (carry ?obj ?gripper))
      (not-carrying ?obj ?gripper)
    )
  )
)
