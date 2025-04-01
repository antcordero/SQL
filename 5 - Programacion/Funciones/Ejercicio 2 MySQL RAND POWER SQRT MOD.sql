use cesurmodej2;

/*RAND*/

/*
Ejercicio 1.- Realiza una función donde el usuario dicte un rango, y la máquina muestre un número aleatorio dentro de dicho rango.
- El usuario insertará 2 números en la ejecución de la función
- La máquina obtendrá un número aleatorio contenido en dicho rango
- La función mostrará el número aleatorio insertado en una frase (por ejemplo, “El número aleatorio es 17”)
*/

delimiter //
create function Ejercicio1(num1 int, num2 int) returns varchar(255) no sql
begin 
declare resultado varchar(255);

set resultado = concat("El número aleatorio es: ", round(rand()*(num1 - num2) + num2));

return resultado;
end//

select Ejercicio1(100,50) as "Función Ejercicio 1";

/*
Ejercicio 2.- Realiza una función donde el usuario trate de acertar el número que obtenga la máquina de forma aleatoria. 
- La máquina obtendrá un número del 5 al 10 (ambos incluidos)
- El usuario insertará 2 números en la ejecución de la función
- Si el usuario acierta el número de la máquina, la función mostrará la frase “Has acertado”
- Si el usuario no acierta el número de la máquina, la función mostrará la frase “Has fallado”
*/

delimiter //
create function Ejercicio2(numero int) returns varchar(50) no sql
begin
declare resultado varchar(50);
declare numSecreto int;

set numSecreto = rend()*(10 - 5) + 5;

if numero > numSecreto OR numero < numSecreto then
	set resultado = "Has fallado";
else 
	set resultado = "Has acertado";
end if;

return resultado;
end//

select Ejercicio2(7);

/*POWER*/

/*
Ejercicio 3.- Realiza una función que muestre las primeras 3 potencias de un número.
- El usuario insertará 1 número en la ejecución de la función
- La máquina obtendrá las 3 primeras potencias de dicho número
- La función mostrará el resultado en una frase (por ejemplo, “Las 3 primeras potencias del número 2 son 1, 2 y 4”)

Ejemplo) El usuario inserta el número 5
    • 1ª potencia → 50 = 1
    • 2ª potencia → 51 = 5
    • 3ª potencia → 52 = 25
	Resultado:  Las 3 primeras potencias del número 5 son 1, 5 y 25
*/

delimiter //
create function Ejercicio3(num int) returns varchar(255) no sql
begin
declare resultado varchar(255);
declare pot1 int;
declare pot2 int;
declare pot3 int;

set pot1 = power(num, 0);
set pot2  =power(num, 1);
set pot3 = power(num, 2);

set resultado = concat("Las 3 primeras potencias del número ", num, " son ", pot1, ", ", pot2, " y ", pot3);

return resultado;
end//

select Ejercicio3(2);


/*
Ejercicio 4.- Realiza una función que calcule la potencia de un número.
- El usuario insertará 2 números en la ejecución de la función
- El primer número será la base
- El segundo número será el exponente
- La máquina obtendrá el resultado del número elevado a dicho exponente
- La función mostrará el resultado en una frase (por ejemplo, “El número 2 elevado a 4 es igual a 16”)
*/

delimiter //
create function Ejercicio4(x int, y int) returns varchar(255) no sql 
begin

declare potencia int

set potencia = power(x,y);



end//

