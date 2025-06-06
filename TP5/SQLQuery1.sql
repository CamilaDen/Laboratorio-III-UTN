Use Trabajo_Practico_1
--1-La cantidad de archivos con extensión zip.
SELECT COUNT(*) FROM ARCHIVOS A WHERE Extension Like 'Zip';

--2-La cantidad de archivos que fueron modificados y, por lo tanto, su fecha de última modificación no es la misma que la fecha de creación.
SELECT COUNT(*) FROM Archivos WHERE FechaUltimaModificacion > FechaCreacion;

--3-La fecha de creación más antigua de los archivos con extensión pdf.
SELECT MAX(FechaCreacion) FROM Archivos WHERE Extension Like 'Pdf'; 

--4-La cantidad de extensiones distintas cuyos archivos tienen en su nombre o en su descripción la palabra 'Informe' o 'Documento'.
SELECT DISTINCT COUNT(*) FROM Archivos WHERE Nombre Like '%Informe%' OR Nombre Like '%Documento%' OR Descripcion Like '%Informe%' OR Descripcion Like '%Documento%';

--5-El promedio de tamaño (expresado en Megabytes) de los archivos con extensión 'doc', 'docx', 'xls', 'xlsx'.
SELECT ROUND(AVG(A.Tamanio) / 1000000.0, 2) AS PromedioTamanioMB FROM Archivos A
WHERE LOWER(A.Extension) IN ('doc','docx', 'xls', 'xlsx');

--6-La cantidad de archivos que le fueron compartidos al usuario con apellido 'Clarck'
SELECT COUNT(*) 
FROM ArchivosCompartidos AC
INNER JOIN Archivos A ON A.IdArchivo = AC.IdArchivo
INNER JOIN Usuarios U ON U.IdUsuario = AC.IdUsuario
WHERE U.Apellido = 'Clarck';

--7-La cantidad de tipos de usuario que tienen asociado usuarios que registren, como dueños, archivos con extensión pdf.
SELECT COUNT(*)AS cantidad, TU.TipoUsuario FROM TiposUsuarios TU
INNER JOIN Usuarios U ON U.IdTipoUsuario = TU.IdTipoUsuario
INNER JOIN Archivos A ON A.IdUsuarioDuenio = U.IdUsuario
WHERE LOWER(A.Extension) Like 'pdf'
GROUP BY TU.TipoUsuario;

--SELECT * FROM Archivos A
--FULL JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
--FULL JOIN TiposUsuarios T ON T.IdTipoUsuario = U.IdTipoUsuario
-- WHERE LOWER(A.Extension) Like 'pdf';

--8-El tamaño máximo expresado en Megabytes de los archivos que hayan sido creados en el año 2024.
SELECT MAX(ROUND(A.Tamanio / 1000000.0, 2)) AS MaximoMegabytes
FROM Archivos A
WHERE YEAR(A.FechaCreacion) >= 2024;

--9-El nombre del tipo de usuario y la cantidad de usuarios distintos de dicho tipo que registran, como dueños, archivos con extensión pdf.
SELECT TU.TipoUsuario, COUNT(DISTINCT U.IdUsuario) AS CantUsuariosDistintos
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN TiposUsuarios TU ON TU.IdTipoUsuario = U.IdTipoUsuario
WHERE LOWER(A.Extension) Like 'pdf'
GROUP BY TU.TipoUsuario;

--10-El nombre y apellido de los usuarios dueños y la suma total del tamaño de los archivos que tengan compartidos con otros usuarios. Mostrar ordenado de mayor sumatoria de tamaño a menor.
SELECT U.Apellido, U.Nombre, SUM(A.Tamanio) AS Sumatoria FROM Usuarios U
INNER JOIN ArchivosCompartidos AC ON AC.IdUsuario = U.IdUsuario
INNER JOIN Archivos A ON AC.IdArchivo = A.IdArchivo
GROUP BY U.Apellido, U.Nombre
ORDER BY Sumatoria DESC;

