"
Class that represents international calls made with other countries.

   Instance Variables
	country:	String
	Class Variables
	countries: Dictionary
"
Class {
	#name : #InternationalCall,
	#superclass : #LongDistanceCall,
	#instVars : [
		'country'
	],
	#classVars : [
		'Countries'
	],
	#category : #'Mercap - Calls-Base'
}

{ #category : #'class initialization' }
InternationalCall class >> Countries: countriesCosts [
 Countries:= countriesCosts 
]

{ #category : #'instance creation' }
InternationalCall class >> callDateTime: aCallDateTime duration: aDuration country: aCountry [
	| call |
	call := self callDateTime: aCallDateTime duration: aDuration.
	call country: aCountry.
	
  ^call
]

{ #category : #'class initialization' }
InternationalCall class >> initialize [ 
	
	Countries := Dictionary new.
	Countries
    at: 'United States' put: 2; 
    at: 'China' put: 4; 
    at: 'Japan' put: 5; 
    at: 'Germany' put: 3; 
    at: 'India' put: 2; 
    at: 'Canada' put: 3.
]

{ #category : #accessing }
InternationalCall >> country [

	^ country
]

{ #category : #accessing }
InternationalCall >> country: anObject [

	country := anObject
]

{ #category : #accessing }
InternationalCall >> getCost [
	 ^ self getCostWith: Countries  and: country


]
