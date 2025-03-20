CREATE DATABASE IF NOT EXISTS NetflixModEj1;
USE NetflixModEj1;

CREATE TABLE IF NOT EXISTS Peliculas(
id_peli int,
nombre VARCHAR(30),
duracion INT,
director VARCHAR(20),
genero ENUM ('acción', 'drama', 'comedia'),
nota FLOAT,
actor INT,
primary key (id_peli)
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


/*Ejercicio 1.- Elimina todas las películas que sean de género "drama" y tengan una nota de 9.5.*/

select * from Peliculas;

start transaction;

delete 
from peliculas
where genero like "drama" and nota = 9.5;

select * from Peliculas;
rollback;

/*Ejercicio 2.- Elimina todos los actores que hayan nacido en uno de 
los primeros 3 meses del año, y no sean de género "masculino".*/

select * from actores;

start transaction;

delete
from actores
where month(fecha_nac) in ("01","02","03") and genero not like "masculino";

select * from actores;
rollback;

/*Ejercicio 3.- Elimina todas las películas en las que el director 
tenga alguna tilde en su nombre.*/

select * from peliculas;

start transaction;

delete
from peliculas
where char_length(director) <> length(director);

select * from peliculas;
rollback;

/*Ejercicio 4.- Elimina todas las películas que hayan 
sido rodadas por un actor de genero "otros".*/

select * from peliculas;
select * from actores;

start transaction;

delete
from peliculas
where actor in (select id_actor
					from actores
                    where genero like "otros");

select * from peliculas;
rollback;

/*Ejercicio 5.- Elimina todas las películas rodadas por un director 
con un nombre igual al de un actor de género distinto a "femenino". */

select * from peliculas;
select * from actores;

start transaction;

delete
from peliculas
where director in (select nombre
				   from actores
				   where genero not like "femenino");

select * from peliculas;
rollback;

/*Ejercicio 6.- Elimina al actor que haya rodado la película con 
mayor puntuación de la tabla Peliculas.*/

select * from actores;

start transaction;

delete
from actores
where id_actor = (select actor
				  from peliculas
                  where nota = (select max(nota)
								from peliculas)
				 );

select * from actores;
rollback;

/*Ejercicio 7.- Elimina todos los actores que hayan rodado una película dirigida por "Paola" 
y hayan rodado otra película dirigida por "Fernando".*/

select * from actores;
select * from peliculas;

start transaction;

delete
from actores
where id_actor in (select actor from peliculas where director like "Paola") 
	  and 
	  id_actor in (select actor from peliculas where director like "Fernando");

select * from actores;
rollback;

/*Ejercicio 8.- Elimina todas las películas con un protagonista nacido antes que 
el quinto actor más joven de la tabla Actores.*/

select * from peliculas;
select * from actores;

start transaction;

delete 
from peliculas
where actor in (select id_actor
			    from actores
			    where fecha_nac < (select fecha_nac
								   from actores
                                   order by fecha_nac desc
                                   limit 4,1));

select * from peliculas;
rollback;

/*Ejercicio 9.- Elimina todas las películas con más de 10 caracteres en su nombre, 
que el nombre de la película se componga de más de una palabra, 
y no hayan sido rodadas por un actor con mayor sueldo que la media de los sueldos de todos los actores.*/

select * from peliculas;

start transaction;

delete
from peliculas
where char_length(nombre)>10 
	  and 
	  nombre like "% %" 
      and 
      actor in (select id_actor
			    from actores
			    where sueldo > (select avg(sueldo)
							    from actores));

select * from peliculas;
rollback;

/*Ejercicio 10.- Elimina todos los actores con mas de dos letra "e" y menos de  dos letras "a" en su nombre, 
y hayan rodado una pelicula con mayor duración que la película rodada por el actor con id 107.*/

select * from actores;

start transaction;

delete
from actores
where nombre like "%e%e%e%" 
and
	  nombre not like "%a%a%"
and
	  id_actor in (select actor from peliculas where duracion > (select duracion
																 from peliculas
                                                                 where actor = 107));

select * from peliculas;
rollback;

