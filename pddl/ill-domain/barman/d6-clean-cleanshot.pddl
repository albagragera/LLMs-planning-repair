(define (domain barman)
  (:requirements :strips)
  (:predicates
    (ontable ?obj - object)
    (handempty ?hand - hand)
    (clean ?obj - object)
    (holding ?hand - hand ?obj - object)
    (dispenses ?dispenser - dispenser ?ingredient - ingredient)
    (empty ?obj - object)
    (shaker-empty-level ?shaker - shaker ?level - level)
    (shaker-level ?shaker - shaker ?level - level)
    (next ?level1 - level ?level2 - level)
    (contains ?shot - shot ?cocktail - cocktail)
  )

  (:action pick-up
    :parameters (?obj - object ?hand - hand)
    :precondition (and (ontable ?obj) (handempty ?hand))
    :effect (and (not (ontable ?obj))
                 (not (handempty ?hand))
                 (holding ?hand ?obj)))

  (:action put-down
    :parameters (?obj - object ?hand - hand)
    :precondition (holding ?hand ?obj)
    :effect (and (ontable ?obj)
                 (handempty ?hand)
                 (not (holding ?hand ?obj))))

  (:action pour
    :parameters (?shot - shot ?cocktail - cocktail ?shaker - shaker)
    :precondition (and (holding left ?shaker)
                       (holding right ?shot)
                       (empty ?shot)
                       (not (shaker-empty-level ?shaker l2))
                       (not (contains ?shot ?cocktail)))
    :effect (and (not (holding right ?shot))
                 (contains ?shot ?cocktail)
                 (shaker-level ?shaker (next ?level1 ?level2))
                 (not (shaker-empty-level ?shaker ?level2))))

  (:action fill
    :parameters (?dispenser - dispenser ?shaker - shaker ?level - level ?ingredient - ingredient)
    :precondition (and (holding left ?shaker)
                       (not (shaker-empty-level ?shaker ?level))
                       (not (clean ?shaker))
                       (dispenses ?dispenser ?ingredient))
    :effect (and (not (shaker-empty-level ?shaker ?level))
                 (shaker-empty-level ?shaker (next ?level1 ?level))
                 (not (empty ?shaker))
                 (clean ?shaker)))

  (:action clean-shaker
    :parameters (?shaker - shaker)
    :precondition (and (holding left ?shaker) (not (clean ?shaker)))
    :effect (clean ?shaker))

  (:action clean-shot
    :parameters (?shot - shot)
    :precondition (not (clean ?shot))
    :effect (clean ?shot))
)
