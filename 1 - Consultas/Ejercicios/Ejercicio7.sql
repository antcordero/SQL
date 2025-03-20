CREATE DATABASE IF NOT EXISTS NetflixEj7;
USE NetflixEj7;

CREATE TABLE IF NOT EXISTS Peliculas(
	id int,
    	nombre VARCHAR(30),
    	duracion INT,
   	director VARCHAR(20),
    	genero ENUM ('acción', 'drama', 'comedia'),
    	nota FLOAT,
	protagonista int,
    	primary key (id)
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
(101, 'Leonardo', '1980/12/01' , 3000000, 'masculino'),
(102, 'Julia', '1997/09/09' , 1000000, 'femenino'),
(103, 'Brad', '1983/02/02' , 700000, 'masculino'),
(104, 'Carlos', '1986/03/03' , 250000, 'masculino'),
(105, 'Santiago', '1970/04/04' , 4000000, 'masculino'),
(106, 'Penelope', '1976/05/05' , 23000, 'femenino'),
(107, 'Noa', '1981/06/06' , 770000, 'otros'),
(108, 'Jon', '1996/07/07' , 6000, 'otros');

INSERT INTO Peliculas (nombre, duracion, director, genero, nota, id, protagonista) VALUES
('Bright', 120, 'Fernando', 'acción', 3.1, 1, 103),
('Frida', 100, 'Daniel', 'drama', 7.6, 2, 107),
('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 103),
('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 101),
('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 102),
('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 102),
('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 108);


/*Ejercicio 1.- Obtén todos los datos de los actores con un sueldo menor 
que el sueldo de Penelope, y que hayan rodado una película de acción.*/

select a.*
from actores as a inner join peliculas as p on a.id_actor=p.protagonista
where a.sueldo < (select a.sueldo
				  from actores as a 
                  where a.nombre like "Penelope") and p.genero like "acción";

/*Ejercicio 2.- Obtén el id y nombre del actor que haya rodado una película 
del mismo género que la película rodada por Jon, 
y en la columna sexo tenga el valor Femenino.*/

select distinct a.id_actor, a.nombre
from actores as a inner join peliculas as p on a.id_actor=p.protagonista
where p.genero like (select p.genero
					 from peliculas as p 
                     where p.director like "Jon") and a.genero like "femenino";

/*Ejercicio 3.- Obtén el nombre de los actores que tengan menos caracteres 
que el actor con id 104, ordenador por la fecha de nacimiento de menor a mayor.*/

select a.nombre 
from actores as a 
where char_length(a.nombre) < (select char_length(a.nombre)
								from actores as a
                                where a.id_actor = 104)
order by fecha_nac desc;

/*Ejercicio 4.- Obtén el número total de películas rodadas por cada actor, 
siempre y cuando no hayan nacido en el mes de febrero o marzo. 
Muestra los datos en dos columnas de nombre ACTOR y TOTAL.*/

select a.nombre as "Actor", count(p.id) as "NºTotal"
from actores as a inner join peliculas as p on a.id_actor=p.protagonista
where month(a.fecha_nac) not in ("02","03")
group by 1;

/*Ejercicio 5.- Obtén el nombre de las películas con menor duración que 
la tercera película con mayor duración de la tabla.*/

select p.nombre
from peliculas as p
where p.duracion < (select min(p.duracion)
					from (select p.duracion
						  from peliculas as p
                          order by p.duracion desc
                          limit 3) 
					 as p
                     );
/*Corrección*/
select p.nombre
from peliculas as p
where p.duracion < (select p.duracion
				    from peliculas as p
				    order by p.duracion desc
				    limit 2,1);

/*Ejercicio 6.- Obtén el nombre de las películas que contengan más de 
un letra "a" en su nombre y no hayan sido protagonizadas por el actor 
con sexo masculino y el máximo id.*/

select p.nombre
from peliculas as p 
where p.nombre like "%a%a%" and p.protagonista not like (select a.id_actor
														 from actores as a
														 where a.genero like "masculino" 
														 order by a.id_actor desc
														 limit 1
														 );

/*Corrección*/
select p.nombre
from peliculas as p 
where p.nombre like "%a%a%" and p.protagonista not like (select max(a.id_actor)
														 from actores as a
														 where a.genero like "masculino" 
														 );

/*Ejercicio 7.- Obtén los datos del actor con el mismo nombre que 
el director de la película con menor puntuación de la tabla Películas.*/

select a.*
from actores as a
where a.nombre like (select p.director
					 from peliculas as p
                     where p.nota = (select min(p.nota) 
									 from peliculas as p
                                     )
					);

