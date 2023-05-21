(define (problem prob)
 (:domain barman)
 (:objects 
      shaker1 - shaker
      left right - hand
      shot1 - shot
      ingredient1 ingredient2 - ingredient
      cocktail1 - cocktail
      dispenser1 dispenser2 - dispenser
      l0 l1 l2 - level
)
(:init 
  (ontable shaker1)
  (ontable shot1)
  (dispenses dispenser1 ingredient1)
  (dispenses dispenser2 ingredient2)
  (clean shaker1)
  (empty shaker1)
  (empty shot1)
  (handempty left)
  (handempty right)
  (shaker-empty-level shaker1 l0)
  (shaker-level shaker1 l0)
  (next l0 l1)
  (next l1 l2)
  (cocktail-part1 cocktail1 ingredient1)
  (cocktail-part2 cocktail1 ingredient2)
  ; Additional facts to make the goal achievable
  (contains cocktail1 ingredient1)
  (contains cocktail1 ingredient2)
  (used shaker1)
  (handright right)
  (handleft left)
  (at shaker1 left)
  (at shot1 right)
  (at dispenser1 right)
  (at dispenser2 left)
  (dispensed dispenser1)
  (dispensed dispenser2)
  (mixed shaker1)
  (shaker-level shaker1 l2)
)

 (:goal
  (and
      (contains shot1 cocktail1)
)))
