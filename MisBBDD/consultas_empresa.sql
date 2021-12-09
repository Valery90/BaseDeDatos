#Tema 7
# Ejercicio a 
select *
from emple e
where dept_no = 10
order by apellido asc

# Ejercicio b
select apellido, fecha_alt, salario
from emple
where dept_no = 20 and oficio = 'ANALISTA'

# Ejercicio c
select dept_no, dnombre
from depart

# Ejercicio d
select emp_no, apellido, oficio
from emple
where apellido like 'J%'

# Ejercicio e
select * 
from emple
where apellido like '_E%'

# Ejercicio f
select apellido, oficio
from emple 
where oficio in ('ANALISTA','VENDEDOR', 'EMPLEADO')
order by apellido asc

# Ejercicio g 
select *
from emple 
where salario > 2000 or comision > 300

# Ejercicio h
select *
from emple 
where salario > 2000 and comision > 300

# Ejercicio i
# primera forma de realizar el join (on)
select e.apellido, e.salario, e.oficio, e.comision, d.dnombre, d.loc
from emple e join depart d on e.dept_no = d.dept_no

# segunda forma de realizar el join (where)
select e.apellido, e.salario, e.oficio, e.comision, d.dnombre, d.loc
from emple e, depart d 
where e.dept_no = d.dept_no

# tercera forma de realizar el join (using)
select e.apellido, e.salario, e.oficio, e.comision, d.dnombre, d.loc
from emple e join depart d using (dept_no)

# cuarta forma de realizar el join (natural join)
select e.apellido, e.salario, e.oficio, e.comision, d.dnombre, d.loc
from emple e natural join depart d 

/*Indique para todos los empleados que cobran comisión su apellido, el nombre del
departamento en el que trabajan, la comisión que cobran, su salario y el porcentaje que supone
la comisión con respecto al salario (PorcenComisión). Redondee este último dato a 2
decimales, para lo que puede hacer uso de la función round, que recibe como primer parámetro
el número que se desea redondear y como segundo el número de decimales que se desean en el
resultado.*/

select e.apellido, d.dnombre, e.comision, e.salario,
concat(round(( comision/salario * 100 ),2),'%') AS porcenComision 
from emple e, depart d
where e.dept_no = d.dept_no

/*k) Indique para el empleado que no tiene jefe o director su apellido, oficio, nombre del
departamento y localidad en la que trabaja.*/

select e.apellido, e.oficio, d.dnombre, d.loc
from emple e join depart d on e.dept_no = d.dept_no

/*l)Muestre a continuación para los departamentos con número superior o igual a 30, su nombre y
localidad y, en caso de que trabaje en él algún empleado, su apellido, salario y comisión.*/

select d.dnombre, d.loc, e.apellido, e.salario, e.comision
from emple e join depart d on e.dept_no = d.dept_no
where d.dept_no >=30