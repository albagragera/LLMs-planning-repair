; Transport two-cities-sequential-6nodes-1000size-4degree-100mindistance-2trucks-3packages-2012seed

(define (problem transport-two-cities-sequential-6nodes-1000size-4degree-100mindistance-2trucks-3packages-2012seed)
 (:domain transport)
 (:objects
  city-1-loc-1 - location
  city-2-loc-1 - location
  city-1-loc-2 - location
  city-2-loc-2 - location
  city-1-loc-3 - location
  city-2-loc-3 - location
  city-1-loc-4 - location
  city-2-loc-4 - location
  city-1-loc-5 - location
  city-2-loc-5 - location
  city-1-loc-6 - location
  city-2-loc-6 - location
  truck-1 - vehicle
  truck-2 - vehicle
  package-1 - package
  package-2 - package
  package-3 - package
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

  (road city-1-loc-2 city-1-loc-1)
  (road city-1-loc-1 city-1-loc-2)
  (road city-1-loc-3 city-1-loc-1)
  (road city-1-loc-1 city-1-loc-3)
  (road city-1-loc-4 city-1-loc-1)
  (road city-1-loc-1 city-1-loc-4)
  (road city-1-loc-4 city-1-loc-3)
  (road city-1-loc-3 city-1-loc-4)
  (road city-1-loc-5 city-1-loc-1)
  (road city-1-loc-1 city-1-loc-5)
  (road city-1-loc-5 city-1-loc-2)
  (road city-1-loc-2 city-1-loc-5)
  (road city-1-loc-6 city-1-loc-5)
  (road city-1-loc-5 city-1-loc-6)
  (road city-2-loc-2 city-2-loc-1)
  (road city-2-loc-1 city-2-loc-2)
  (road city-2-loc-3 city-2-loc-1)
  (road city-2-loc-1 city-2-loc-3)
  (road city-2-loc-3 city-2-loc-2)
  (road city-2-loc-2 city-2-loc-3)
  (road city-2-loc-4 city-2-loc-2)
  (road city-2-loc-2 city-2-loc-4)
  (road city-2-loc-4 city-2-loc-3)
  (road city-2-loc-3 city-2-loc-4)
  (road city-2-loc-5 city-2-loc-1)
  (road city-2-loc-1 city-2-loc-5)
  (road city-2-loc-5 city-2-loc-2)
  (road city-2-loc-2 city-2-loc-5)
  (road city-2-loc-5 city-2-loc-3)
  (road city-2-loc-3 city-2-loc-5)
  (road city-2-loc-5 city-2-loc-4)
  (road city-2-loc-4 city-2-loc-5)
  (road city-2-loc-6 city-2-loc-1)
  (road city-2-loc-1 city-2-loc-6)
  (road city-1-loc-6 city-2-loc-6)
  (road city-2-loc-6 city-1-loc-6)

  (at package-1 city-1-loc-2)
  (at package-2 city-1-loc-4)
  (at package-3 city-1-loc-1)
  (at truck-1 city-2-loc-1)
  (capacity truck-1 capacity-3)
  (at truck-2 city-2-loc-2)
  (capacity truck-2 capacity-3)
 )
 (:goal (and
  (at package-1 city-2-loc-4)
  (at package-2 city-2-loc-2)
  (at package-3 city-2-loc-3)
 ))
)
