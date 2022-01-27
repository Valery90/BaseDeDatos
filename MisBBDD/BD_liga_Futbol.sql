create database bd_liga_futbol;
use bd_liga_futbol;

create table equipos(
id_equipo int auto_increment primary key,
nombre varchar(30) not null unique,
estadio varchar(30) not null,
aforo int default 2000 constraint ck_aforo check (aforo > 100) ,
an_fundacion year(4) constraint ck_an_fundacion check (an_fundacion >= 1850 and an_fundacion <= 2050) ,
ciudad varchar(20) not null
);
create table jugadores (
id_jugador int auto_increment primary key,
nombre varchar(30) unique,
fecha_nac date not null,
id_equipo int not null,
constraint fk_id_equipo_jugadores foreign key (id_equipo) references equipos(id_equipo)
);

create table partidos(
id_equipo_casa int,
id_equipo_fuera int,
fecha date not null,
constraint pk_partidos primary key (id_equipo_casa, id_equipo_fuera),
goles_casa int not null default 0 constraint ck_goles_casa check (goles_casa > 0) ,
goles_fuera int not null default 0 constraint ck_goles_fuera check (goles_fuera > 0),
observaciones varchar(100),
constraint fk_id_equipo_casa_partidos foreign key (id_equipo_casa) references equipos (id_equipo),
constraint fk_id_equipo_fuera_partidos foreign key (id_equipo_fuera) references equipos(id_equipo)
);
create table goles (
id_equipo_casa int,
id_equipo_fuera int ,
minuto int constraint ch_minuto check (minuto between 0 and 130),
descripcion varchar(100),
id_jugador int,
constraint pk_goles primary key (id_equipo_casa, id_equipo_fuera, minuto),
constraint fk_id_jugador_goles foreign key (id_jugador) references jugadores (id_jugador),
constraint fk_id_equipo_goles foreign key (id_equipo_casa, id_equipo_fuera ) references partidos(id_equipo_casa, id_equipo_fuera)
);