create database BD_Multas;
create table vehiculos(
Matricula char(7) primary key,
marca_modelo varchar(20) not null,
impuesto float default 50 not null constraint ch_Impuesto check (impuesto >=10)
);

create table Guardias(
Codigo_G char(5) primary key,
Codigo_G_jefe char(5) not null, 
constraint fk_Codigo_G_jefe_Multas foreign key (Codigo_G_jefe) references guardias(Codigo_G),
nombre varchar(20) not null
);

create table Multas(
Nmulta int primary key,
Codigo_G char(5) not null, constraint fk_Codigo_G_Multas foreign key (Codigo_g) references guardias(Codigo_G),
matricula char(7) not null, constraint fk_matricula_Multas foreign key (matricula) references vehiculos(Matricula),
fecha datetime not null default current_timestamp,
lugar varchar(50) not null,
importe float not null constraint ch_importe check (importe >=15 and importe <=600),
descripcion varchar(100) not null,
pagado enum('si','no') not null
);

desc multas;