"
Instance Variables
	notWorkingCost:		<Object>
	weekendCost:		<Object>
	workingTimeCost:		<Object>

Las llamadas locales tienen distintos valores según la franja horaria en la que se realizan y el día. 
Para los días hábiles, de 8 a 20 hrs. el costo es de 0,20 centavos el minuto.
En el resto de las horas es de 0,10 centavos el minuto. 
Los sábados y domingos cuesta 0,10 centavos el minuto
"
Class {
	#name : #LocalCall,
	#superclass : #Call,
	#instVars : [
		'workingTimeCost',
		'notWorkingCost',
		'weekendCost'
	],
	#category : #'Mercap - Calls-Base'
}

{ #category : #accessing }
LocalCall >> getCost [
	| date isWeekDay isWorkingHour|
	date := callDateTime asDate.
	isWeekDay := false.
	isWorkingHour := false.
	
	(date weekdayIndex >= 1 and: date weekdayIndex < 6) 
	ifTrue: [ isWeekDay := true ].

	(callDateTime hour >= 8 and: callDateTime hour < 20) 
	ifTrue: [ isWorkingHour := true ].
	
	(isWeekDay and: isWorkingHour)
	ifTrue:  [ ^duration * 0.2 ]
	ifFalse: [ ^duration * 0.1 ] 

]

{ #category : #accessing }
LocalCall >> notWorkingCost [

	^ notWorkingCost
]

{ #category : #accessing }
LocalCall >> notWorkingCost: anObject [

	notWorkingCost := anObject
]

{ #category : #accessing }
LocalCall >> weekendCost [

	^ weekendCost
]

{ #category : #accessing }
LocalCall >> weekendCost: anObject [

	weekendCost := anObject
]

{ #category : #accessing }
LocalCall >> workingTimeCost [

	^ workingTimeCost
]

{ #category : #accessing }
LocalCall >> workingTimeCost: anObject [

	workingTimeCost := anObject
]
