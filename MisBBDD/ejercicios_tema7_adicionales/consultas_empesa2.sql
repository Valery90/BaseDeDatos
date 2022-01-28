/*a) Liste el NIF, nombre y complemento familiar (con dos decimales) de los empleados con
hijos, sabiendo que el complemento familiar se calcula de acuerdo con la siguiente
fórmula:

Complemento familiar = ((4 x Número de hijos) / 100 ) x Salario*/

select nifEmp, nomEmp, (round(((4*numHi)/100)* salEmp)) as 'complemeto familiar' from empleado where numHi > 0

/*b) Muestre ordenados alfabéticamente los nombres de los empleados del centro Fábrica
Zona Sur que tienen hijos nacidos antes de su contratación por la empresa.*/

select distinct nomEmp from empleado e
join departamento d on e.CodDep = d.CodDep
join centro c on d.CodCen = c.CodCen
join hijo h on e.CodEmp = h.CodEmp
where FecNaHi < FecInEmp and NomCen = 'Fábrica Zona Sur'
order by NomEmp; 

/*c) Muestre los nombres de los departamentos donde haya al menos un trabajador cuyo
salario suponga más del 25% del presupuesto del departamento.*/

select NomDep d  from departamento d 
join empleado e on d.CodEmpDir = e.CodEmp 
where SalEmp > (0.25*PreAnu)

/*d) Muestre para los empleados que poseen habilidades con nivel superior o igual a 9, el
nombre del empleado, la descripción de la habilidad y el nivel.*/

select nomEmp e, desHab h, nivHab ha from empleado e 
join habemp ha on ha.codEmp = e.codEmp 
join habilidad h on h.codHab = ha.codHab 
where nivHab >=9

select * from empleado 
select * from habilidad
select * from habemp