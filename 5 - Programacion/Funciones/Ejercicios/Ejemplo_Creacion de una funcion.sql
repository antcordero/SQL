-- Posiconarse en una base de datos
use cesur;

/*Cubrir la función con "delimiter //" y "end//" */
/*Delimiter con espacio*/
delimiter //
create function prueba(numero int) returns int no sql

/*Aqui empieza el cuerpo de la función*/
/*las funciones siempre tienen dentro del begin: declare, set y return*/
begin
declare resultado int;
set resultado = numero*2;
return resultado;
end//

/*Llamar función*/
select prueba(10);

/*función concat -> para intercalar texto con valores de variables 
	concat("valor final = ", resultado);
*/