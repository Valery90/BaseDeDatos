/*a) Muestre para todas las provincias de la comunidad autónoma del País Vasco, el
nombre de la provincia, su superficie, el nombre de la capital de la provincia y su
población.*/

select p.nombre, p.superficie, l.nombre, l.poblacion from provincias p
join localidades l on l.id_localidad = p.id_capital
join comunidades c on c.id_comunidad = p.id_comunidad
where c.nombre ='País Vasco'

/*b) Muestre para todas las comunidades autónomas cuyo nombre termine por la letra ‘a’,
su nombre, el nombre de su capital y la población de ésta.*/

select c.nombre, l.nombre, l.poblacion from comunidades c
join localidades l on  c.id_capital = l.id_localidad
where c.nombre like '%a'

/*c) Muestre para las localidades de la base de datos con menos de 15 habitantes, el nombre
de la localidad, su población y el nombre de la provincia y de la comunidad autónoma
a la que pertenece dicha localidad. Ordene el resultado de la menos poblada a la más
poblada.*/

select l.nombre, l.poblacion, p.nombre, c.nombre  from localidades l 
join provincias p on p.n_provincia = l.n_provincia
join comunidades c on p.id_comunidad = c.id_comunidad
where poblacion < 15 order by l.poblacion asc