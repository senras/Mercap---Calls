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

{ #category : #'instance creation' }
InternationalCall class >> callDateTime: aCallDateTime duration: aDuration country: aCountry [
	| call |
	call := self callDateTime: aCallDateTime duration: aDuration.
	call country: aCountry.
	
  ^call
]

{ #category : #'class initialization' }
InternationalCall class >> countries [
	^Countries
]

{ #category : #'class initialization' }
InternationalCall class >> countries: aCollection [
 Countries:= aCollection 
]

{ #category : #'class initialization' }
InternationalCall class >> initialize [ 
	| countriesDict |
	countriesDict := Dictionary new.
	countriesDict
    at: 'United States' put: 2; 
    at: 'China' put: 4; 
    at: 'Japan' put: 5; 
    at: 'Germany' put: 3; 
    at: 'India' put: 2; 
    at: 'Canada' put: 3.
	
	self countries: countriesDict.
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
	 ^ self getCostWith: Countries and: country


]
