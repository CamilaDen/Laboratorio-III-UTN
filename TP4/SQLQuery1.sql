USE Trabajo_Practico_1
--1-Por cada usuario listar el nombre, apellido y el nombre del tipo de usuario.
SELECT U.Nombre, U.Apellido, TU.TipoUsuario
FROM Usuarios U 
LEFT JOIN  TiposUsuarios AS TU 
ON U.IdTipoUsuario = U.IdTipoUsuario;

--2-Listar el ID, nombre, apellido y tipo de usuario de aquellos usuarios que sean del tipo 'Suscripci�n Free' o 'Suscripci�n B�sica'
SELECT  U.IdUsuario, U.Nombre, U.Apellido, U.IdTipoUsuario
FROM Usuarios U
INNER JOIN TiposUsuarios AS TU ON U.IdUsuario = TU.IdTipoUsuario WHERE TU.IdTipoUsuario = 1 OR TU.IdTipoUsuario = 2;

--3-Listar los nombres de archivos, extensi�n, tama�o expresado en Megabytes y el nombre del tipo de archivo.
--NOTA: En la tabla Archivos el tama�o est� expresado en Bytes.
SELECT A.Nombre, A.Extension, (Tamanio/1000000) AS Megabytes, TA.TipoArchivo 
FROM Archivos A
INNER JOIN TiposArchivos AS TA ON TA.IdTipoArchivo = A.IDTipoArchivo;

--4-Listar los nombres de archivos junto a la extensi�n con el siguiente formato 'NombreArchivo.extension'. Por ejemplo, 'Actividad.pdf'.
--S�lo listar aquellos cuyo tipo de archivo contenga los t�rminos 'ZIP', 'Word', 'Excel', 'Javascript' o 'GIF'
SELECT A.Nombre + '.' + A.Extension AS 'NombreArchivo.extension'
FROM Archivos A
RIGHT JOIN TiposArchivos AS TA ON TA.IdTipoArchivo = A.IDTipoArchivo
WHERE TA.TipoArchivo LIKE '%ZIP%' OR TA.TipoArchivo Like '%Word%' OR TA.TipoArchivo Like'%Excel%' OR TA.TipoArchivo LIKE'%Javascript%'
OR TA.TipoArchivo Like'%GIF%';

--5-Listar los nombres de archivos, su extensi�n, el tama�o en megabytes y la fecha de creaci�n de aquellos archivos que le pertenezcan al usuario due�o con nombre 'Michael' y apellido 'Williams'.
SELECT A.Nombre, A.Extension, (A.Tamanio/1000000) AS Megabytes, A.FechaCreacion
FROM Archivos A
INNER JOIN Usuarios AS U ON U.IdUsuario = A.IdUsuarioDuenio
WHERE U.Nombre Like 'Michael' AND U.Apellido Like 'Williams';

--6-Listar los datos completos del archivo m�s pesado del usuario due�o con nombre 'Michael' y apellido 'Williams'. Si hay varios archivos que cumplen esa condici�n, listarlos a todos.
SELECT *
FROM Archivos A
INNER JOIN Usuarios AS U ON U.IdUsuario = A.IdUsuarioDuenio
WHERE U.Nombre Like 'Michael' AND U.Apellido Like 'Williams';

--7-Listar nombres de archivos, extensi�n, tama�o en bytes, fecha de creaci�n y de modificaci�n, apellido y nombre del usuario due�o de aquellos archivos cuya descripci�n contengan el t�rmino 'empresa' o 'presupuesto'
SELECT A.Nombre, A.Extension, A.Tamanio, A.FechaCreacion, A.FechaUltimaModificacion, U.Apellido, U.Nombre
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
WHERE A.Descripcion Like '%empresa%' OR A.Descripcion Like 'presupuesto';

--8-Listar las extensiones sin repetir de los archivos cuyos usuarios due�os tengan tipo de usuario 'Suscripci�n Plus', 'Suscripci�n Premium' o 'Suscripci�n Empresarial'
SELECT DISTINCT A.Extension
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN TiposUsuarios TU ON TU.IdTipoUsuario = U.IdTipoUsuario
WHERE TU.TipoUsuario Like 'Suscripci�n Plus' OR TU.TipoUsuario Like 'Suscripci�n Premium' OR TU.TipoUsuario Like 'Suscripci�n Empresarial';

--9-Listar los apellidos y nombres de los usuarios due�os y el tama�o del archivo de los tres archivos con extensi�n 'zip' m�s pesados. Puede ocurrir que el mismo usuario aparezca varias veces en el listado.
SELECT U.Apellido, U.Nombre, A.Tamanio
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
WHERE A.Extension Like '%zip%'
ORDER BY A.Tamanio DESC;

--10-Por cada archivo listar el nombre del archivo, la extensi�n, el tama�o en bytes, el nombre del tipo de archivo y el tama�o calculado en su mayor expresi�n y la unidad calculada. 
--Siendo Gigabytes si al menos pesa un gigabyte, Megabytes si al menos pesa un megabyte, Kilobyte si al menos pesa un kilobyte o en su defecto expresado en bytes.
--Por ejemplo, si el archivo imagen.jpg pesa 40960 bytes entonces debe figurar 40 en la columna Tama�o Calculado y 'Kilobytes' en la columna unidad.
SELECT 
    A.Nombre, A.Extension, A.Tamanio AS TamanoBytes, TA.TipoArchivo,
    CASE 
        WHEN A.Tamanio >= 1073741824 THEN CAST(ROUND(A.Tamanio / 1073741824.0, 2) AS DECIMAL(10,2)) -- GB
        WHEN A.Tamanio >= 1048576 THEN CAST(ROUND(A.Tamanio / 1048576.0, 2) AS DECIMAL(10,2)) -- MB
        WHEN A.Tamanio >= 1024 THEN CAST(ROUND(A.Tamanio / 1024.0, 2) AS DECIMAL(10,2)) -- KB
        ELSE CAST(A.Tamanio AS DECIMAL(10,2)) -- Bytes
    END AS TamanoCalculado,
    CASE 
        WHEN A.Tamanio >= 1073741824 THEN 'Gigabytes'
        WHEN A.Tamanio >= 1048576 THEN 'Megabytes'
        WHEN A.Tamanio >= 1024 THEN 'Kilobytes'
        ELSE 'Bytes'
    END AS Unidad
