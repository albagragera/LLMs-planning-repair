(define (problem prob)
 (:domain barman)
 (:objects 
      shaker1 - shaker
      left right - hand
      shot1 - shot
      ingredient1 ingredient2 ingredient3 - ingredient
      cocktail1 - cocktail
      dispenser1 dispenser2 dispenser3 - dispenser
      l0 l1 l2 - level
)
 (:init 
  (ontable shaker1)
  (ontable shot1)
  (dispenses dispenser1 ingredient1)
  (dispenses dispenser2 ingredient2)
  (dispenses dispenser3 ingredient3)
  (clean shaker1)
  (clean shot1)
  (empty shaker1)
  (empty shot1)
  (handempty right)
  (shaker-empty-level shaker1 l2)
  (shaker-level shaker1 l2)
  (next l0 l1)
  (next l1 l2)
  (cocktail-part1 cocktail1 ingredient1)
  (cocktail-part2 cocktail1 ingredient3)
  (contains cocktail1)
  (ingredient-available ingredient1)
  (ingredient-available ingredient3)
  (not (contains shot1 cocktail1))
)
 (:goal
  (and
      (contains shot1 cocktail1)
)))
