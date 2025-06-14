Use Trabajo_Practico_1

--1-Todos los usuarios indicando Apellido, Nombre.
SELECT Apellido, Nombre From Usuarios;

--2-Todos los usuarios indicando Apellido y Nombre con el formato: [Apellido], [Nombre] (ordenados por Apellido en forma descendente). 
SELECT Apellido + ', ' + Nombre AS 'Apellido y nombre' FROM Usuarios ORDER BY Apellido DESC;

--3-Los usuarios cuyo IDTipoUsuario sea 5 (indicando Nombre, Apellido)
SELECT Nombre + ', ' + Apellido AS 'Nombre y Apellido' FROM Usuarios U WHERE U.IdTipoUsuario = 5;

--4-El �ltimo usuario del listado en orden alfab�tico (ordenado por Apellido y luego por Nombre). Indicar IDUsuario, Apellido y Nombre.
SELECT TOP(1) IdUsuario, Apellido, Nombre FROM Usuarios ORDER BY Apellido DESC;

--5-Los archivos cuyo a�o de creaci�n haya sido 2021 (Indicar Nombre, Extensi�n y Fecha de creaci�n).
SELECT Nombre, Extension, FechaCreacion FROM Archivos WHERE YEAR(FechaCreacion) = 2021;

--6-Todos los usuarios con el siguiente formato Apellido, Nombre en una nueva columna llamada ApellidoYNombre, en orden alfab�tico.
SELECT Apellido + ', ' + Nombre AS 'ApellidoYNombre' FROM Usuarios ORDER BY Apellido ASC, Nombre ASC ;

--7-Todos los archivos, indicando el semestre en el cual se produjo su fecha de creaci�n. Indicar Nombre, Extensi�n, Fecha de Creaci�n y la frase �Primer Semestre� o �Segundo Semestre� seg�n corresponda.
SELECT Nombre, Extension, FechaCreacion,
CASE 
	WHEN Month(FechaCreacion) <= 6 THEN 'Primer Semestre'
	ELSE 'Segundo Semestre'
END AS 'Semestre'
FROM Archivos;

--8-�dem al punto anterior, pero ordenarlo por semestre y fecha de creaci�n.
SELECT Nombre, Extension, FechaCreacion,
CASE 
	WHEN Month(FechaCreacion) <= 6 THEN 'Primer Semestre'
	ELSE 'Segundo Semestre'
END AS 'Semestre'
FROM Archivos ORDER BY Month(FechaCreacion);

--9-Todas las Extensiones de los archivos creados. NOTA: no se pueden repetir.
SELECT DISTINCT Extension FROM Archivos;

--10-Todos los archivos que no est�n eliminados. Indicar IDArchivo, IDUsuarioDue�o, Fecha de Creaci�n y Tama�o del archivo. Ordenar los resultados por Fecha de Creaci�n (del m�s reciente al m�s antiguo).
SELECT IdArchivo, IdUsuarioDuenio, FechaCreacion, Tamanio FROM Archivos WHERE Eliminado = 0 ORDER BY FechaCreacion DESC;

--11-Todos los archivos que est�n eliminados cuyo Tama�o del archivo se encuentre entre 40960 y 204800 (ambos inclusive). Indicar el valor de todas las columnas. 
SELECT * FROM Archivos WHERE Eliminado = 1 AND Tamanio BETWEEN 40960 AND 204800;

--12-Listar los meses del a�o en los que se crearon los archivos entre los a�os 2020 y 2022 (ambos inclusive). NOTA: no indicar m�s de una vez el mismo mes.
SELECT DISTINCT MONTH(FechaCreacion) AS 'Meses' FROM Archivos WHERE YEAR(FechaCreacion) BETWEEN 2020 AND 2022

--13-Indicar los distintos ID de los Usuarios Due�os de archivos que nunca modificaron sus archivos y que no se encuentren eliminados. NOTA: no se pueden repetir.
SELECT DISTINCT IdUsuarioDuenio FROM Archivos WHERE FechaUltimaModificacion = FechaCreacion AND Eliminado = 0;

--14-Listar todos los datos de los Archivos cuyos Due�os sean los usuarios con ID 1, 3, 5, 8, 9. Los registros deben estar ordenados por IDUsuarioDue�o y Tama�o de forma ascendente.
SELECT * FROM Archivos WHERE IdUsuarioDuenio IN (1,3,5,8,9) ORDER BY IdUsuarioDuenio ASC, Tamanio ASC;

--15-Listar todos los datos de los tres Archivos de m�s bajo Tama�o que no se encuentren Eliminados.
SELECT TOP(3) * FROM Archivos WHERE Eliminado = 0 ORDER BY Tamanio ASC;

