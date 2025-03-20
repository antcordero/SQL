create database MUNDIAL;
use MUNDIAL;

create table EQUIPO(
	id int primary key,
	nombre varchar(8),
	edad_media int constraint chk_edad check (edad_media not like "%2%2%"),
	color enum("Unico", "Multicolor")
);

create table JUGADOR(
	dni int primary key,
	nombre varchar(15),
	apellido varchar(10),
	altura decimal(3,2),
	fecha_nac date,
	equipo int
);

alter table jugador add constraint fk_equipo foreign key (equipo) references equipo(id);

INSERT INTO EQUIPO (id, nombre, edad_media, color) VALUES
(1, 'EquipoA', 25, 'Unico'),
(2, 'EquipoB', 27, 'Multicolor'),
(3, 'EquipoC', 30, 'Unico'),
(4, 'EquipoD', 28, 'Multicolor'),
(5, 'EquipoE', 26, 'Unico'),
(6, 'EquipoF', 29, 'Multicolor'),
(7, 'EquipoG', 31, 'Unico'),
(8, 'EquipoH', 24, 'Multicolor'),
(9, 'EquipoI', 32, 'Unico'),
(10, 'EquipoJ', 33, 'Multicolor');

INSERT INTO JUGADOR (dni, nombre, apellido, altura, fecha_nac, equipo) VALUES
(101, 'Juan', 'Perez', 1.75, '1995-06-15', 1),
(102, 'Luis', 'Gomez', 1.80, '1993-08-22', 2),
(103, 'Carlos', 'Lopez', 1.85, '1990-12-05', 3),
(104, 'Miguel', 'Diaz', 1.78, '1992-03-10', 1),
(105, 'Jose', 'Martinez', 1.82, '1994-11-25', 2),
(106, 'Ana', 'Sanchez', 1.68, '1996-07-14', 3),
(107, 'Maria', 'Garcia', 1.70, '1991-09-30', 4),
(108, 'Pedro', 'Fernandez', 1.76, '1992-11-11', 5),
(109, 'Laura', 'Rodriguez', 1.65, '1993-01-20', 6),
(110, 'David', 'Hernandez', 1.83, '1994-04-18', 7),
(111, 'Sofia', 'Lopez', 1.72, '1995-05-25', 8),
(112, 'Jorge', 'Martinez', 1.79, '1996-06-30', 9),
(113, 'Lucia', 'Gonzalez', 1.67, '1991-08-15', 10);



/*1*/
alter table jugador
drop foreign key fk_equipo;

alter table jugador
modify dni varchar(9);

alter table jugador
modify fecha_nac varchar(15);

alter table jugador
modify altura decimal(4,3);

insert into jugador (dni, nombre, apellido,altura, fecha_nac, equipo) values
	("44322512Y", "Victor", "Sánchez", 1.185, "28-11-2000", 5);

select * from jugador;


/*2*/

alter table equipo
drop constraint chk_edad;

alter table equipo
rename column edad_media to media;

alter table equipo
modify nombre varchar(20);

alter table equipo
modify color enum("Unico", "Multicolor", "Sin color");

insert into equipo (id, nombre, media, color) values
	(12, "Real Madrid", 22, "Sin color");

select * from equipo;


/*3*/

/*3A*/
update equipo
set media = media + 1
where media;

select * from equipo; 

/*3B*/
alter table jugador
add constraint chk_apellido check(char_length(apellido)>=4);

select * from jugador;

/*3C*/
alter table equipo
add column Ciudad enum("Madrid", "Barcelona", "Málaga") default "Málaga";

select * from equipo;

/*3D*/
alter table jugador
modify apellido varchar(8) constraint chk_apellido check(char_length(apellido)=15 and not null);


/*4*/

/*4A*/
delete 
from jugador
where equipo = (select id
				from equipo
                where media = (select media
							  from equipo
                              order by media asc
                              limit 3,1));

/*4B*/
delete
from equipo
where media between 29 and 33 and (id = (select equipo
										 from jugador
                                         where year(fecha_nac) = (select year(fecha_nac)+1
																		from jugador
                                                                        order by altura asc
                                                                        limit 1)));
select * from equipo;

/*4C*/

delete
from equipo
where char_length(nombre)=7 and id = (select equipo
									  from jugador
                                      where nombre like "V%" or nombre like "%v%" or nombre like "%v"
                                            or apellido like "V%" or apellido like "%v%" or apellido like "%v");

select * from equipo;

/*5*/

/*5A*/
alter table jugador
drop column fecha_nac;

select * from jugador;

/*5B*/
drop table equipo;
drop table jugador;

/*5C*/
drop database mundial;