FROM Archivos A
JOIN TiposArchivos TA ON A.IDTipoArchivo = TA.IdTipoArchivo;

--11-Listar los nombres de archivo y extensi�n de los archivos que han sido compartidos.
SELECT DISTINCT A.Nombre, A.Extension
FROM ArchivosCompartidos AC
INNER JOIN Usuarios U ON U.IdUsuario = U.IdUsuario
INNER JOIN Archivos A ON A.IDTipoArchivo = AC.IdArchivo
WHERE FechaCompartido IS NOT NULL;

--12-Listar los nombres de archivo y extensi�n de los archivos que han sido compartidos a usuarios con apellido 'Clarck' o 'Jones'
SELECT A.Nombre, A.Extension
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN ArchivosCompartidos AC ON AC.IdArchivo = A.IdArchivo
WHERE AC.FechaCompartido IS NOT NULL AND (U.Apellido Like 'Clarck' OR U.Apellido Like 'Jones');

--13-Listar los nombres de archivo, extensi�n, apellidos y nombres de los usuarios a quienes se le hayan compartido archivos con permiso de 'Escritura'
SELECT A.Nombre, A.Extension, U.Apellido, U.Nombre
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN ArchivosCompartidos AC ON AC.IdArchivo = A.IdArchivo
INNER JOIN Permisos P ON P.IdPermiso = AC.IdPermiso
WHERE P.Nombre Like 'Escritura' AND AC.FechaCompartido IS NOT NULL;

--14-Listar los nombres de archivos y extensi�n de los archivos que no han sido compartidos.
SELECT Ar.Nombre, Ar.Extension FROM Archivos Ar
LEFT JOIN ArchivosCompartidos AC ON Ar.IdArchivo = AC.IdArchivo 
WHERE AC.FechaCompartido IS NULL; 
--revisar, left join trae todos los registros de Archivos y los que matchean con la otra tabla, en este caso solo hay que traer los que no esten en la tabla de compartidos

--15-Listar los apellidos y nombres de los usuarios due�os que tienen archivos eliminados.
SELECT U.Apellido, U.Nombre FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario= A.IdUsuarioDuenio
WHERE A.Eliminado = 1;

--16-Listar los nombres de los tipos de suscripciones, sin repetir, que tienen archivos que pesan al menos 120 Megabytes.
SELECT TU.TipoUsuario, A.Tamanio
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN TiposUsuarios TU ON TU.IdTipoUsuario = U.IdTipoUsuario
WHERE A.Tamanio >= 120; --REVISAR CREO QUE TENGO QUE CONVERTIR TAMANIO A MEGABYTES Y AHI COMPARAR CONTRA 120.

--17-Listar los apellidos y nombres de los usuarios due�os, nombre del archivo, extensi�n, fecha de creaci�n, fecha de modificaci�n y la cantidad de d�as transcurridos desde la �ltima modificaci�n.
--S�lo incluir a los archivos que se hayan modificado (fecha de modificaci�n distinta a la fecha de creaci�n).
SELECT U.Apellido, U.Nombre, A.Nombre, A.Extension, A.FechaCreacion, A.FechaUltimaModificacion, DATEDIFF(DAY, A.FechaCreacion, A.FechaUltimaModificacion) AS 'Cant dias transcurridos' FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
WHERE A.FechaUltimaModificacion > A.FechaCreacion;

--18-Listar nombres de archivos, extensi�n, tama�o, apellido y nombre del usuario due�o del archivo, apellido y nombre del usuario que tiene el archivo compartido y el nombre de permiso otorgado.
SELECT A.Nombre, A.Extension, A.Extension, U.Apellido, U.Nombre
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN ArchivosCompartidos AC ON AC.IdArchivo = A.IdArchivo;--TODO: TERMINAR, CREO QUE HAY QUE USAR SUBCONSULTAS.

--19-Listar nombres de archivos, extensi�n, tama�o, apellido y nombre del usuario due�o del archivo, apellido y nombre del usuario que tiene el archivo compartido y el nombre de permiso otorgado.
--S�lo listar aquellos registros cuyos tipos de usuarios coincidan tanto para el due�o como para el usuario al que le comparten el archivo.
SELECT A.Nombre, A.Extension, A.Extension, U.Apellido, U.Nombre
FROM Archivos A
INNER JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
INNER JOIN ArchivosCompartidos AC ON AC.IdArchivo = A.IdArchivo;--TODO:TERMINAR..

--20-Apellido y nombre de los usuarios que tengan compartido o sean due�os del archivo con nombre 'Documento Legal'.
SELECT DISTINCT U.Apellido, U.Nombre
FROM Archivos A
LEFT JOIN ArchivosCompartidos AC ON AC.IdArchivo = A.IdArchivo
LEFT JOIN Usuarios U ON U.IdUsuario = AC.IdUsuario
WHERE A.Nombre = 'Documento Legal'
UNION
SELECT U.Apellido, U.Nombre
FROM Archivos A
JOIN Usuarios U ON U.IdUsuario = A.IdUsuarioDuenio
WHERE A.Nombre = 'Documento Legal'; 