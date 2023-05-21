(define (domain blocks)
  (:requirements :strips)
  (:predicates (on ?x ?y)
               (ontable ?x)
               (clear ?x)
               (handempty)
               (holding ?x)
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and (not (ontable ?x))
                 (not (clear ?x))
                 (not (handempty))
                 (holding ?x)
                 (forall (?y) (when (on ?x ?y) (and (clear ?y) (not (on ?x ?y))))))
    )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (not (holding ?x))
                 (clear ?x)
                 (handempty)
                 (forall (?y) (when (clear ?y) (not (on ?x ?y))))))
    
  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x))
                 (not (clear ?y))
                 (clear ?x)
                 (handempty)
                 (on ?x ?y)
                 (forall (?z) (when (on ?x ?z) (and (clear ?z) (not (on ?x ?z)))))))
    
  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x)
                 (not (clear ?x))
                 (not (handempty))
                 (not (on ?x ?y))
                 (forall (?z) (when (clear ?z) (not (on ?x ?z)))))))