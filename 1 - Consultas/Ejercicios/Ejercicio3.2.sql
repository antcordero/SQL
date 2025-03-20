CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;

CREATE TABLE IF NOT EXISTS Peliculas(
	ID int primary key,
    Nombre VARCHAR(30),
    Duracion INT,
    Director VARCHAR(20),
    Genero ENUM ('acción', 'drama', 'comedia'),
    Nota FLOAT
);

CREATE TABLE IF NOT EXISTS Reparto(
	DNI VARCHAR(9) primary key,
    Nombre VARCHAR(30),
    Apellido VARCHAR(30),
    Fecha_nac DATE
);

ALTER TABLE Peliculas ADD COLUMN Protagonista VARCHAR(9), 
ADD CONSTRAINT `FK_PROTAGONISTA` 
FOREIGN KEY (Protagonista) 
REFERENCES Reparto(DNI);

INSERT INTO Reparto (DNI, Nombre, Apellido, Fecha_nac) VALUES
("1234", "Will", "Smith", "1985-12-13"),
("1357", "Salma", "Hayek", "1976-02-11"),
("1222", "George", "Clooney", "2000-02-23"),
("1265", "Adam", "Sandler", "1980-12-13"),
("1212", "Nemo", " ", "1985-01-07");


INSERT INTO Peliculas (ID, Nombre, Duracion, Director, Genero, Nota, Protagonista) VALUES
(1, 'Bright', 120, 'Fernando', 'acción', 3.1, "1234"),
(2, 'Frida', 100, 'Daniel', 'drama', 7.6, "1357"),
(3, 'Los dos papas', 160, 'Adrián', 'comedia', 8.3, "1222"),
(4, 'Animales nocturnos', 185, 'Tomás', 'drama', 9.5, "1357"),
(5, 'Oceans Eleven', 150, 'Nuria', 'acción', 3.5, "1222"),
(6, 'Buscando a Nemo', 120, 'Jon', 'comedia', 2.1, "1212"),
(7, 'El Hoyo', 110, 'Ivan', 'acción', 9.9, "1265"),
(8, 'Diamante en bruto', 140, 'Paola', 'acción', 8.1, "1265");










/*Ejercicio 1.- Muestra el ID de las películas de género "acción", 
siempre y cuando el protagonista no haya nacido el mes de febrero.*/

select p.id
from reparto as r inner join peliculas as p on r.dni=p.Protagonista
where month(r.fecha_nac)<>02 and p.genero like "acción";

/*Ejercicio 2.- Muestra el nombre y apellido de los actores junto al número de 
películas en las que sean protagonistas. Ordena los resultados por la 
fecha de nacimiento de los actores.*/

select r.nombre, r.apellidos, count(p.id) as num_peliculas
from reparto as r inner join peliculas as p on r.dni=p.Protagonista
group by r.dni
order by r.fecha_nac asc;

/*Ejercicio 3.- Muestra el DNI de los actores que hayan nacido 
entre los años 1980 y 1985 (ambos incluidos) y 
tengan menos de 5 caracteres en su nombre.*/

select r.dni
from reparto as r
where (year(r.fecha_nac) between 1980 and 1985) and char_length(r.nombre)<5;

/*Ejercicio 4.- Muestra los nombres de los actores que tengan 
una letra "m" o dos letras "e" en su nombre, 
siempre y cuando no haya participado en una película rodada por Nuria, Tomás o Adrián. 
Haz que en el resultado no se muestren datos repetidos.*/

select r.nombre
from reparto as r inner join peliculas as p on r.dni=p.Protagonista
where (r.nombre like "%m%" or r.nombre like "%e%e%") 
		and p.director not in ("Nuria", "Tomás","Adrián")
group by r.nombre;

/*Ejercicio 5.- Muestra las películas que tengan un nombre compuesto, 
y junto a la fecha de nacimiento de sus protagonistas. 
Ordena los resultados por el número de caracteres del 
nombre de las películas (de menor a mayor). */

select p.nombre, r.Fecha_nac
from reparto as r inner join peliculas as p on r.dni=p.Protagonista
where p.nombre like "% %"
order by char_length(p.nombre) desc;

/*Ejercicio 6.- Muestra todos los géneros de las películas junto a la
 media de duración de cada uno de ellos, siempre y cuando el género 
 sea igual a Drama, Comedia o Acción.*/
 
select p.genero, avg(p.duracion)
from peliculas as p 
where p.genero in ("drama", "comedia", "acción")
group by p.Genero;

/*Ejercicio 7.- Muestra el nombre del diretor junto al nombre del protagonista 
de su película, en dos columnas llamadas DIRECTOR y PROTAGONISTA, 
siempre y cuando el nombre del protagonosta termine por una vocal. 
Ordena el resultado por la nota de las películas de cada director (de menor a mayor).*/

select p.director as "DIRECTOR", r.nombre as "PROTAGONISTA"
from reparto as r inner join peliculas as p on r.dni=p.Protagonista
where r.nombre like "%a" or r.nombre like "%e" or r.nombre like "%i" or r.nombre like "%o" or r.nombre like "%u"
order by p.Nota asc;

/*Ejercicio 8.- Muestra nombre de las películas junto con su duración en segundos, 
				y junto con su nota sobre 100 (en vez de sobre 10).*/

select p.nombre, p.nota*10, p.duracion*60
from peliculas p;

/*Ejercicio 9.- Muestra el número total de peliculas en la tabla Películas, 
junto con el número total de Actores en la tabla Reparto. 
Muestra los resultados en dos tablas llamadas NUM_PROTAGONISTAS y NUM_PELICULAS.*/

select count(p.id) as NUM_PELICULAS, count(distinct r.dni) as NUM_PROTAGONISTAS		
from reparto as r inner join peliculas as p on r.dni=p.Protagonista;

/*Ejercicio 10.- Muestra el nombre y apellido de los actores junto a la nota con 
menor puntuación que hayan rodado. El nombre de la película debe tener 
menos caractéres que la nota de la propia película.*/

select r.nombre, r.apellido, p.nota
from reparto r inner join peliculas p on r.dni=p.protagonista
where char_length(p.nombre)<p.nota
order by p.nota asc;
