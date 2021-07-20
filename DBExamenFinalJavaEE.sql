/*
	Programador: Bonifasi de León, Marcos Daniel
		- PE5AM
        - 2019139
    Fecha de Creación: 06/10/2020.
		- Entidad Roles
        - Entidad Usuarios
*/

Drop database if exists DBExamenFinalJavaEE;
Create database DBExamenFinalJavaEE;
Use DBExamenFinalJavaEE;

Create table Persona(
	codigoPersona int not null auto_increment,
    DPI varchar (15) not null,
    nombrePersona varchar (200) not null,
    Primary key PK_codigoPersona (codigoPersona)
);


Create table Roles(
	codigoRol int not null auto_increment,
    nombre varchar(50) not null,
    primary key PK_codigoRol(codigoRol)
);

Create table Usuarios(
    nombreUsuario varchar(50) not null,
    usuarioPassword varchar(100) not null,
    codigoRol int not null,
    primary key PK_nombreUsuario(nombreUsuario),
    constraint FK_Usuario_Roles
		foreign key(codigoRol) references Roles(codigoRol)
        on delete cascade
        on update cascade
);

-- Ingresando los tipos de usuarios en la entidad Roles en Roles
insert into Roles(nombre) values("administrador");
insert into Roles(nombre) values("comun");

-- Ingresando algunos Usuarios en la entidad Usuarios
insert into Usuarios(nombreUsuario, usuarioPassword, codigoRol) values("admin","admin",1); 
insert into Usuarios(nombreUsuario, usuarioPassword, codigoRol) values("comun","comun",2);

-- Ingresando Personas en la entidad Personas
insert into Persona (DPI, nombrePersona) values (2317483521,"José Aguilar");
insert into Persona (DPI, nombrePersona) values (5649284164,"Noel Aguirre");
insert into Persona (DPI, nombrePersona) values (3749123841,"Marcos Bonifasi");
insert into Persona (DPI, nombrePersona) values (3246723421,"Edgar Buch");
insert into Persona (DPI, nombrePersona) values (8420142314,"Diego Canteo");
insert into Persona (DPI, nombrePersona) values (1464245325,"Sonny Castillo");
insert into Persona (DPI, nombrePersona) values (9756745234,"Emanuel Catalán");
insert into Persona (DPI, nombrePersona) values (7524554135,"Óscar Chinchilla");
insert into Persona (DPI, nombrePersona) values (8465451434,"Kevin Chitiquez");
insert into Persona (DPI, nombrePersona) values (7652432143,"Cristian Colindres");
insert into Persona (DPI, nombrePersona) values (2245234546,"Diego Escobedo");
insert into Persona (DPI, nombrePersona) values (7641456789,"José Espinoza");
