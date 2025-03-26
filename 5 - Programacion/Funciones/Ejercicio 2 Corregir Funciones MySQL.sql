/*
	Ejercicio 1.- 
*/

/*Error -> Solución: delimiter // (con espacio)*/
delimiter
create function `ejercicio7`(nom varchar(15), apellido varchar(15)) returns varchar(50) DETERMINISTIC
begin
/*Error -> Solución: varchar con más caracteres*/
declare resultado varchar(20);

set resultado=concat("Bienvenido ", nom, " ", apellido,"!!");

return resultado;
/*Error -> Solución: end//*/
end

select ejercicio7("jon", "zamora");


/*
	Ejercicio 2.- 
*/

delimiter //
/*Error -> Solución: function */
create funtion `ejercicio1`(num1 int, operacion varchar(15)) returns VARCHAR(20) NO SQL
begin

/*Error -> Solución: falta declarar el num2*/

/*Error -> Solución: resultado sin declarar como decimal*/

if operacion="suma" then
	set resultado=num1+num2;
elseif operacion="resta" then
	set resultado=num1-num2;
elseif operacion="division" then
	/*Error -> Solución: div redondea, mejor con /*/
	set resultado=num1 div num2;
elseif operacion="multiplicacion" then
	set resultado=num1*num2;
end if;
return resultado;
end //


/*
	Ejercicio 3.- 
*/

delimiter //
create function `ejercicio2`(num1 int) returns int NO SQL
/*Error -> Solución: falta el begin*/
declare resultado int;
/*Error -> Solución: falta el set resultado*/
resultado=power(num1, 2);
return resultado;
end //


/*
	Ejercicio 4.-
*/
delimiter //
create function `ejercicio3`(num1 int, operacion varchar(10)) returns int NO SQL
begin
/*Error -> Solución: es declare no set en este momento*/
set resultado int /*Error -> Solución: falta ;*/

if operacion="potencia" /*Error -> Solución: falta el then*/
	set resultado=power(num1, 2);
elseif operacion="raiz" /*Error -> Solución: falta el then*/
	set resultado=sqrt(num1);
end if;
    
return resultado;
end //


/*
	Ejercicio 5.-
*/

/*Error -> Solución: delimiter // (faltan las barras)*/
delimiter
function `ejercicio6`(num1 int) returns int(15) NO SQL /*Error -> Solución: falta create function y el return varchar*/
begin
declare resultado int(15); /*Error -> Solución: resultado debe ser varchar*/
declare aleatorio int;

set aleatorio=random()*(10-1)+1; /*Error -> Solución: es rand no random*/

if aleatorio=num1 then
	set resultado="Has acertado"
else if aleatorio distinct num1  then /*Error -> Solución: elseif va junto*/
	set resultado="Has fallado"
end if;

return resultado
/*Error -> Solución: end//*/
end



/*
	Ejercicio 6.-
*/

delimiter //
create function `ejercicio5`() returns varchar(50) DETERMINISTIC

/*Error -> Solución: faltan el begin y los declare*/
resultado varchar(20);
numero int;
Resto int;

/*Error -> Solución: faltan el set*/
numero=30;

set resto=mod(numero, num1); /*mod también puede ser % como en java*/

if resto=0 then
	set resultado=concat("el numero es divisible por ", num1);
elseif resto<>0 then
	set resultado=concat("el numero no es divisible por ", num1);
end if;

return resultado;
end //
