create database DB_Liga;
create table Jugadores(
id_jugador INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20) UNIQUE NOT NULL,
fecha_nac DATE NOT NULL,
id_equipo INT NOT NULL, 
CONSTRAINT fk_id_equipo_Jugadores FOREIGN KEY (id_equipo) REFERENCES Equipos (id_equipo)
);

create table Equipos(
id_equipo INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20) UNIQUE NOT NULL,
estadio VARCHAR(20) NOT NULL,
aforo INT DEFAULT 2000 CONSTRAINT ch_aforo CHECK (aforo > 100),
año_fundacion INT CONSTRAINT ch_año_fundacion CHECK (año_fundacion >= 1850 and año_fundacion <= 2050),
ciudad VARCHAR(20) NOT NULL
);

create table Partidos(
id_equipo_casa int primary key, 
constraint fk_id_equipo_casa_Partidos foreign key (id_equipo_casa) references equipos (id_equipo),
id_equipo_fuera int not null,
constraint fk_id_equipo_fuera_Partidos foreign key(id_equipo_fuera) references equipos(id_equipo),
fecha date not null,
goles_casa int default 0 not null constraint ck_goles_casa check (goles_casa >=0),
goles_fuera int default 0 not null constraint ck_goles_fuera check (goles_fuera >=0),
observaciones varchar(40) 
);

create table Goles(
id_equipo_casa int,
id_equipo_fuera int,
constraint fk_Goles primary key (id_equipo_casa, id_equipo_fuera),
minuto int constraint ck_minuto check (minuto >=0 and minuto <=130),
descripcion varchar(50) not null,
id_jugador int not null, constraint fk_id_jugador foreign key (id_jugador) references jugadores(id_jugador)
);

desc equipos;
desc goles;

