create database Mundial;
use Mundial;

/* Ejercicio 1 */

create table Equipo (
	id int primary key auto_increment,
    nombre varchar(12) constraint chk_nombre check (char_length(nombre)>=5 and (nombre like "%a%" or
																				 nombre like "%e%" or 
																				 nombre like "%i%" or 
																				 nombre like "%o%" or 
																				 nombre like "%u%") ) not null,
    edad int constraint chk_edad check (edad between 18 and 64) not null,
    color enum ("unico" , "multicolor") default "unico" not null
)auto_increment = 101;

create table jugador (
	dni varchar(9) primary key,
    nombre varchar(15) constraint chk_nombreJug check (char_length(nombre)>=5 and nombre like "%a%a%") not null,
	apellido varchar(10) not null,
    altura decimal(2,1) constraint chk_altura check (altura between 1.2 and 2.1) not null,
    fecha_nac date constraint chk_fechaNac check (month(fecha_nac) not in (1, 3, 5, 7, 9, 11)) not null,
    hora_nac time not null
);

/* Ejercicio 2 */

insert into Equipo (nombre, edad, color) values
	("España", 23, "multicolor"),
    ("Camerun", 22, "multicolor"),
    ("Marruecos", 21, "unico"),
    ("Brasil", 28, "unico");

alter table jugador
drop constraint chk_nombreJug;

alter table jugador
modify apellido varchar(10) null;

alter table jugador
drop constraint chk_fechaNac;

alter table jugador
add constraint chk_fechaNac check (month(fecha_Nac) not in (1, 5, 7, 9, 11));

insert into jugador (dni, nombre, apellido, altura, fecha_nac, hora_nac) values
	("45566888R", "Leo", "Messi", 1.7, "1986-10-22", "12:40:00"),
    ("44566876R", "Neymar", null, 1.8, "1990-12-12", "17:23:21"),
    ("41066899R", "Carlos", "Casemiro", 1.9, "1992-03-23", "00:00:12");

select * from Equipo;
select * from jugador;


/*Realiza los ejercicios 3 y 4 utilizando la base de datos Netflix expuesta a continuación.*/
CREATE DATABASE IF NOT EXISTS NetflixRepaso;
USE NetflixRepaso;

CREATE TABLE IF NOT EXISTS Peliculas(
	id_peli int,
    nombre VARCHAR(30),
    duracion INT,
    director VARCHAR(20),
    genero ENUM ('acción', 'drama', 'comedia'),
    nota FLOAT
    ,actor INT,primary key (id_peli)
);

CREATE TABLE IF NOT EXISTS Actores(
	id_actor INT,
    nombre VARCHAR(30),
    fecha_nac DATE,
    sueldo INT,
    genero ENUM ('femenino', 'masculino', 'otros'),
    primary key (id_actor)
);

INSERT INTO Actores(id_actor, nombre, fecha_nac, sueldo, genero) VALUES
	(101, 'Leonardo', '1980-12-01' , 3000000, 'masculino'),
    (102, 'Julia', '1997-09-09' , 1000000, 'femenino'),
    (103, 'Brad', '1983-02-02' , 700000, 'masculino'),
    (104, 'Carlos', '1986-03-03' , 250000, 'masculino'),
    (105, 'Santiago', '1970-04-04' , 4000000, 'masculino'),
    (106, 'Penelope', '1976-05-05' , 23000, 'femenino'),
    (107, 'Noa', '1981-06-06' , 770000, 'otros'),
    (108, 'Jon', '1996-07-07' , 6000, 'otros');
    
INSERT INTO Peliculas (nombre, duracion, director, genero, nota, id_peli, actor) VALUES
	('Bright', 120, 'Fernando', 'acción', 3.1, 1, 101),
    ('Frida', 100, 'Daniel', 'drama', 7.6, 2, 101),
    ('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 102),
    ('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 107),
    ('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 104),
    ('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 103),
    ('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
    ('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 101);
    
/*Ejercicio 3 - Elimina los siguientes registros de la base de datos Netflix */
/*- Elimina al actor que haya rodado la película con menor puntuación de la tabla Peliculas, siempre y cuando no sea de género Femenino*/

/*Ejercicio 4 - Realiza las siguientes consultas SQL sobre la base de datos Netflix */