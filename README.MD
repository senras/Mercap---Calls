## Decisiones de diseño:

- Opté por crear 2 clases principales: **Call** para las llamadas e **Invoice** para la factura mensual.
- **Call** es una clase **abstracta** que tiene los atributos comunes a las calls: ``CallDateTime`` (Hora y fecha de llamada) y ``duration``. 
Sin embargo, como clase abstracta tiene un método abstracto ``getCost()`` el cual sus subclases implementan. Adicionalmente tiene un método constructor y getters para sus atributos.

- **Call** cuenta con 2 subclases: **LocalCall** y **LongDistanceCall**; esta otra es una clase abstracta que hace de superclase a **InternationalCall** y **NationalCall**. 

- Opté por crear **LongDistanceCall** ya que las 2 clases hijas comparten una forma similar de calcular su costo. 
- Decidí que tanto **InternationalCall** como **NationalCall** tengan c/u una **variable de clase** de tipo ``Dictionary``. Esta ``Dictionary`` tiene como ``key`` el nombre de lugar y de ``value`` el costo del lugar.
Decidí utilizar una variable de clase ya que todas las instancias de estas 2 clases necesitan acceder al respectivo ``Dictionary`` de la clase para calcular su costo.

- Ambas clases hijas tiene un método de clase ``initialize`` para cargar los ``Dictionary`` con valores por default.

- La clase **Invoice** tiene de atributos ``month``, ``year`` y ``calls``. Tiene los getters de cada atributo, unos métodos para calcular los distintos costos de la factura, y un método constructor.
Este método constructor controla que se quede solo con las calls que correspondan al mes y año ingresados.

De los métodos para calcular costos:
- ``getBaseCost()`` devuelve un valor arbitrario.
- ``getLocalCallsCost()`` devuelve la suma de costos de todas las LocalCalls.
- ``getLongDistanceCallsCost()`` devuelve la suma de costos de todas las LongDistanceCalls.
- ``getTotalCost()`` devuelve la suma de todas las anteriores.
- ``monthlyPayment()`` devuelve los datos anteriores en pantalla como una factura mensual.


## Pendiente/mejorable:
- Validar al ingresar el ``month`` y el ``year`` de **Invoice** (``year`` debe ser <=2024 y ``month`` debe estar entre 1-12 ).
- Mismo control al crear llamadas.
- Se podría representar con variables los costos en las **LocalCall**, pero por practicidad puse solo los valores tal cual en el método ``getCost()``.

<br/>
<br/>
---

### Input para probar en Playground el programa:

```
| call1 call2 call3 calls invoice aux monthCalls dateLongAgo|

NationalCall initialize.
InternationalCall initialize.
dateLongAgo := DateAndTime today - 30 days.

calls := OrderedCollection new.
call1 := LocalCall callDateTime: DateAndTime today duration: 3.
call2 := NationalCall callDateTime: DateAndTime today duration: 3 city: 'La Plata'.
call3 := InternationalCall callDateTime: dateLongAgo duration: 5  country: 'Argentina'.

calls add: call1;	add: call2; add: call3.

invoice := Invoice month:5 year:2024 calls: calls.


invoice monthlyPayment.
Transcript show: '-----END-----';cr.
```

## Diagrama UML
![plot](https://github.com/senras/Mercap---Calls/blob/main/calls-uml.png)
