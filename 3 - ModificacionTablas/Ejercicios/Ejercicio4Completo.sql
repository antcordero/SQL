create database LA_LIGA;
use LA_LIGA;

create table EQUIPO(
		ID int not null,
		Nombre varchar(12), 
		Edad_media decimal(2,0),
    		Color enum ('Unicolor','Multicolor'), 
		primary key(ID)
	);
    
create table JUGADOR(
		DNI varchar(9) not null,
		Nombre varchar(12), 
		Altura decimal(3,2),
        		Fecha_nac DATE,
        		Hora_nac TIME,
		primary key(DNI)
     ); 

/*Ejercicio 1.- Añade una nueva columna “Equipo” en la tabla JUGADOR*/

alter table jugador
add column equipo varchar(20);

select * from jugador;

/*Ejercicio 2.- Haz que la columna Equipo sea FK referenciando al ID de la tabla equipo.*/

alter table jugador
modify equipo int;

alter table jugador
add constraint fk_equipo foreign key(equipo) references equipo(id);

/*Ejercicio 3.- Añade 5 filas de contenido a cada una de las tablas creadas.*/
insert into EQUIPO VALUES 
('1', 'BARCELONA', '24', 'Unicolor'),
('2', 'Madrid', '27', 'Multicolor'),
('3', 'Real socie', '24', 'Multicolor'),
('4', 'Betis', '25', 'Multicolor'),
('5', 'Mallorca', '26', 'Unicolor'),
('6', 'Villareal', '27', 'Unicolor'),
('7', 'At Madrid', '28', 'Multicolor'),
('8', 'Celta', '30', 'Unicolor');
    
insert into JUGADOR VALUES
(101, 'MESSI', 1.42, '2000-12-12', '12:00:00', '1'),
('102', 'CRISTIANO', '1.32', '2001-01-01', '12:00:00', '1'),
('103', 'NEYMAR', '2.32', '2010-10-10', '12:00:00', '3'),
('104', 'BARRIOS', '1.80', '2007-10-10', '12:10:00', '7'),
('105', 'ASPAS', '1.90', '1998-10-10', '10:00:00', '8'),
('106', 'JOAQUIN', '1.75', '1980-10-10', '12:00:00', '4'),
('107', 'YAMAL', '1.52', '2012-10-10', '12:00:00', '6'),
('108', 'SANCET', '2.32', '2010-10-10', '12:00:00', '2');

/*Ejercicio 4.- Añade una nueva columna (no nula) “Numero” de 
tipo numérico en la tabla JUGADOR que por defecto contenga el valor 1.*/

alter table jugador
add column Numero int not null default 1;

select * from jugador;

/*Ejercicio 5.- Modifica la tabla JUGADOR para que el contenido 
del jugador con nombre Messi tenga el número 10.*/

update jugador
set numero = 10
where nombre like "Messi";

select * from jugador;

/*Ejercicio 6.- Elimina las filas de la tabla EQUIPO con edad media superior a 26.*/

delete
from equipo
where edad_media>26;

select * from equipo;

/*Ejercicio 7.- Elimina la columna Hora_nac de la tabla JUGADOR.*/

alter table jugador
drop column hora_nac;

select * from jugador;

/*Ejercicio 8.- Elimina una fila de contenido de la tabla JUGADOR de nombre Messi.*/

delete
from jugador
where nombre like "Messi";

select * from jugador;

/*Ejercicio 9.- Elimina la tabla JUGADOR.*/

drop table jugador;

/*Ejercicio 10.- Elimina la base de datos LA_LIGA.*/

drop database la_liga;
