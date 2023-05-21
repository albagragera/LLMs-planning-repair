; Transport city-sequential-4nodes-1000size-2degree-100mindistance-1trucks-3packages-2012seed

(define (problem transport-city-sequential-4nodes-1000size-2degree-100mindistance-1trucks-3packages-2012seed)
 (:domain transport)
 (:objects
  city-loc-1 - location
  city-loc-2 - location
  city-loc-3 - location
  city-loc-4 - location
  truck-1 - vehicle
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
  (= (road-length city-loc-2 city-loc-1) 18)

  (road city-loc-1 city-loc-2)
  (= (road-length city-loc-1 city-loc-2) 18)

  (road city-loc-3 city-loc-1)
  (= (road-length city-loc-3 city-loc-1) 48)

  (road city-loc-1 city-loc-3)
  (= (road-length city-loc-1 city-loc-3) 48)
 
  (road city-loc-3 city-loc-2)
  (= (road-length city-loc-3 city-loc-2) 30)

  (road city-loc-2 city-loc-3)
  (= (road-length city-loc-2 city-loc-3) 30)

  (road city-loc-4 city-loc-2)
  (= (road-length city-loc-4 city-loc-2) 45)
 
 ; (road city-loc-2 city-loc-4)
 ; (= (road-length city-loc-2 city-loc-4) 45)

 ; (road city-loc-4 city-loc-3)
 ; (= (road-length city-loc-4 city-loc-3) 28)

 ; (road city-loc-3 city-loc-4)
 ; (= (road-length city-loc-3 city-loc-4) 28)
  (at package-1 city-loc-3)
  (at package-2 city-loc-3)
  (at package-3 city-loc-1)
  (at truck-1 city-loc-4)
  (capacity truck-1 capacity-2)
 )
 (:goal (and
  (at package-1 city-loc-1)
  (at package-2 city-loc-1)
  (at package-3 city-loc-4)
 ))
 (:metric minimize (total-cost))
)
