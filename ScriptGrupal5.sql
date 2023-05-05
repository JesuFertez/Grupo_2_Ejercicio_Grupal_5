-- Parte 1 // Creación de Database "telovendoleyend" 
create database telovendoleyend;

-- Parte 2 // Creaciones de las tablas
create table Usuarios(
id_usuario int auto_increment,
nombre varchar(15),
apellido varchar(20),
contraseña varchar (20),
zona_horaria timestamp default current_timestamp,
genero Enum ('F','M','N/B', 'N/E')default 'N/E',
telefono int,
primary key (id_usuario)
);

create table Ingreso_plataforma(
id_ingreso int auto_increment,
id_usuario int,
fecha_hora_ingreso timestamp default current_timestamp,
primary key (id_ingreso),
foreign key (id_usuario) references Usuarios (id_usuario)
);

-- Parte 3 // 
set time_zone ='-2:00';

-- Parte 4 // Creación de Registros
 Insert into Usuarios (nombre, apellido,contraseña,genero,telefono)
 values ('Pamela','Cerda','12345','F',983645628),
 ('Ariel','Montecino','678duyd9','N/B',836753728),
 ('Felipe','Alvarado','73isdh62','M',984635272),
 ('Ana','López','847iss7','F',948675454),
 ('Jesús','Nuñez','20jjj02','N/B',908765578),
 ('Camila','Rueda','773525','F',900084663),
 ('Pedro','Pinto','02883Mj','M',663456389),
 ('Estaban','Quito','HGj7364','N/B',987763567);
 
 Insert into Ingreso_plataforma (id_usuario)
 select id_usuario from Usuarios;
 
-- Parte 5 // Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

-- Para la tabla Usuario lo más optimo era usar el rut como id, pero seguiumos las instrucciones de la solicitud
-- de igual forma toma el tipo INT.
-- Para las zonas horarias el tipo de dato TIMESTAMP es el que permite hacer modificaciones en la 
-- zona horaria, por lo que sí, es el óptimo para el caso.
-- Para teléfonos el apropiado es de tipo INT ya que almacenamos sólo datos númericos.
-- Para el campo género se escogio el tipo ENUM y se asignaron las opciones correspondientes, por lo que sí,
-- a nuestro criterio fue lo óptimo.

-- Parte 6 //Creen una nueva tabla llamada Contactos 
-- (id_contacto, id_usuario, numero de telefono, correo electronico).

create table Contactos(
id_contacto int auto_increment,
id_usuario int,
telefono int,
correo varchar (40),
primary key (id_contacto)
);

-- Parte 6 // Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

-- añadimos la lláve fóranea para vincular las tablas, se uso el campo id_usuario
alter table Contactos add foreign key (id_usuario) references Usuarios (id_usuario);

-- Rellenamos los campos id y télefono con los datos de la tabla usuario.
Insert into Contactos (id_usuario, telefono)
select id_usuario, telefono from Usuarios;

# El ejercicio debe ser subido a github y al Nodo Virtual.

# https://github.com/JesuFertez/Grupo_2_Ejercicio_Grupal_5.git

# Integrantes 
-- Marcos Barcia
-- Claudio Azocar
-- María Fernández
-- Nataly Vera


