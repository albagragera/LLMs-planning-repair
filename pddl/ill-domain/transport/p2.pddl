; Transport city-sequential-4nodes-1000size-2degree-100mindistance-1trucks-1packages-2012seed

(define (problem transport-city-sequential-4nodes-1000size-2degree-100mindistance-1trucks-1packages-2012seed)
 (:domain transport)
 (:objects
  city-loc-1 - location
  city-loc-2 - location
  city-loc-3 - location
  city-loc-4 - location
  truck-1 - vehicle
  package-1 - package
  capacity-0 - capacity-number
  capacity-1 - capacity-number
  capacity-2 - capacity-number
  capacity-3 - capacity-number
  capacity-4 - capacity-number
 )
 (:init
  (capacity-predecessor capacity-0 capacity-1)
  (capacity-predecessor capacity-1 capacity-2)
  (capacity-predecessor capacity-2 capacity-3)
  (capacity-predecessor capacity-3 capacity-4)

  (road city-loc-2 city-loc-1)
  (road city-loc-1 city-loc-2)
  (road city-loc-3 city-loc-1)
  (road city-loc-1 city-loc-3)
  (road city-loc-3 city-loc-2)
  (road city-loc-2 city-loc-3)
  (road city-loc-4 city-loc-2)
  (road city-loc-2 city-loc-4)
  (road city-loc-4 city-loc-3)
  (road city-loc-3 city-loc-4)
  (at package-1 city-loc-3)
  (at truck-1 city-loc-3)
  (capacity truck-1 capacity-4)
 )
 (:goal (and
  (at package-1 city-loc-1)
 ))
)
