 create database aerolineaBD;
 use aerolineaBD;
 create table usuarios
 (cedUsu varchar(13) primary key,
 	nomUsu varchar (30) not null,
	edadUsu int not null,
	emailUsu varchar (30) not null,
	celuUsu varchar (14) not null,
	ciudUsu varchar (30) not null,
	viaUsu varchar (20) not null);
	
	
	select * from usuarios;