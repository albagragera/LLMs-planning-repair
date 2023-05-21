(define (domain barman)
  (:requirements :strips)
  (:predicates
    (ontable ?obj - object)
    (handempty ?hand - hand)
    (holding ?obj - object ?hand - hand)
    (clean ?obj - object)
    (dirty ?obj - object)
    (empty ?obj - container)
    (contains ?obj - container ?item - object)
    (dispenses ?dispenser - dispenser ?ingredient - ingredient)
    (shaker-empty-level ?shaker - shaker ?level - level)
    (shaker-level ?shaker - shaker ?level - level)
    (next ?level1 - level ?level2 - level)
  )

  (:action pickup
    :parameters (?obj - object ?hand - hand)
    :precondition (and (ontable ?obj) (handempty ?hand))
    :effect (and (not (ontable ?obj)) (not (handempty ?hand)) (holding ?obj ?hand) (dirty ?obj))
  )

  (:action putdown
    :parameters (?obj - object ?hand - hand)
    :precondition (and (holding ?obj ?hand) (dirty ?obj))
    :effect (and (ontable ?obj) (handempty ?hand) (not (holding ?obj ?hand)) (clean ?obj))
  )

  (:action empty-container
    :parameters (?container - container)
    :precondition (not (empty ?container))
    :effect (and (empty ?container) (forall (?item - object) (when (contains ?container ?item) (not (contains ?container ?item))))))
  )

  (:action fill-shaker
    :parameters (?shaker - shaker ?ingredient - ingredient ?level - level)
    :precondition (and (holding ?shaker ?hand) (clean ?shaker) (not (empty ?shaker)) (dispenses ?dispenser ?ingredient) (shaker-empty-level ?shaker ?level) (next ?level ?next-level))
    :effect (and (not (shaker-empty-level ?shaker ?level)) (shaker-empty-level ?shaker ?next-level) (shaker-level ?shaker ?level) (not (holding ?shaker ?hand)) (contains ?shaker ?ingredient) (dirty ?shaker))
  )

  (:action pour
    :parameters (?from - container ?to - container ?item - object)
    :precondition (and (contains ?from ?item) (not (empty ?to)))
    :effect (and (contains ?to ?item) (not (contains ?from ?item))))
)

