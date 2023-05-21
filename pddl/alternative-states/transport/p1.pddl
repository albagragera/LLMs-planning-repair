(define (problem transport-city-sequential-3nodes-1000size-2degree-100mindistance-1trucks-1packages-2012seed)
 (:domain transport)
 (:objects
  city-loc-1 - location
  city-loc-2 - location
  city-loc-3 - location
  truck-1 - vehicle
  package-1 - package
  capacity-0 - capacity-number
  capacity-1 - capacity-number
  capacity-2 - capacity-number
  capacity-3 - capacity-number
  capacity-4 - capacity-number
 )
 (:init
  (= (total-cost) 0)
  (capacity-predecessor capacity-0 capacity-1)
  (capacity-predecessor capacity-1 capacity-2)
  (capacity-predecessor capacity-2 capacity-3)
  (capacity-predecessor capacity-3 capacity-4)

  (road city-loc-2 city-loc-1)
  (= (road-length city-loc-2 city-loc-1) 40)

  (road city-loc-1 city-loc-2)
  (= (road-length city-loc-1 city-loc-2) 40)

  (road city-loc-3 city-loc-1)
  (= (road-length city-loc-3 city-loc-1) 27)

  (road city-loc-1 city-loc-3)
  (= (road-length city-loc-1 city-loc-3) 27)

  (road city-loc-3 city-loc-2)
  (= (road-length city-loc-3 city-loc-2) 41)

  (road city-loc-2 city-loc-3)
  (= (road-length city-loc-2 city-loc-3) 41)
  
  ; add the following initial conditions to make the problem solvable:
  
  (at package-1 city-loc-1)
  (at truck-1 city-loc-1)
  (capacity truck-1 capacity-4)
  (capacity truck-1 capacity-3)
  (capacity truck-1 capacity-2)
 )
 (:goal (and
  (at package-1 city-loc-2)
 ))
 (:metric minimize (total-cost))
)
