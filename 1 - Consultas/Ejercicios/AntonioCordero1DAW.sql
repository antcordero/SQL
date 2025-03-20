CREATE DATABASE IF NOT EXISTS NetflixExamen;
USE NetflixExamen;

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

INSERT INTO Peliculas (nombre, duracion, director, genero, nota, id_peli, actor) VALUES
	('Bright', 120, 'Fernando', 'acción', 3.1, 1, 101),
	('Frida', 100, 'Daniel', 'drama', 7.6, 2, 101),
	('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 102),
	('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 107),
	('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 104),
	('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 103),
	('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
	('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 101);
    
    
    
/*1*/

select a.nombre
from actores as a 
where a.fecha_nac > (select a.fecha_nac
					 from actores as a inner join peliculas as p on a.id_actor=p.actor
                     where p.nombre like "Bright"
					 )
                     
	 and
     
     a.fecha_nac < (select a.fecha_nac
					from actores as a inner join peliculas as p on a.id_actor=p.actor
                    where p.nota = (select p.nota
									from peliculas as p
                                    order by p.nota desc
                                    limit 2,1)
						 and a.sexo like "femenino"
					)
order by a.fecha_nac asc;

/*2*/

select a.id_actor, avg(p.nota) as "Nota Media Películas"
from actores as a inner join peliculas as p on a.id_actor=p.actor
where (a.sueldo > 100000) or ( (day(a.fecha_nac) between "01" and "15") and (month(a.fecha_nac) in (1,2,3,4,5,6)) )
group by a.id_actor
order by a.sueldo desc; 

/*3*/

select a.id_actor
from actores as a inner join peliculas as p on a.id_actor=p.actor
where (a.nombre like "%a%a%" or a.nombre like "%e%e%") and p.nota > (select 3*p.nota
																	 from peliculas as p
                                                                     order by p.nota asc
                                                                     limit 1 offset 1
																	 );

/*4*/

select p.nombre, p.director
from peliculas as p
where (p.nombre like "%s") and p.duracion >= (select p.duracion
											  from peliculas as p inner join actores as a on p.actor=a.id_actor
                                              where a.sexo like "femenino" and month(a.fecha_nac) = 9
											  )
order by char_length(p.nombre) desc;

/*5*/

select p.nombre, p.duracion*60 as "TIEMPO"
from peliculas as p inner join actores as a on p.actor=a.id_actor
where p.genero not in ("comedia","drama") and a.sueldo > (select avg(a.sueldo)
														  from actores as a
                                                          where a.sexo like "otros"
														  )
order by p.duracion desc, p.nombre asc; 
    
    

