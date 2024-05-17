"
Instance Variables
	city:		<Object>
			
	Class Variables
	Cities: Dictionary 

"
Class {
	#name : #NationalCall,
	#superclass : #LongDistanceCall,
	#instVars : [
		'city'
	],
	#classVars : [
		'Cities'
	],
	#category : #'Mercap - Calls-Base'
}

{ #category : #'instance creation' }
NationalCall class >> callDateTime: aCallDateTime duration: aDuration city: aCity [
	| call |
	call := self callDateTime: aCallDateTime duration: aDuration.
	call city: aCity.
	
  ^call
]

{ #category : #accessing }
NationalCall class >> cities [
	^Cities
	
]

{ #category : #accessing }
NationalCall class >> cities: aCollection [
	Cities:= aCollection 
	
]

{ #category : #'class initialization' }
NationalCall class >> initialize [ 
	| citiesDict |
	citiesDict := Dictionary new.
	citiesDict
    at: 'La Plata' put: 2; 
    at: 'Florencio Varela' put: 4; 
    at: 'Burzaco' put: 5; 
    at: 'Escobar' put: 3; 
    at: 'Santa Fe' put: 2; 
    at: 'Rosario' put: 3.
	self cities: citiesDict.
]

{ #category : #accessing }
NationalCall >> city [

	^ city
]

{ #category : #accessing }
NationalCall >> city: anObject [

	city := anObject
]

{ #category : #accessing }
NationalCall >> getCost [
	 ^ self getCostWith: Cities  and: city
]
