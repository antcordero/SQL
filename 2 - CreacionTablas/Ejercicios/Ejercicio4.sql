/*Ejercicio 1.- Crea una BD de nombre POKEMON_GO.*/

create database pokemon_go;
use pokemon_go;

/*Ejercicio 2.- Crea una tabla POKEMON en la base de datos POKEMON_GO.*/
/*Ejercicio 3.- Añade las siguientes columnas en la tabla POKEMON.
    • Id: identificador de tipo numérico (PK)
            ▪ El campo ID deberá ser un valor que incremente de forma automática y comience por el número 100
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
            ▪ El campo Nombre no podrá estar formado por 2 o más palabras compuestas
    • Altura: contenido de tipo decimal (2 decimales)
            ▪ El campo Altura deberá estar entre 0.50 y 3.50 (ambos no incluidos)
    • Edad: contenido de tipo numérico
            ▪ El campo Altura deberá estar entre 1 y 100 (ambos incluidos)
    • Fecha_nac: contenido de tipo fecha
      *Todos los campos podrán contener valores NULL, a excepción del ID y la fecha de nacimiento del Pokemon*/

create table pokemon (
	id int primary key auto_increment,
    nombre varchar(15) constraint chk_nombre check (nombre not like "% %"),
    altura decimal(3,2) constraint chk_altura check (altura between 0.49 and 3.49),
    edad int constraint chk_edad check(edad between 1 and 100),
    fecha_nac date not null
) auto_increment = 100;

/*Ejercicio 4.- Crea una tabla ENTRENADOR en la base de datos POKEMON_GO.
Ejercicio 5.- Añade las siguientes columnas en la tabla ENTRENADOR.
    • DNI: identificador de tipo caracteres (PK)
            ▪ El campo DNI deberá contener una letra (mínimo)
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
            ▪ El campo Nombre, por defecto, tendrá valor NULL
    • Apellido: contenido de tipo caracteres (máximo 20 caracteres)
            ▪ El campo Apellido, deberá contener más de una letra “a”
    • Género: contenido con 3 valores posibles (masculino, femenino u otro)
    • Pokemon: contenido de tipo numérico
*Todos los campos podrán contener valores NULL, a excepción del DNI y Género*/

create table entrenador (
	dni int primary key constraint chk_dni check(dni regexp ".*[A-Z].*"),
    nombre varchar(15) null,
    apellido varchar(20) constraint chk_apellido check(apellido like "%a%a%"),
    genero enum ("masculino", "femenino", "otro") not null,
    id_pokemon int
);

/*Ejercicio 6.- Haz que la columna Pokemon de la tabla ENTRENADOR 
sea clave foranea de la tabla POKEMON.*/

alter table entrenador add constraint fk_pokemon
foreign key (id_pokemon) references pokemon(id);

/*Ejercicios 7.- Inserta 5 filas de datos en cada una de las tablas y 
comprueba que los datos se han insertado correctamente.*/

insert into pokemon(nombre, altura, edad, fecha_nac) values
	("Pikachu", 1.00, 4, "2020-01-20"),
    ("Eevee", 0.80, 6, "2018-01-20"),
    ("Cindaquill", 1.25, 3, "2021-01-20"),
    ("Dragonair", 2.30, 7, "2017-01-20"),
    ("Blastoise", 3.10, 10, "2014-01-20");

insert into entrenador(dni, nombre, apellido, genero, id_pokemon) values
	("123456789A", "Toni", "aa", "masculino", 100),
    ("123456789B", "Toni", "aaa", "otro", 101),
    ("123456789C", "Toni", "aaaa", "femenino", 102),
    ("123456789D", "Toni", "aaaaa", "otro", 103),
    ("123456789E", "Toni", "aaaaaa", "masculino", 104);

/*meter solo los datos necesarios*/
insert into pokemon (fecha_nac) values ("2024-01-20");
insert into entrenador (dni, genero) values ("123456789F", "otro");

select * from pokemon;
select * from entrenador;