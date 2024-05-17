"
Abstract class that generalized the long distance calls that share methods and variables in common (InternationalCall and National Call).
"
Class {
	#name : #LongDistanceCall,
	#superclass : #Call,
	#category : #'Mercap - Calls-Base'
}

{ #category : #accessing }
LongDistanceCall >> getCost [
    self subclassResponsibility 




]

{ #category : #accessing }
LongDistanceCall >> getCostWith: aListOfPlaces and: aPlace [
   (aListOfPlaces includesKey: aPlace) 
	ifTrue: [ ^(aListOfPlaces at: aPlace) * duration ]
	ifFalse: [ ^10 * duration ].




]
