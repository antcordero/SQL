use cesurmodej3;

/*Ejercicios Funciones Mysql - JUEGOS*/
/*Realiza el siguiente ejercicio propuesto mediante el Workbench de MySQL. Una vez realizado el ejercicio, comprueba que todas las condiciones funcionan de forma correcta.*/

/*Ejercicio 1.- Realiza una función donde el usuario pueda jugar a “cara o cruz”.
	- El usuario insertará su elección (“cara” o “cruz”) en la llamada a la función
	- La función escogerá de forma aleatoria una de las dos opciones
	- Al finalizar, la función mostrará el resultado del juego
	- El resultado del juego deberá incluir los siguientes elementos:
	- Elección del usuario (“cara” o “cruz”)
	- Elección generada en la función (“cara” o “cruz”)
	- Resultado del juego (“el usuario ha acertado” o “el usuario no ha acertado”)
*/

delimiter //
create function moneda(opcionJugador varchar (4)) returns varchar(255) no sql
begin

declare aleatorio int;
declare resultado varchar(255);
declare opcionPC varchar(4);

set aleatorio = rand()*(2-1)+1;

if aleatorio = 1 then
	set opcionPC = "cara";
else 
	set opcionPC = "cruz";
end if;

if opcionPC = opcionJugador then
	set resultado = concat("Opción Jugador: ", opcionJugador, " - Opción PC: ", opcionPC, " - El usuario ha acertado");
else 
	set resultado = concat("Opción Jugador: ", opcionJugador, " - Opción PC: ", opcionPC, " - El usuario no ha acertado");
end if;

return resultado;
end//

select moneda("cruz") as "Juego Moneda";

/*Ejercicio 2.- Realiza una función donde el usuario juegue contra la máquina a un juego de azar. 
El ganador será el que más se acerque al número generado por la función.
	- El usuario insertará un número (del 0 al 100) en la llamada a la función
	- La máquina generará un número (del 0 al 100) de forma aleatoria dentro de la función
	- La función generará  un número (del 0 al 100) de forma aleatoria dentro de la función
	- Al finalizar, la función mostrará el resultado del juego
	- El resultado del juego deberá incluir los siguientes elementos:
	- Numero insertado por el usuario
	- Numero generado por la máquina
	- Numero generado por la función
	- Resultado del juego (“el usuario gana” o “La máquina gana”, “Ambos jugadores empatan”)
*/

delimiter //
create function juegoAzar(opcionJugador int, opcionPC int) returns varchar(255) no sql
begin

declare resultado varchar(255);
declare opcionFuncion int;
declare diferenciaJugador int;
declare diferenciaPC int;

set opcionFuncion = rand()*(100-0)+0;
set diferenciaJugador = opcionFuncion - opcionJugador;
set diferenciaPC = opcionFuncion - opcionPc;

/*si la diferencia es negativa pasarla a positiva*/
if diferenciaJugador < 0 then
	set diferenciaJugador = diferenciaJugador * (-1);
end if;

if diferenciaPC < 0 then
	set diferenciaPC = diferenciaPC * (-1);
end if;

/*Comparación de diferencias*/
if diferenciaJugador < diferenciaPC then
	set resultado = concat("Número insertado por el usuario: ", opcionJugador, " Número generado por la máquina: ", opcionPC, " Número generado por la función: ", opcionFuncion, " -> El usuario gana");
elseif diferenciaJugador > diferenciaPC then
	set resultado = concat("Número insertado por el usuario: ", opcionJugador, " Número generado por la máquina: ", opcionPC, " Número generado por la función: ", opcionFuncion, " -> La máquina gana");
else
	set resultado = concat("Número insertado por el usuario: ", opcionJugador, " Número generado por la máquina: ", opcionPC, " Número generado por la función: ", opcionFuncion, " -> Ambos jugadores empatan");
end if;

return resultado;
end//

select juegoAzar(50, rand()*(100-0)+0) as "Juego Azar Juagor VS PC";
