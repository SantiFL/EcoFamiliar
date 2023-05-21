create database PruebaFinal;
use PruebaFinal;

create table Cartuchera(
Fibras int, 				/*Cantidad de fibras*/
lapices_de_colores int, 	/*Cantidad de lapices de colores*/
Tipo_lapicera varchar(20),  /*Especificamos el tipo de lapiceras que se guardan por colores*/
tipo_biromes varchar(20),	/*Espicificamos el tipo de birome por la calidad de la tinta*/
Resaltadores varchar(20), 	/*Tipo de colores de resaltadores*/
gomas int,  				/*Cantidad de gomas*/
Lapiz_de_escribir int, 		/*Cantidad de lapices de escribir*/	
regla int,					/*Caantos centimetros tiene la regla*/
sacapunta int,				/*Cantidad de sacapuntas*/
plasticola date,			/*Fecha de expiracion de zacapuntas*/
tijerita varchar(20),		/*marca de tijera*/
transportador_grado int,	/*Cantidad de grados que tiene el transportador*/
compaz varchar(20));		/*Para que uso es el transportador*/


/*Consultas para realizar, nos preparamos para el examen*/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Primera consulta usamos el insert*/
INSERT INTO Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value (12,12,'negra','gelatina','fluor',1,1,30,1,'2024-5-3','para niños',180,'dibujo simple');

insert into Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value(12,12,'negra','gelatina','fluor',1,1,30,1,'2024-5-3','para niños',180,'dibujo simple');
insert into Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value(12,12,'negra','gelatina','fluor',1,1,30,1,'2024-5-3','para niños',180,'dibujo tecnico');
insert into Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value(12,12,'negra','gelatina','fluor',1,1,30,1,'2024-5-3','para niños',360,'dibujo simple');
insert into Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value(12,12,'azul','gelatina','fluor',1,1,30,1,'2024-5-3','para niños',180,'dibujo simple');
insert into Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value(10,10,'negra','gelatina','fluor',1,1,30,1,'2024-5-3','para niños',180,'dibujo simple');
insert into Cartuchera(Fibras,lapices_de_colores,Tipo_lapicera,tipo_biromes,Resaltadores,gomas,Lapiz_de_escribir,regla,sacapunta,plasticola,tijerita,transportador_grado,compaz)
value(10,10,'negra','gelatina','fluor',1,1,30,1,'2025-12-3','para niños',180,'dibujo simple');
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*Consulta para ver la tabla*/
select * from cartuchera;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*agregando clave primera a la tabla*/

alter table Cartuchera add alumnoid int not null auto_increment primary key;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*Segunda consulta usaremos el update*/
update Cartuchera set lapices_de_colores = 13 where alumnoid = 1;
update Cartuchera set Tipo_lapicera = 'azul' where alumnoid = 3;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Tercera cunsulta es un select con un where*/

select * from cartuchera WHERE Fibras = 10;
select * from cartuchera WHERE alumnoid > 3;
select * from cartuchera WHERE alumnoid < 4;
select * from cartuchera WHERE lapices_de_colores <= 12;
select * from cartuchera WHERE lapices_de_colores >= 12;
select * from cartuchera WHERE lapices_de_colores <> 12;
select * from cartuchera WHERE lapices_de_colores between 12 and 13;
select * from cartuchera WHERE lapices_de_colores = 12 or 13;
select * from cartuchera WHERE plasticola  = '24-5-3' or '25-5-3';
select * from cartuchera WHERE plasticola   not between'24-5-3' and '25-5-3';
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Select con join y where*/
/*creamos otra tabla que tenga alumnosid*/

create table Alumnos(
cantidadalumnos int not null auto_increment primary key,
alumnosid int not null,
foreign key(alumnosid) references cartuchera(alumnoid),
colegio varchar(20),
grado int,
dni int,
fechanNacimiento int
);


/*cambiar el tipo de dato de una tabla*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
alter table Alumnos modify fechanNacimiento date;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
insert into Alumnos(alumnosid,colegio,grado,dni,fechanNacimiento)
value(1,'proa',1,35489752,250215);
insert into Alumnos(alumnosid,colegio,grado,dni,fechanNacimiento)
value(2,'proa',1,35489752,250215);
insert into Alumnos(alumnosid,colegio,grado,dni,fechanNacimiento)
value(3,'proa',1,35489752,250215);
insert into Alumnos(alumnosid,colegio,grado,dni,fechanNacimiento)
value(4,'proa',1,35489752,250215);

select * from Alumnos;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

select *
from cartuchera
inner join alumnos
on cartuchera.alumnoid = Alumnos.alumnosid;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

select alumnos.cantidadalumnos,cartuchera.fibras
from alumnos
inner join cartuchera
on cartuchera.alumnoid = Alumnos.alumnosid
where cantidadalumnos = 1;

select alumnos.alumnosid,cartuchera.Tipo_lapicera
from alumnos
inner join cartuchera
on cartuchera.alumnoid = Alumnos.alumnosid
where tipo_lapicera = 'azul';

select alumnos.alumnosid,cartuchera.Tipo_lapicera
from alumnos
inner join cartuchera
on cartuchera.alumnoid = Alumnos.alumnosid
where tipo_lapicera between 'azul' and 'negra';


select alumnos.colegio,cartuchera.compaz
from alumnos
inner join cartuchera
on cartuchera.alumnoid = Alumnos.alumnosid
where compaz = 'dibujo tecnico';
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*tema 5  select con group by */

select alumnoid, count(alumnoid) as cantidad_alumno /* selecciona la columna alumnid, cuenta la cantidad de alumnos, y coloca una nueva tabla llamada cantidad de alumno*/
from cartuchera /*de la tabla cartuchera*/
where Tipo_lapicera = 'negra' /*donde los datos de la tabla cartuchera / columna Tipo_lapicera = negra*/
group by alumnoid; /*los agrupa por la columna alumnoid */

select alumnoid, SUM(alumnoid) as cantidad_alumno /* selecciona la columna alumnid, cuenta la cantidad de alumnos, y coloca una nueva tabla llamada cantidad de alumno*/
from cartuchera /*de la tabla cartuchera*/
where Tipo_lapicera = 'negra' /*donde los datos de la tabla cartuchera / columna Tipo_lapicera = negra*/
group by alumnoid; /*los agrupa por la columna alumnoid */

/*para que quede claro, el group by junta los dintintos tipos*/

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

select Fibras, sum(Fibras) as cantidad_fibras
from cartuchera;
/*de esta forma se suma el total*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

select alumnoid, avg(alumnoid) as prmedio_alumno
from cartuchera
where alumnoid >1;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*tema 6 delte*/
Delete from cartuchera where alumnoid = 8;/*Delete es para eliminar from la tabla y el where es para espicificar el tipo de columna con su respectivo dato a eliminar*/