CREATE DATABASE IF NOT EXISTS NetflixProgFunciones;
USE NetflixProgFunciones;

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


/*Ejercicio 1.- Crea una función en MySQL que se encargue 
de mostrar información de la tabla películas.
	- Número de películas que contiene la BD
	- Número de actores que contiene la BD
	- Año de la fecha de nacimiento del actor con mayor edad
	- Año de la fecha de nacimiento del actor con menor edad
*/

delimiter //
create function funcionEj1() returns varchar(255) no sql
begin

declare numPeliculas int;
declare numActores int;
declare anhoActorMayor int;
declare anhoActorMenor int;
declare resultado varchar(255);

set numPeliculas = (select count(*) from peliculas);
set numActores = (select count(*) from reparto);
set anhoActorMayor = (select year(fecha_nac) from reparto order by 1 asc limit 1);
set anhoActorMenor = (select year(fecha_nac) from reparto order by 1 desc limit 1);

set resultado = concat("Nº Películas: ",numPeliculas," - Nº Actores: ",numActores," - Año Actor mayor: ",anhoActorMayor," - Año Actor menor: ", anhoActorMenor);

return resultado;
end//

select funcionEj1();

/*Ejercicio 2.- Crea una función en MySQL que a partir de 
dos nombres de actores insertados por el usuario, devuelva los datos 
del actor que haya rodado más películas de los dos.*/

delimiter //
create function funcionEj2(nombre1 varchar(25), nombre2 varchar(25)) returns varchar(255) no sql
begin
declare resultado varchar(255);
declare Peliculas1 int;
declare Peliculas2 int;

set Peliculas1 = (select count(*) 
				  from peliculas as p inner join reparto as r on (p.protagonista=r.dni)
                  where p.protagonista = (select dni
										  from reparto
                                          where nombre = nombre1));

set Peliculas2 = (select count(*) 
				  from peliculas as p join reparto as r on (p.protagonista=r.dni)
                  where p.protagonista = (select dni
										  from reparto
                                          where nombre = nombre2));

if nombre1 not in (select nombre from reparto) then
	set resultado = "No se encuentra el nombre del primer actor introducido";
elseif nombre2 not in (select nombre from reparto) then
	set resultado = "No se encuentra el nombre del segundo actor introducido";
elseif Peliculas1 > Peliculas2 then
	set resultado = concat(nombre1," ",(select apellido from reparto where nombre = nombre1), " ha rodado ", Peliculas1, " en total");
elseif Peliculas1 < Peliculas2 then
	set resultado = concat(nombre2," ",(select apellido from reparto where nombre = nombre2), " ha rodado ", Peliculas2, " en total");
elseif Peliculas1 = Peliculas2 then
	set resultado = concat("Ambos actores han rodado ", Peliculas1," en total");
end if;

return resultado;
end//

select funcionEj2("Will", "Adam") as "Peliculas Rodadas";

/*Ejercicio 3.- Crea una función en MySQL que a partir de un 
número X dado por el usuario, la función mostrará el nombre de la película número X 
con mayor puntuación de la tabla.*/

delimiter //
create function funcionEj3(num1 int) returns varchar(255) no sql
begin
declare resultado varchar(255);
declare titulo varchar(255);

set titulo = (select nombre
			  from peliculas
              order by nota desc
              limit num1,1);

set resultado = concat("Película: ", titulo);

return resultado;
end//

select funcionEj3(5) as "Pelicula Seleccionada";

/*Ejercicio 4.- Crea una función que dados dos números por el usuario, 
la función muestre el número de películas con una nota dentro de dicho rango, 
y las películas con una nota fuera de dicho rango.*/

