/*Realiza las siguientes operaciones en el editor de MySQL Workbench.*/

/*Ejercicio 1.- Crea una base de datos de nombre CESUR.*/

create database CESUR;
use CESUR;

/*Ejercicio 2.- Crea una tabla de nombre ALUMNO dentro la base de datos CESUR.

La tabla deberá contener con siguientes campos: 
    • DNI: contenido de tipo caracteres (máximo 9 caracteres)
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
    • Apellido: contenido de tipo caracteres (máximo 20 caracteres)
    • Edad: contenido de tipo numérico
      
*DNI será el identificador de la tabla ALUMNO*/

create table alumno (
	dni varchar(9) primary key,
	nombre varchar(15),
    apellido varchar(20),
    edad int(3)
);

/*Ejercicio 3.- Crea una tabla de nombre GRADO dentro la base de datos CESUR. 

La tabla deberá contener con siguientes campos: 
    • ID: contenido de tipo numérico
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
    • Horas: contenido de tipo numérico
      
*ID será el identificador de la tabla GRADO*/

create table grado (
	id_grado int(3) primary key,
	nombre_grado varchar(15),
	horas int (2)
);

/*Ejercicio 4.- Añade una nueva columna de datos a la tabla ALUMNO de nombre Grado.

	El campo Grado debe tener las siguiente características:
    • Grado tendrá contenido de tipo numérico
    • Grado será clave foránea de la tabla ALUMNO, exportada de la tabla GRADO*/

alter table alumno add column grado int;

alter table alumno add constraint fk_grado 
foreign key (grado) references grado(id_grado);

/*Ejercicio 5.- Añade 5 filas de datos a la tabla ALUMNO y otras 5 filas de datos a la tabla GRADO.*/

insert into grado (id_grado, nombre_grado, horas) values
	(1, "DAW", 30),
    (2, "DAM", 30),
    (3, "ASIR", 30),
    (4, "SMR", 30),
    (5, "Peluqería", 25);

insert into alumno (dni, nombre, apellido, edad, grado) values
	("12345678A", "Elsa", "Pato", 20, 1),
    ("12345678B", "Esteban", "Quito", 21, 2),
    ("12345678C", "Aitor", "Menta", 25, 3),
    ("12345678D", "Aitor", "Tilla", 26, 4),
    ("12345678E", "Toni", "CM", 26, 4);
    
select * from grado;
select * from alumno;

