create database peliculasEj5Mod2;
use peliculasEj5Mod2;

/*CREAR TABLA*/
/*
	- La columna ID debe ser la clave primaria de la tabla
	- La columna ID debe ser un valor entero e incrementar de forma automática
	- La columna Nombre debe tener contenido de caracteres (máximo 15 caracteres)
	- La columna Duración debe ser un valor entero y estar entre 50 y 200
		*Los datos de la duración representará a los minutos de duración de la pelicula
	- La columna Director debe tener contenido de caracteres (máximo 20 caracteres)
	- La columna Genero podrá tener valores de Acción, Terror, Aventura o comedia
	- La columna Puntuación deberá se un decimal (máximo 1 decimal)
	- La columna Fecha será de tipo fecha
*/
create table peliculas(
			ID int primary key,
			NOMBRE varchar(15),
            DURACION int constraint chk_duracion check(durecion between 50 and 200),
            DIRECTOR varchar(20),
            GENERO enum ("Acción", "Terror", "Aventura", "Comedia"),
            PUNTUACION decimal(2,1),
            FECHA date
) auto_increment = 1;

/*Insertar datos*/
insert into peliculas (ID, NOMBRE, DURACION, DIRECTOR, GENERO, PUNTUACION, FECHA) values
(1, 'A todo gas',120,'Rob Cohen','accion',6.3,'2001-10-12'),
(2, 'Hereditary',137,'Ary Aster','terror',9.1,'2018-02-22'),
(3, 'Avatar',154,'James Cameron','aventura',7.8,'2010-12-04'),
(4, 'Silent Hill',180,'Chirstopher Gans','terror',4.4,'2003-01-01'),
(5, 'Project X',98,'Nima Nourizadeh','comedia',5.8,'2012-06-16'),
(6, 'Anabelle',105,'Jhon R.Leonetti','terror',7.1,'2006-09-10');

/*Ejercicio 1.- Modifica la duración de las peliculas para que 
se muestre el contenido en horas en vez de en minutos*/

alter table peliculas
drop constraint chk_duracion;

alter table peliculas
modify duracion decimal;

alter table peliculas
modify duracion decimal(5,1);

update peliculas
set duracion = duracion/60;

select * from peliculas;

/*Ejercicio 2.- Modifica la Puntuación para que se muestren 2 decimales en vez de 1*/

alter table peliculas
modify puntuacion decimal;

alter table peliculas
modify puntuacion decimal(2,1);

select * from peliculas;

/*Ejercicio 3.- Modifica el número de caracteres permitidos en Nombre 
para que admita 25 caracteres*/

alter table peliculas
modify nombre varchar(25);

select * from peliculas;

/*Ejercicio 4.- Añade una nueva fila a la tabla con los datos 
de la película "La cabaña en el bosque"*/

insert into peliculas values
	(7, "La cabaña en el bosque", 4, "asis", "AVENTURA", 9, "2020-12-12");

/*Ejercicio 5.- Modifica la columna Puntación para que se llame Puntos*/

alter table peliculas
rename column puntuacion to Puntos;

select * from peliculas;

/*Ejercicio 6.- Añade una nueva columna Crítica que 
admita los valores (MALA, REGULAR, BUENA, MUY BUENA)*/

alter table peliculas
add column Crítica enum ("MALA", "REGULAR", "BUENA", "MUY BUENA");

select * from peliculas;

/*Ejercicio 7.- Añade valores a la columa Crítica siguiendo los siguientes criterios.
	A.- Si la pelicula tiene menos o igual a un 5 en la Puntuación, añade el valor MALA
	B.- Si la pelicula tiene más de un 5 y menos de un 6.5 en la Puntuación, añade el valor REGULAR
	C.- Si la pelicula tiene más o igual a un 6.5 y menos de un 8.5 en la Puntuación, añade el valor BUENA
	D.- Si la pelicula tiene más o igual a un 8.5 en la Puntuación, añade el valor MUY BUENA
*/

#A.- 
update peliculas
set crítica = "MALA"
where puntos <= 5;

select * from peliculas;

#B.-
update peliculas
set crítica = "REGULAR"
where puntos > 5 and puntos < 6.5;

select * from peliculas;

#C.-
update peliculas
set crítica = "BUENA"
where puntos >= 6.5 and puntos < 8.5;

select * from peliculas;

#D.-
update peliculas
set crítica = "MUY BUENA"
where puntos >= 8.5;

select * from peliculas;

/*Ejercicio 8.- Elimina las filas de las películas con ID superior a 6*/

delete 
from peliculas
where id >6;

/*Ejercicio 9.- Elimina las filas que sean del año 2010*/

delete 
from peliculas
where year(fecha) = 2010;
                  
select * from peliculas;

/*Ejercicio 10.- Elimina las filas de las películas dirigidas 
por Ary Aster y tengan una duración menor a 3 horas*/

delete 
from peliculas
where director like "Ary Aster" and duracion < 3;

select * from peliculas;

/*Ejercicio 11.- Elimina las filas de las películas que contengan una X en su nombre.*/

delete
from peliculas
where nombre like "%x%";

/*Ejercicio 12.- Elimina las filas de las películas del mes de enero, 
y que la crítica sea distina a BUENA o MUY BUENA.*/

delete
from peliculas
where month(fecha) and (critica not like "BUENA" or critica not like "MUY BUENA");

select * from peliculas;
