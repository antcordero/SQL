/*Antonio Cordero Molina 1ºDAW*/

/*1*/

create database tienda;
use tienda;

/*2*/

create table clientes (
	id int primary key auto_increment,
    nombre varchar(25) constraint chk_nombre check ((nombre not like "%a%" and 
													 nombre not like "%e%" and 
                                                     nombre not like "%i%" and 
                                                     nombre not like "%o%" and 
                                                     nombre not like "%u%") 
												and (nombre not like "%s%s%s" or nombre not like "%ss%s%" or nombre not like "%s%ss%") 
                                                and (char_length(nombre)>=10)),
    apellido varchar(15) constraint chk_ape check ( (char_length(apellido)>5) and (apellido not like "%s" and apellido not like "%a") and (apellido not in ("zamora","torres","sánchez")) ),
    altura decimal(4,3) constraint chk_altura check(altura >= 1 and altura < 2.5) not null,
    orientacion enum ("heterosexual", "homosexual", "otro") default "otro" not null
) auto_increment = 500;


/*3*/

create table animales (
	id int primary key auto_increment,
    fecha date constraint chk_fecha check( (month(fecha) in ("2","4","6","8","10","12")) and (month(fecha)>(year(fecha)/100)) ),
    raza enum ("pastor","chihuahua","bulldog") default "pastor"
) auto_increment = 1;

/*4*/

/*columna nueva en tabla animales*/
alter table animales add column cliente1 int not null;
alter table animales add column cliente2 int not null;

/*fk*/
alter table animales add constraint fk_cliente1
foreign key (cliente1) references clientes(id);

/*fk*/
alter table animales add constraint fk_cliente2
foreign key (cliente2) references clientes(id);


/*5*/
/*inserción de datos insdispensables*/
insert into clientes (altura) values
	(1.55),
    (1.80),
    (1.30);

insert into animales (cliente1, cliente2) values
	(501, 502),
    (502, 500),
    (500, 501);

select * from clientes;
select * from animales;
