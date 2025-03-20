USE POKEMON_GO;

/*Ejercicio 1.- Muestra el nombre de todos los Pokemon que sean de tipo tierra.*/

select nombre
from pokemon
where tipo like "TIERRA";

/*Ejercicio 2.- Muestra el ID de los Pokemon de nombre Carmen o de altura mayor que 2*/

select id
from pokemon
where nombre like "CARMEN" or altura>2;

/*Ejercicio 3.- Muestra el tipo de los Pokemon con edad distinta a 32 
				sin que se repitan datos en el resultado.*/

select distinct tipo
from pokemon
where edad <> 32;

/*Ejercicio 4.- Muestra el nombre y tipo de los Pokemon que hayan nacido 
				en el año 2000 o 2001 ordenador alfabéticamente por el nombre.*/

select nombre, tipo
from pokemon
where year(fecha_nac)=2000 or year(fecha_nac)=2001
order by nombre asc;

/* Se puede usar también: where year(fecha_nac) in (2000, 2001, 2002)*/

/*Ejercicio 5.- Muestra el ID de los Pokemon que su nombre comience por la letra "C" 
				y contengan la letra "A" ordenados por el nombre del Pokemon.*/

select id
from pokemon
where nombre like "C%" and nombre like "%A%"
order by nombre asc;

/*Otra opción: where nombre like "C%A%"*/

/*Ejercicio 6.- Muestra todos pokemon que hayan nacido en el mes de octubre 
				o su edad esté entre 29 y 35 años (ambos incluidos).*/

select * 
from pokemon
where month(Fecha_nac)=10 or edad between 29 and 35;

/*Ejercicio 7.- Muestra El ID y la altura de los 2 Pokemon de mayor altura 
que en su nombre no contengan la letra "E" ordenados por la altura de mayor a menor.*/

select id, altura
from pokemon
where nombre not like "%E%"
order by altura desc
limit 2;

/*Ejercicio 8.- Muestra todos los datos de los Pokemon que sean de tipo 
PLANTA o ROCA, tengan una altura superior a 1.50 y su edad sea distina a 14.*/

select * 
from pokemon
where (tipo like "PLANTA" or tipo like "ROCA")
	   and (altura > 1.50 and edad <> 14);

/*Ejercicio 9.- Muestra los datos de los 3 Pokemon de menor edad que su 
nombre tenga una longitud exacta de 6 caracteres. Ordena el resultado de menor a mayor.*/

select * 
from pokemon
where char_length(nombre)=6
order by edad asc
limit 3;


/*Ejercicio 10.- Muestra el ID, Nombre y Edad de los Pokemon con un nombre que 
comience por la letra J, contenga una letra "M" y termine por la letra "A", 
o que su edad se muestre con un solo caracter. 
Ordena los resultados alfabéticamente por el nombre del Pokemon.*/

select id, nombre, edad
from pokemon
where (nombre like "J%" and nombre like "%M%" and nombre like "%A") or (char_length(edad)=1)
order by nombre asc;
