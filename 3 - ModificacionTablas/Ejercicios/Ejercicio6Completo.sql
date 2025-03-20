/*Ejercicio 1.- Crea las siguientes tablas en la base de datos “Centro_adopción”.

		Perros (ID, nombre, edad, altura, raza, color, fecha_nac)
		Humanos(DNI, nombre, apellido, n_cuenta, edad, sexo)
			
	- El número de cuenta estará formado por 8 números
	- El valor del atributo “color” deberá ser marrón, gris o blanco
	- El valor del atributo “sexo” deberá ser F o M
    
*/

Ejercicio 2.- Añade una clave primaria a cada una de las tablas creadas.

Ejercicio 3.- Añade la clave de la tabla ‘Perros’ en la tabla ‘Humanos’ como clave foránea.

Ejercicio 4.- Añade los siguientes contenidos a las tablas creadas.

Ejercicio 5.- Inserta los siguientes datos en las tablas creadas.

	- Inserta un nuevo perro con los siguientes datos:
- ID: 25
- Nombre: Timmy
- Edad: 3 años
- Altura: 1,85
- Raza: Shar Pei
- Color: Marrón
- Fecha_nac: 12 de octubre de 2016
	- Añade en la tabla “Perros” una nueva columna “Estado” (Adiestrado o salvaje)
	- Inserta valores para que el valor “Estado” no sea nulo

Ejercicio 6.- Realiza las siguientes modificaciones de contenidos en las tablas creadas.

	- Modifica la altura de los perros para que los datos se muestren en centímetros en vez de en metros
	- Modifica la edad de los perros para que los datos se muestren en meses en vez de en años
	- Añade en los nombres de los humanos el prefijo Sr o Sra dependiendo de su sexo
	- Modifica el atributo “sexo” para que aparezca Femenino o Masculino en vez de F o M

* Los datos de la edad se actualizan una sola vez al año
Ejercicio 7.- Realiza las siguientes modificaciones de contenidos en las tablas creadas.

- Modifica la columna Edad de la tabla Humanos para que se llame ‘Años’
- Modifica la columna N_cuenta para que los números de cuenta puedan contener 12 cifras más
- Modifica las claves primarias para que no puedan ser NULL

Ejercicio 8.- Elimina los siguientes contenidos de las tablas creadas

- Elimina los perros que tengan más de 80 meses de edad.
- Elimina los humanos con menos de 30 años
- Elimina la columna Años de la tabla Humanos
- Elimina la clave foránea de la tabla Humanos
- Elimina la tabla Humanos
- Elimina la base de datos “Centro_adopción”
