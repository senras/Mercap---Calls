"
Class that abstracts a monthly bill of all the calls made during that month and year.  
It has month and year as instance variables.

Instance Variables
Month: Integer (1..12)
Year: Integer (1900..2024)
"
Class {
	#name : #Invoice,
	#superclass : #Object,
	#instVars : [
		'month',
		'year',
		'calls'
	],
	#category : #'Mercap - Calls-Base'
}

{ #category : #'instance creation' }
Invoice class >> month: aMonth year: aYear calls: collectionCalls [

	| invoice |
	invoice := self new month: aMonth year: aYear calls: collectionCalls.
	^invoice 
]

{ #category : #accessing }
Invoice >> calls [
	^calls
]

{ #category : #data }
Invoice >> getBaseCost [
	"Hardcoded value"
	^10
]

{ #category : #data }
Invoice >> getLocalCallsCost [
	| localCalls totalCost |
	localCalls := calls select: [ :each | each isKindOf: LocalCall ].
	"totalCost := localCalls collect: [:each | each getCost] sum."
	totalCost := localCalls inject: 0 into: [ :sum :each | sum + (each getCost)].
	
	^ totalCost
]

{ #category : #data }
Invoice >> getLongDistanceCallsCost [
	| longCalls totalCost |
	longCalls := calls select: [ :each | each isKindOf: InternationalCall ].
"	totalCost := longCalls collect: [:each | each getCost] sum."
	totalCost := longCalls inject: 0 into: [ :sum :each | sum + (each getCost)].
	^ totalCost
]

{ #category : #data }
Invoice >> getTotalCost [
	
	^ (self getLocalCallsCost + self getLongDistanceCallsCost)
]

{ #category : #accessing }
Invoice >> month [

	^ month
]

{ #category : #accessing }
Invoice >> month: aMonth year: aYear calls: listCalls [
	|monthCalls|
	
	monthCalls := listCalls select: [ :each | 
        (each callDateTime asDate month = aMonth and: [ each callDateTime asDate year = aYear ])
    ].
	month:= aMonth.
	year:= aYear.
	
	calls:= monthCalls.
]

{ #category : #data }
Invoice >> monthlyPayment [
	
	|baseCost localCost longDistanceCost |
	
	baseCost := self getBaseCost.
	localCost := self getLocalCallsCost.
	longDistanceCost := self getLongDistanceCallsCost.
	
Transcript 
    nextPutAll: 'Period: '; nextPutAll: self month asString; nextPutAll: '/'; nextPutAll: self year asString; cr;
    nextPutAll: 'Basic subscription: '; nextPutAll: baseCost asString; cr;
    nextPutAll: 'Local calls cost: '; nextPutAll: localCost asString; cr;
    nextPutAll: 'National and international calls cost: '; nextPutAll: longDistanceCost asString; cr.
	
	

	
]

{ #category : #accessing }
Invoice >> year [

	^ year
]
