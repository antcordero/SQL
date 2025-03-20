/*Ejercicio 1.- Crea una BD de nombre LIGA_EA.*/

create database liga_EA;
use liga_EA;

/*Ejercicio 2.- Crea una tabla JUGADOR en la BD LIGA_EA con los siguientes contenidos.
• DNI: contenido de tipo caracteres
		▪ El valor DNI deberá tener exactamente 9 caracteres
• Nombre: contenido de tipo caracteres (máximo 20 caracteres)
		▪ El campo Nombre deberá tener 10 caracteres mínimo
• Apellido: contenido de tipo caracteres (máximo 20 caracteres)
• Altura: contenido de tipo decimal (máximo 2 decimales)
		▪ El campo Altura deberá estar entre 1.50 y 2.10
• Posición: contenido con 4 valores posibles (Portero, Defensa, Medio o Delantero)
		▪ El campo Posición, por defecto, será NO DEFINIDO
• Fecha_nacimiento: contenido de tipo fecha 
		▪ El campo Fecha_nacimiento deberá estar entre marzo y octubre (ambos incluidos)
• Email: contenido de tipo caracteres (máximo 30 caracteres)
		▪ El campo Email deberá contener el carácter @
• Dirección: contenido de tipo caracteres (máximo 100 caracteres)
		▪ El campo Dirección deberá contener la palabra “Calle o Avenida”
• Clave: contenido de tipo caracteres (máximo 15 caracteres)
		▪ El campo Clave deberá tener 8 caracteres mínimo*/

create table jugador (
	dni varchar(9) primary key constraint chk_dni check(char_length(dni)=9),
    nombre varchar(20) constraint chk_nombre check (char_length(nombre)>=10),
    apellido varchar(20),
    altura decimal(3,2) constraint chk_altura check(altura between 1.50 and 2.10),
    posicion enum ("portero","defensa","medio","delantero","No_Definido") default 'No_Definido',
    fecha_nacimiento date constraint chk_fecha check(month(fecha_nacimiento) between 3 and 10),
    email varchar(30) constraint chk_email check(email like "%@%"),
    direccion varchar(100) constraint chk_dir check (direccion like "Calle%" or direccion like "Avenida%"),
    clave varchar(15) constraint chk_clave check(char_length(clave)>=8)
);

/*Ejercicio 3.- Inserta valores en la tabla JUGADOR para comprobar que 
todas las restricciones se han creado de forma correcta.*/

insert into jugador(dni, nombre, apellido, altura, posicion, fecha_nacimiento, email, direccion, clave) values
	("12345678A", "abcdefgheijs", "Ronaldo", 1.90, "delantero", "2000-10-10", "cr7@gmail.com", "Calle El Bicho", "12345678CR7");

select * from jugador

