create database examenPrueba;
use examenPrueba;

create table Alumnos (
DNI varchar(11),
Nombre varchar(10),
Apellido varchar(10),
Edad int,
Ciudad varchar(10)
);

create table Productos (
DNI varchar(11),
NumProductos int
);

INSERT INTO Alumnos VALUES
('47657450-L','Jon','Zamora','29','Irun'),
('47657450-L','Jon','Zamora','29','Madrid'),
('42000201-T','Daniel','García','31','Cancun'),
('32120101-F','Fernando','López','19','Madrid'),
('10000000-R','Ramiro','Ramiro','21','Bilbao'),
('10000000-R','Ramiro','Ramiro','21','Barcelona'),
('44566812-M','Marius','Mario','20','Irun');

INSERT INTO Productos VALUES
('47657450-L','4'),
('44566812-M','1'),
('42000201-T','0'),
('32120101-F','0'),
('10000000-R','2');

/*Ejercicio 1.- Realiza una consulta que devuelva todos los datos ordenados alfabéticamente por el nombre del alumno.*/

select * 
from alumnos as a inner join productos as p on p.dni=a.dni
order by a.nombre;

/*Ejercicio 2.- Realiza una consulta que devuelva la media de edad de los alumnos, en una columna que se denomine "MediaEdad".*/

select avg(a.edad) as MediaEdad
from alumnos as a;

/*Ejercicios 3.- Realiza una consulta que devuelva los datos de todos los alumnos que tengan un nombre que comience por la letra "J" y tengan una apellido que contenga la letra "a".*/

select distinct *
from alumnos as a 
where a.nombre like "j%" and a.apellido like "%a%";

/*Ejercicio 4.- Realiza una consulta que devuelva los alumnos que vivan en la ciudad Irun, Madrid o Bilbao.*/

select distinct *
from alumnos as a 
where a.ciudad in ("Irun", "Madrid", "Bilbao");

/*Ejercicio 5.- Realiza una consulta que devuelva el nombre, apellido y edad de los 3 alumnos con mayor edad, ordenados de mayor a menor edad.*/

select distinct a.nombre, a.apellido, a.edad
from alumnos as a 
order by a.edad desc
limit 3;

/*Ejercicio 6.- Realiza una consulta que devuelva el número de alumnos integrados en la base de datos, en una columna que se denomine "NºAlumnos".*/

select count(distinct a.dni) as NºAlumnos
from alumnos as a;

/*Ejercicio 7.- Realiza una consulta que devuelva el número de productos comprados por cada alumno, siempre que el alumno haya realizado alguna compra.
				La consulta debe devolver el nombre del alumno junto al número de compras realizadas por este.*/

select distinct a.nombre, p.numproductos
from alumnos as a inner join productos as p on a.dni=p.dni
where p.numproductos > 0;

/*Ejercicio 8.- Realiza una consulta que devuelva los alumnos que tengan entre 22 y 28 años (ambos NO incluidos).*/

select a.*
from alumnos as a 
where a.edad between 23 and 28;

/*Ejercicio 9.- Realiza una consulta que devuelva el DNI de los alumnos con el mismo nombre y apellido.*/

select distinct a.dni
from alumnos as a 
where a.nombre like a.apellido;

/*Ejercicio 10.- Realiza una consulta que devuelva el número máximo y el número mínimo de productos de la tabla Pedidos, en dos columnas correspondientes denominadas "NºMáximo" y "NºMínimo".*/

select max(p.numproductos) as Nº_Máximo, min(p.numproductos) as Nº_Mínimo
from productos as p;
