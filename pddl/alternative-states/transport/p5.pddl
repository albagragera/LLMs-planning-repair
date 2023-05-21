(define (problem transport-city-sequential-5nodes-1000size-3degree-100mindistance-2trucks-3packages-2012seed)
 (:domain transport)
 (:objects
  city-loc-1 - location
  city-loc-2 - location
  city-loc-3 - location
  city-loc-4 - location
  city-loc-5 - location
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

  (road city-loc-5 city-loc-3)
  (= (road-length city-loc-5 city-loc-3) 50)

  (road city-loc-3 city-loc-5)
  (= (road-length city-loc-3 city-loc-5) 50)

  (road city-loc-5 city-loc-4)
  (= (road-length city-loc-5 city-loc-4) 24)

  (road city-loc-4 city-loc-5)
  (= (road-length city-loc-4 city-loc-5) 24)
  
  ; additional facts:
  (at package-3 city-loc-1)
  (capacity truck-1 capacity-3)
  (capacity truck-2 capacity-2)
  (not (at package-1 city-loc-4))
  (not (at package-2 city-loc-2))
  (not (at truck-1 city-loc-4))
  (not (at truck-2 city-loc-5))
 )
 (:goal (and
  (at package-1 city-loc-4)
  (at package-2 city-loc-2)
  (at package-3 city-loc-5)
 ))
 (:metric minimize (total-cost))
)