--11-El nombre del tipo de archivo y el promedio de tamaño de los archivos que corresponden a dicho tipo de archivo.
--SELECT Ar. AVG() AS Promedio Tamanio FROM Archivo
SELECT TA.TipoArchivo, AVG(A.Tamanio) AS Promedio FROM Archivos A
INNER JOIN TiposArchivos TA ON TA.IdTipoArchivo = A.IDTipoArchivo
GROUP BY TA.TipoArchivo;

--12-Por cada extensión, indicar la extensión, la cantidad de archivos con esa extensión y el total acumulado en bytes. 
--Ordenado por cantidad de archivos de forma ascendente.
SELECT DISTINCT A.Extension, COUNT(A.Extension) AS Cantidad, SUM(A.Tamanio) AS 'Total Bytes' FROM Archivos A
GROUP BY A.Extension
ORDER BY Cantidad ASC;

--13-Por cada usuario, indicar IDUSuario, Apellido, Nombre y la sumatoria total en bytes de los archivos que es dueño.
--Si algún usuario no registra archivos indicar 0 en la sumatoria total.
SELECT U.IdUsuario, U.Apellido, U.Nombre, COALESCE(SUM(A.Tamanio), 0) AS TotalBytes
FROM Usuarios U
LEFT JOIN Archivos A ON A.IdUsuarioDuenio = U.IdUsuario
GROUP BY U.IdUsuario, U.Apellido, U.Nombre;

--14-Los tipos de archivos que fueron compartidos más de una vez con el permiso con nombre 'Lectura'
SELECT TA.TipoArchivo, COUNT(*) AS VecesCompartido
FROM ArchivosCompartidos AC
INNER JOIN Permisos P ON P.IdPermiso = AC.IdPermiso
INNER JOIN Archivos A ON A.IdArchivo = AC.IdArchivo
INNER JOIN TiposArchivos TA ON TA.IdTipoArchivo = A.IdTipoArchivo
WHERE P.Nombre = 'Lectura'
GROUP BY TA.TipoArchivo
HAVING COUNT(*) > 1;

--15-Escribí una consulta que requiera una función de resumen, el uso de joins y de having. 
--Pega en el Foro de Actividad 2.3 en el hilo "Queries del Ejercicio 15" el enunciado de la consulta y la tabla en formato texto plano de lo que daría como resultado con los datos que trabajamos en conjunto.


--16-Por cada tipo de archivo indicar el tipo de archivo y el tamaño del archivo de dicho tipo que sea más pesado.
SELECT TA.TipoArchivo, A.Tamanio
FROM Archivos A
INNER JOIN TiposArchivos TA ON TA.IdTipoArchivo = A.IDTipoArchivo
WHERE A.Tamanio = (
    SELECT MAX(A2.Tamanio)
    FROM Archivos A2
    WHERE A2.IdTipoArchivo = A.IdTipoArchivo
);

--17-El nombre del tipo de archivo y el promedio de tamaño de los archivos que corresponden a dicho tipo de archivo. Solamente listar aquellos registros que superen los 50 Megabytes de promedio.
SELECT TA.TipoArchivo, AVG(A.Tamanio) AS PromedioTamanio
FROM Archivos A
INNER JOIN TiposArchivos TA ON TA.IdTipoArchivo = A.IdTipoArchivo
GROUP BY TA.TipoArchivo
HAVING AVG(A.Tamanio) > 52428800; -- 50 MB en bytes

--18-Listar las extensiones que registren más de 2 archivos que no hayan sido compartidos.
SELECT A.Extension, COUNT(*) AS CantidadNoCompartidos
FROM Archivos A
LEFT JOIN ArchivosCompartidos AC ON AC.IdArchivo = A.IdArchivo
WHERE AC.IdArchivo IS NULL
GROUP BY A.Extension
HAVING COUNT(*) > 2;