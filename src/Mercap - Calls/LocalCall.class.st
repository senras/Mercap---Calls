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
	#category : #'Mercap - Calls-Base'
}

{ #category : #accessing }
LocalCall >> getCost [

	((callDateTime asDate weekdayIndex between: 1 and: 6) and: [callDateTime hour between: 8 and: 20])
	ifTrue:  [ ^duration * 0.2 ]
	ifFalse: [ ^duration * 0.1 ] 

]
