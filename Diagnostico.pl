:-use_module(library(pce)).%Libreria para relaizarlo en modo grafico
:-use_module(library(pce_style_item)). %libreria que permite crear label, button etc para hacer diseño del sistema.
menu1:- %nombre de una regla que permite crear objetos
	new(Menu, dialog('PROLOG', size(500,500))), %tipo de dialogo con su tamaño
	new(L, label(nombre,'Diagnostico Medico')),  %label con el nombre que estara dentro del label
	%crear variables que va a contener preguntas y respuestas
	new(@texto, label(nombre,'segun la respuesta dadas se obtendra un resultado')),
	new(@respl, label(nombre,'')),
	 %crear boton de salir
	new(Salir, button('Salir', and(message(Menu, destroy),message(Menu,free)))),
	%crear boton para realizar el test con su variable
	new(@boton, button('Empezar Diagnostico',message(@prolog,botones))),
	%crear el tamaño de cada boton y de cada label
	send(Menu, append(L)),new(@btncarrera,button('Diagnostico?')),
	send(Menu, display,L,point(20,20)),
	send(Menu, display,@boton,point(100,150)),
	send(Menu, display,@texto,point(20,100)),
	send(Menu, display,Salir,point(20,200)),
	send(Menu, display,@respl,point(20,130)),
	send(Menu, open_centered),
	send(@texto,font,font(comic,bold,10)),
	send(L,font,font(comic,bold,25)).

%se observan las enfermedades que serviran para diagnosticar cada caso
enfermedades(colesterol):-colesterol,!.
enfermedades(diabete):-diabete,!.
enfermedades(gastritis):-gastritis,!.
enfermedades('sin resultado').
%se observan las enfermedades que serviran para diagnosticar cada caso
enfermedades(colesterol):-colesterol,!.
enfermedades(diabete):-diabete,!.
enfermedades(gastritis):-gastritis,!.
enfermedades('sin resultado').

%Reglas ------- toda la parte del conocimiento
colesterol :- tiene_colesterol,
pregunta('tiene inchazon en alguna extremidad del cuerpo?'),
pregunta('tiene perdida de equilibrio'),
pregunta('tiene adormecimiento de las extremidades'),
pregunta('tiene visión borrosa'),
pregunta('tiene dolor en el pecho'),
pregunta('tiene agitación al caminar o realizar las actividades físicas diarias'),
pregunta('tiene Ganas de dormir tras ingerir las comidas principales').

diabete :- tiene_diabete,
pregunta('padece de orinar con frecuencia'),
pregunta('tiene Boca y piel seca'),
pregunta('tiene náuseas o vómitos'),
pregunta('tiene Pérdida de peso'),
pregunta('tiene llagas o magulladuras que demoran en sanarse e infecciones frecuentes'),
pregunta('tiene	entumecimiento o sensación de hormigueo en los pies'),
pregunta('tiene encías rojas, hinchadas o adoloridas').

gastritis :- tiene_gastritis,
pregunta('tiene Hinchazón abdominal'),
pregunta('tiene Ardor de estómago'),
pregunta('tiene Cólicos estomacales'),
pregunta('tiene Sangre en las heces'),
pregunta('tiene Mal sabor de boca'),
pregunta('padece de Eructos'),
pregunta('padece de Gases o flatulencias').


desconocido :- se_deconoce_enfermedad.

%Es una guia para poder identificar que enfermedad es--??
tiene_colesterol:- pregunta('tiene inchazon en alguna extremidad del cuerpo?'),!.
tiene_diabete:- pregunta('padece de orinar con frecuencia'),!.
tiene_gastritis:- pregunta('Hinchazón abdominal'),!.

%que solo permita considerar "SI" o "NO"
:-dynamic si/1,no/1.

%Se dan la configuraciones donde se ira adaptando si o no de
%manera en que se vaya dando las preguntas en el cuadro de dialogo
preguntar(Problema):- new(Di,dialog('examen diagnostico')),
new(L2,label(texto,'Responde las siguientes preguntas:')),
new(La,label(prob,Problema)),
%se estan creando los botones "SI"/"NO"
new(B1,button(si,and(message(Di,return,si)))),
new(B2,button(no,and(message(Di,return,no)))),
send(Di,append(L2)),
send(Di,append(La)),
send(Di,append(B1)),
send(Di,append(B2)),

send(Di,default_button,si),
send(Di,open_centered),get(Di,confirm,Answer),
write(Answer),send(Di,destroy),

%se preguntara si o no del problema
((Answer==si)->assert(si(Problema));
assert(no(Problema)),fail).
pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).

%en caso de darle salir se limpiara
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

%se ira llamndo a las enfermedades
botones :- lim,
send(@boton,free),
send(@btncarrera,free),
enfermedades(Enfer),
send(@texto, selection('Su diagnostico segun los sintomas es: ')),

send(@respl, selection(Enfer)),
send(@respl,font,font(comic,bold,20)),
new(@boton, button('inicia',message(@prolog,botones))),
send(Menu, display,@boton,point(40,50)),
send(Menu, display,@btncarrera,point(20,50)),
limpiar.
lim:- send(@respl, selection('')).
