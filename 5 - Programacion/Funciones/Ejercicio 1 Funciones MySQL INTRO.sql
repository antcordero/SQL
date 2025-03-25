use cesur;

/*Ejercicio 1.- Crea una función que a partir de dos números, calcule y muestre 
el resultado de la multiplicación entre ambos.*/

delimiter //
create function multiplicarNumeros(num1 int, num2 int) returns int no sql
begin
declare resultado int;
set resultado = num1 * num2;
return resultado;
end//

select multiplicarNumeros(2, 5);

/*Ejercicio 2.- Crea una función que a partir de un número y una palabra, 
calcule y muestre el resultado de la suma del número y el número de caracteres de la palabra.*/

delimiter //
create function funcion2(num1 int, palabra varchar(10)) returns int no sql
begin
declare suma int;
declare numCaracteres int;
declare resultado int;

set suma = num1 + length(palabra);
set numCaracteres = char_length(palabra);
set resultado = concat("Suma = ", suma, " - Número Caracteres = ", numCaracteres);

return resultado;

end//

select funcion2(10, "hola");

/*Ejercicio 3.- Crea una función que a partir de dos palabras muestre 
como resultado las dos palabras separadas por el conector “y”.  
(Ejemplo: Palabra1: hola;  Palabra2: adios;  Resultado: hola y adios)*/

delimiter //
create function juntarPalabras(palabra1 varchar(10), palabra2 varchar(10)) returns varchar(255) no sql
begin
declare frase varchar(255);

set frase = concat(palabra1, " y ", palabra2);

return frase;
end//

select juntarPalabras("hola","adios");

/*Ejercicio 4.- Crea una función que calcule la división 
entre dos números insertados por el usuario a través de la 
función Select.  Ejemplo)  select division(21, 3);   Resultado: 7*/

delimiter //

end//

/*Ejercicio 5.- Crea una función dados dos números, uno insertado 
por el usuario, y otro dentro de la función, muestre una frase indicando 
si el número insertado por el usuario es mayor, menor o igual al otro.*/