--16-Listar los Archivos que est�n Eliminados y la Fecha de Ultima Modificaci�n sea menor o igual al a�o 2021 o bien no est�n Eliminados y la Fecha de Ultima Modificaci�n sean mayor al a�o 2021. Indicar todas las columnas excepto IDUsuarioDue�o y Fecha de Creaci�n. Ordenar por IDArchivo.
SELECT IdArchivo, Nombre, Extension, Descripcion, IDTipoArchivo, Tamanio, FechaUltimaModificacion, Eliminado 
FROM Archivos 
WHERE (Eliminado = 1 AND YEAR(FechaUltimaModificacion) <= 2021) OR (Eliminado = 0 AND YEAR(FechaUltimaModificacion) > 2021) 
ORDER BY IdArchivo ASC;

--17-Listar los Archivos creados en el a�o 2023 indicando todas las columnas y adem�s una llamada �DiaSemana� que devuelva a qu� d�a de la semana (1-7) corresponde la fecha de creaci�n del archivo. Ordenar los registros por la columna que contiene el d�a de la semana.
--DESAF�O: crear otra columna llamada DiaSemanaEnLetras que contenga el d�a de la semana, pero en letras (suponiendo que la semana comienza en 1-DOMINGO). Por ejemplo, si la fecha del Archivo es 20/08/2023, la columna DiaSemana debe contener 1 y la columna DiaSemanaEnLetras debe contener DOMINGO.
SELECT *,
CASE
	WHEN DAY(FechaCreacion) IN (1,8,15,22,29) THEN 1
	WHEN DAY(FechaCreacion) IN (2,9,16,23,30) THEN 2
	WHEN DAY(FechaCreacion) IN (3,10,17,24,31) THEN 3
	WHEN DAY(FechaCreacion) IN (4,11,18,25) THEN 4
	WHEN DAY(FechaCreacion) IN (5,12,19,26) THEN 5
	WHEN DAY(FechaCreacion) IN (6,13,20,27) THEN 6
	ELSE 7
END AS 'DiaSemana',
CASE 
	WHEN DAY(FechaCreacion) IN (1,8,15,22,29) THEN 'Domingo'
	WHEN DAY(FechaCreacion) IN (2,9,16,23,30) THEN 'Lunes'
	WHEN DAY(FechaCreacion) IN (3,10,17,24,31) THEN 'Martes'
	WHEN DAY(FechaCreacion) IN (4,11,18,25) THEN 'Miercoles'
	WHEN DAY(FechaCreacion) IN (5,12,19,26) THEN 'Jueves'
	WHEN DAY(FechaCreacion) IN (6,13,20,27) THEN 'Viernes'
	ELSE 'Sabado'
END AS 'DiaSemanaEnLetras'
FROM Archivos WHERE YEAR(FechaCreacion) = 2023
ORDER BY DiaSemana ASC;

--18-Listar los Archivos que no est�n Eliminados y cuyo mes de creaci�n coincida con el mes actual (sin importar el a�o). NOTA: obtener el mes actual mediante una funci�n, no forzar el valor.
SELECT * FROM Archivos WHERE Eliminado = 0 AND MONTH(FechaCreacion) = MONTH(GETDATE());

--19-Listar la cantidad total de archivos creados en cada a�o, mostrando una columna con el a�o (obtenido a partir de la fecha de creaci�n) y otra con la cantidad de archivos correspondientes a ese a�o. Adem�s, si se animan, como desaf�o adicional, agreguen a la consulta una tercera columna llamada PorcentajeSobreElTotal, que indique qu� porcentaje representa dicha cantidad sobre el total general de archivos registrados en la base. El porcentaje debe mostrarse con dos decimales y calcularse sin utilizar subconsultas. Ordenar el resultado por a�o.
SELECT 
  YEAR(FechaCreacion) AS Anio,
  COUNT(*) AS Cantidad,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS PorcentajeSobreElTotal
FROM Archivos
GROUP BY YEAR(FechaCreacion)
ORDER BY Anio;

--20-Listar los Archivos que no hayan sido creados por los Usuarios con ID 1, 2, ,5, 9 y 10. Indicar IDUsuarioDue�o, IDArchivo, fecha de creaci�n y Tama�o. Ordenar por IDUsuarioDue�o.
SELECT IdUsuarioDuenio, IdArchivo, FechaCreacion, Tamanio FROM Archivos WHERE IdUsuarioDuenio NOT IN (1,2,5,9,10);

--21-Listar todos los datos de los Usuarios cuyos apellidos comienzan con J. Hacer la misma consulta para los Usuarios con apellido que comienza con J y el Nombre comienza con E. Ordenar los registros por IDUsuario.
SELECT * FROM Usuarios WHERE Apellido LIKE 'J%';
SELECT * FROM Usuarios WHERE Apellido LIKE 'J%' AND Nombre Like 'E%'
ORDER BY IdUsuario;

--22-Listar todos los datos de los Archivos que tengan el mayor Tama�o. En caso de empate se deben listar todos los Archivos con igual Tama�o.
SELECT TOP(10) * FROM Archivos ORDER BY Tamanio DESC;

