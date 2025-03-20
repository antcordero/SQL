/*Ejercicio 1.- Crea una BD de nombre NOTAS.*/

create database notas;
use notas;

/*Ejercicio 2.- Crea una tabla ALUMNOS en la BD NOTAS con los siguientes contenidos.
    • DNI: contenido de tipo caracteres (máximo 9 caracteres)
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
    • Apellido: contenido de tipo caracteres (máximo 15 caracteres)
    • Edad: contenido de tipo numérico (máximo 2 dígitos)
    • Fecha_nacimiento: contenido de tipo fecha
    • Genero:  contenido con 3 valores posibles (Masculino, Femenino u Otros)
*Haz que el valor DNI de la tabla ALUMNO sea identificador
      *Todos los campos podrán contener valores NULL, a excepción del DNI, Nombre y Apellido*/
      
create table alumnos (
	dni varchar(9) primary key,
	nombre varchar(15) not null,
    apellido varchar(15) not null,
    edad decimal(2,0) not null,
    fecha_nacimiento date,
    genero enum ("masculino", "femenino", "otros")
);

/*Ejercicio 3.- Crea una tabla ASIGNATURAS en la BD NOTAS con los siguientes contenidos.
    • ID:  contenido de tipo numérico (máximo 1 dígito)
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
    • Grado: contenido de tipo caracteres (máximo 6 caracteres)
    • Curso: contenido con 2 valores posibles (1 o 2)
*Haz que el valor ID de la tabla ASIGNATURAS sea identificador
*Todos los campos podrán contener valores NULL, a excepción del ID y Curso*/

create table asignaturas (
	id decimal(1,0) primary key,
	nombre varchar(15) not null,
    grado varchar(6),
    curso enum ("1", "2") not null
);

/*Ejercicio 4.- Crea una tabla NOTAS en la BD NOTAS con los siguientes contenidos
    • COD: contenido númerico auto incremental 
    • Nota: contenido de tipo decimal (máximo 2 decimales)
    • Profesor: contenido de tipo caracteres (máximo 20 caracteres)
*Haz que el valor COD de la tabla NOTAS sea identificador
*Todos los campos podrán contener valores NULL. 
*Las notas podrán tener hasta 2 decimales. La nota mínima será de un 0.00 y la nota máxima 9.99.*/

create table notas (
	cod int auto_increment primary key,
    nota decimal(2,1) constraint chk_nota check (nota>=0.00 and nota<=9.99),
    /*nota decimal(3,2)*/
    profesor varchar(20)
) auto_increment=50;
/*para que el auto_incremento empiece a partir de 50*/

/*Ejercicio 5.- Realiza las siguientes modificaciones en la tabla NOTAS.
	- Añade una nueva columna ID_Alumno que referencie al DNI de la tabla ALUMNO
	- Añade una nueva columna ID_Asignaturas que referencie a al ID de la tabla ASIGNATURAS*/

alter table notas add column dni_alumno varchar(9);
alter table notas add constraint fk_alumno
foreign key (dni_alumno) references alumnos(dni);

alter table notas add column id_asignatura decimal(1,0);
alter table notas add constraint fk_asignatura
foreign key (id_asignatura) references asignaturas(id);

/*Ejercicio 6.- Añade 5 filas de datos diferentes a NULL en las 3 tablas creadas en la base de datos.*/


insert into alumnos (dni, nombre, apellido, edad, fecha_nacimiento, genero) values
	("12345678A", "Elsa", "Pato", 26, "1998-01-20", "femenino"),
    ("22345678B", "Esteban", "Quito", 26, "1998-01-20", "masculino"),
    ("32345678C", "Aitor", "Menta", 25, "1998-01-20", "masculino"),
    ("42345678D", "Aitor", "Tilla", 26, "1998-01-20", "masculino"),
    ("52345678E", "Toni", "CM", 26, "1998-01-20", "masculino");

insert into asignaturas (id, nombre, grado, curso) values
	(1, "BaseDatos", "DAW", 1),
    (2, "Programación", "DAW", 1),
    (3, "Lenguaje", "DAM", 1),
	(4, "E.Servidor", "DAW", 2),
    (5, "E.Cliente", "DAM", 2);

insert into notas (nota, profesor, dni_alumno, id_asignatura) values
	(8.50, "Jon",  "12345678A", 1),
    (9.50, "José Antonio",  "22345678B", 2),
    (8.75, "Francisco",  "32345678C", 2),
    (6.50, "Victor",  "42345678D", 3),
    (7.50, "Jon",  "2345678E", 4);

select * from asignaturas;
select * from alumnos;
select * from notas;
