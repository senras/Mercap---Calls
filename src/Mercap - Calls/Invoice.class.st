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
	totalCost := localCalls inject: 0 into: [ :sum :each | sum + each getCost].
	
	^ totalCost
]

{ #category : #data }
Invoice >> getLongDistanceCallsCost [
	| longCalls totalCost |
	longCalls := calls select: [ :each | each isKindOf: LongDistanceCall ].
	totalCost := longCalls inject: 0 into: [ :sum :each | sum + (each getCost)].
	^ totalCost
]

{ #category : #data }
Invoice >> getTotalCost [
	
	^ (self getBaseCost  + self getLocalCallsCost + self getLongDistanceCallsCost)
]

{ #category : #accessing }
Invoice >> month [

	^ month
]

{ #category : #accessing }
Invoice >> month: aMonth year: aYear calls: listCalls [

	|monthCalls|
	"Throw error if year > 2024 or month>12 / month<1"
	monthCalls := listCalls.
	monthCalls := listCalls select: [ :each | (each callDateTime month = aMonth) and: [each callDateTime year = aYear]].

	calls:= monthCalls.
	
	month:= aMonth.
	year:= aYear.
]

{ #category : #data }
Invoice >> monthlyPayment [
	
	|baseCost localCost longDistanceCost totalCost |
	
	baseCost := self getBaseCost printShowingDecimalPlaces: 2.
	localCost := self getLocalCallsCost printShowingDecimalPlaces: 2.
	longDistanceCost := self getLongDistanceCallsCost printShowingDecimalPlaces: 2.
	totalCost := self getTotalCost printShowingDecimalPlaces: 2.
	
Transcript 
    nextPutAll: 'Period: '; nextPutAll: self month asString; nextPutAll: '/'; nextPutAll: self year asString; cr;
    nextPutAll: 'Basic subscription: '; nextPutAll: baseCost asString; cr;
    nextPutAll: 'Local calls cost: '; nextPutAll: localCost asString; cr;
    nextPutAll: 'National and international calls cost: '; nextPutAll: longDistanceCost asString; cr;
	 nextPutAll: 'Total cost: '; nextPutAll: totalCost asString; cr.
	
	

	
]

{ #category : #accessing }
Invoice >> year [

	^ year
]
