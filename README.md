#DIAGNOSTICO


# ÍNDICE


- Introducción
- Problemática
- Justificación
- Desarrollo
- Resultados
- Conclusión
- Referencias

* * *

# INTRODUCCIÓN

##### ¿Que es la programación lógica?
Es un leguaje declarativo e interpretado, en este tipo de lenguajes se representan los conocimientos sobre  un determinado dominio y sus relaciones. A partir de ese conocimiento, se deducen las respuestas a las cuestiones planteadas, es decir se obtiene una inferencia.


En definitiva, nuestros programas estarán formados por:
La base de conocimientos: Hechos + Reglas de Inferencia.

- 	Hecho: cosa que sucede.
-  	Regla: relación entre hechos.

El conjunto de objetivos o metas.

##### ¿Para que nos sirve la programación Lógica?

Nos sirve para que el software se adapte a una problemática de nuestra vida diaria y hacernos la vida más fácil, con la programación lógica hacernos que el software se adapte a una situación a la que aún no tenga solución o sea una nueva solución ahorrando problemas pasados.
* * *
# PROBLEMÁTICA
Cuando se tiene una enfermedad o algun sintoma de ella se va al doctor el cual llena un cuestionario en una hoja de papel y te hace preguntas de como te sientes y que sintomas presentas y conforme se van contestando las preguntas el va deduciendo mediante sus conocimientos cual es la enfermedad que padece el paciente.
![](https://github.com/edghareii/proyecto/blob/master/encuesta.jpg)

* * *
# JUSTIFICACION
Mediante eso se desarrollo un formulario médico con programacion logica basado en síntomas de ciertas enfermedades nos dira el programa cual es la enfermedad que padece el paciente, esto facilitara el proceso de rellenar los diagnosticos medicos.
* * *
# DESARROLLO

Se crearon la enfermadades que nos va ha servir para diagnosticar cada caso:

```ruby 
   enfermedades(colesterol):-colesterol,!. 
    enfermedades(diabete):-diabete,!.       
    enfermedades(gastritis):-gastritis,!.   
    enfermedades('sin resultado').    
    ```

Se crearon las pregunatas por cada enfermedad:
- - -
```ruby  
  colesterol :- tiene_colesterol,
   pregunta('tiene inchazon en alguna extremidad del cuerpo?'),
   pregunta('tiene perdida de equilibrio'),

   diabete :- tiene_diabete,
   pregunta('padece de orinar con frecuencia'),
   pregunta('tiene Boca y piel seca'),

   gastritis :- tiene_gastritis,
   pregunta('tiene Hinchazón abdominal'),
   pregunta('tiene Ardor de estómago'),
   ```

en caso de padecer alguna enfermadad que no esta agregada en el programa este dira que es desconocido.

`  desconocido :- se_deconoce_enfermedad.`

esto es una guia para poder identificar que enfermedad en caso de contestar la primera pregunta  con un "SI" entrara a la primera enfermedad y pasara a contestar los sintomas de dicha en enfermedad, en el caso de contestar con un "NO" pasara a la siguiente enfermedad.

```ruby
  tiene_colesterol:- pregunta('tiene inchazon en alguna extremidad del cuerpo?'),!.
   tiene_diabete:- pregunta('padece de orinar con frecuencia'),!.
   tiene_gastritis:- pregunta('Hinchazón abdominal'),!.
   ```
* * *

# RESULTADOS

![](https://github.com/edghareii/proyecto/blob/master/interfaz1.JPG)


![](https://github.com/edghareii/proyecto/blob/master/interfaz2.JPG)


![](https://github.com/edghareii/proyecto/blob/master/interfaz3.JPG)






# CONCLUSIÓN
A diferencia  de los lenguajes de programación clásicos, que dividen un problema en áreas y procedimientos, detallándolos paso a paso de una manera explicita mediante instrucciones;  Prolog permite describir estructuras de datos,  sus relaciones y objetivos por ser un lenguaje declarativo; y el proceso por el cual ejecuta la tareas no se establece de forma explícita en el programa sino que se determina por el  proceso de traducción del lenguaje. Vale decir entonces que el Lenguaje Prolog tiene una estructura de programación orientada a dar soluciones a  problemas del  área de aplicación de la Inteligencia Artificial mediante estructuras de programación orientadas a la  resolución de problemas de una manera no-clásica.




# REFERENCIAS
[http://comohacerpara.com/sintomas-de-colesterol-alto_7842a.html](http://)
[http://sintomas.com.es/gastritis](http://)
[https://medlineplus.gov/spanish/ency/article/000305.htm](http://)
[https://www.youtube.com/watch?v=jIv5Wn_Zgnc&t=225s](http://)
[https://www.youtube.com/watch?v=F8aE_iIjS2I&t=14s](http://)
[https://www.youtube.com/watch?v=F8aE_iIjS2I&t=14s](http://)


