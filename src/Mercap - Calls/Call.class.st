"
Abstract class that generalized the basic atributtes ""calltime and duration"" of any call (local, national and international calls).

Instance Variables
calltime:		<Time>
duration:		<Time>
"
Class {
	#name : #Call,
	#superclass : #Object,
	#instVars : [
		'callDateTime',
		'duration'
	],
	#category : #'Mercap - Calls-Base'
}

{ #category : #'instance creation' }
Call class >> callDateTime: aCallDateTime duration: aDuration [
	| call |
	call := self new.
	call callDateTime: aCallDateTime duration: aDuration. 
  ^call
]

{ #category : #accessing }
Call >> callDateTime [

	^ callDateTime
]

{ #category : #accessing }
Call >> callDateTime: arg1 duration: arg2 [

	callDateTime:= arg1.
	duration:= arg2.
]

{ #category : #accessing }
Call >> duration [

	^ duration
]

{ #category : #accessing }
Call >> getCost [
    self subclassResponsibility 
]
