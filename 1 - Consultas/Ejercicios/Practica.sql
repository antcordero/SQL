CREATE DATABASE IF NOT EXISTS NetflixPractica;
USE NetflixPractica;


CREATE TABLE IF NOT EXISTS Peliculas(
	id_peli int,
    nombre_peli VARCHAR(30),
    duracion INT,
    director_peli VARCHAR(20),
    género_peli ENUM ('acción', 'drama', 'comedia'),
    nota_peli FLOAT,
    actor INT,
    primary key (id_peli)
);


CREATE TABLE IF NOT EXISTS Actores(
	id_actor INT,
    nombre VARCHAR(30),
    fecha_nac DATE,
    sueldo INT,
    sexo ENUM ('femenino', 'masculino', 'otros'),
    primary key (id_actor)
);

INSERT INTO Actores(id_actor, nombre, fecha_nac, sueldo, sexo) VALUES
(101, 'Leonardo', '1980-12-01' , 3000000, 'masculino'),
(102, 'Julia', '1997-09-09' , 1000000, 'femenino'),
(103, 'Brad', '1983-02-02' , 700000, 'masculino'),
(104, 'Carlos', '1986-03-03' , 250000, 'masculino'),
(105, 'Santiago', '1970-04-04' , 4000000, 'masculino'),
(106, 'Penelope', '1976-05-05' , 23000, 'femenino'),
(107, 'Noa', '1981-06-06' , 770000, 'otros'),
(108, 'Jon', '1996-07-07' , 6000, 'otros');

INSERT INTO Peliculas (nombre_peli, duracion, director_peli, género_peli, nota_peli, id_peli, actor) VALUES
('Bright', 120, 'Fernando', 'acción', 3.1, 1, 101),
('Frida', 100, 'Daniel', 'drama', 7.6, 2, 101),
('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 102),
('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 107),
('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 104),
('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 103),
('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 101);

/*1. Obten el nombre y la fecha de nacimiento de los actores con un sueldo menor que 1.000.000 y que su nombre
contenga la letra "e" o una letra "n" o tenga menos de 4 caracteres.
Ordena el resultado por la fecha de nacimiento de los actores, de mayor a menor.*/

select a.nombre, a.fecha_nac
from actores as a
where (a.sueldo < 1000000) and (a.nombre like "%e%" or a.nombre like "%n%" or char_length(a.nombre) < 4)
order by a.fecha_nac asc;

/*2. Obten el nombre del actor que mas peliculas haya rodado junto con el numero de peliculas que haya rodado y 
que su sexo sea distinto a "Masculino". Muestra el resultado en dos columnas de nombre ACTOR y PELIS*/

select a.nombre as "ACTOR", count(p.id_peli) as "PELIS"
from actores as a inner join peliculas as p on a.id_actor=p.actor
where a.sexo not like "masculino"
group by a.nombre
order by "PELIS" desc 
limit 1;

/*3. Obten los nombres y sueldos de los actores que cobren mas del doble del sueldo "Noa".
Muestra los resultados en columnas llamadas NOM_ACTOR y SUELDO_ACTOR, ordenados por el sueldo de mayor a menor.*/

select a.nombre as "NOM_ACTOR", a.sueldo as "SUELDO_ACTOR"
from actores as a
where a.sueldo > (2*(select a.sueldo
					 from actores as a
					 where a.nombre like "Noa"))
order by "SUELDO_ACTOR" desc;

/*4. Obten el nombre de los actores nacidos en un mismo dia y mes, y hayan trabajado en una pelicula dirigida por 
"jon", "Adrian", "Nuria" o "Ivan". Muestra el resultado en una columna ACT ordenados por orden alfabetico.*/

select a.nombre as "ACTORES"
from actores as a inner join peliculas as p on a.id_actor=p.actor
where p.director_peli in ("jon", "Adrian", "Nuria", "Ivan") and (month(a.fecha_nac) = day(a.fecha_nac))
order by a.nombre asc;

/*5. Obten todos los datos de las peliculas que contengan mas de una letra "o" en su nombre, su duracion sea menor
que la duracion de "Animales nocturnos" y su puntuacion sea mayor que la peliculas del actor "Carlos".
Ordena los resultados por la nota de la pelicula, de mayor a menor.*/

select *
from peliculas as p inner join actores as a on p.actor=a.id_actor
where p.nombre_peli like "%o%o%" and p.duracion < (select p.duracion
												   from peliculas as p
                                                   where p.nombre_peli like "Animales nocturnos"
                                                   )
                                 and p.nota_peli > (select p.nota_peli
													from peliculas as p inner join actores as a on p.actor=a.id_actor
                                                    where a.nombre like "Carlos"
                                                    )
order by p.nota_peli desc;
