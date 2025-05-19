USE Trabajo_Practico_1
GO
INSERT INTO Permisos ( Nombre ) VALUES 
('Lectura'), 
('Comentario'), 
('Escritura'), 
('Administrador');
GO
INSERT INTO TiposUsuarios ( TipoUsuario ) VALUES 
('Suscripción Free'),
('Suscripción Básica'),
('Suscripción Plus'),
('Suscripción Premium'),
('Suscripción Empresarial');
GO
INSERT INTO TiposArchivos ( TipoArchivo ) VALUES 
('Documento PDF'),
('Imagen JPEG'),
('Imagen BMP'),
('Archivo ZIP'),
('Ejecutable EXE'),
('Documento Word'),
('Hoja de Calculo Excel'),
('Presentacion PowerPoint'),
('Archivo de Texto TXT'),
('Archivo HTML'),
('Archivo CSS'),
('Archivo JavaScript'),
('Archivo XML'),
('Archivo JSON'),
('Archivo MP3'),
('Video MP4'),
('Archivo WAV'),
('Imagen PNG'),
('Archivo GIF'),
('Archivo TAR');
GO
INSERT INTO Usuarios ( Nombre , Apellido, IdTipoUsuario ) VALUES
( 'Adrián' , 'Clarck', 1 ),
( 'María' , 'González', 2 ),
( 'Carlos' , 'López', 3 ),
( 'Ana' , 'Martínez', 4 ),
( 'Luis' , 'Fernández', 5 ),
( 'John' , 'Smith', 1 ),
( 'Emily' , 'Johnson', 2 ),
( 'Michael' , 'Williams', 3 ),
( 'Jessica' , 'Brown', 4 ),
( 'David' , 'Jones', 5 );
GO
INSERT INTO Archivos (IdUsuarioDuenio, Nombre, Extension, Descripcion, IDTipoArchivo, Tamanio, FechaCreacion, 
FechaUltimaModificacion, Eliminado) VALUES
(1, 'Informe Anual', 'pdf', 'Informe de resultados anuales', 1, 204800, '2021-03-15', '2021-03-16', 0),
(1, 'Foto de perfil', 'jpg', 'Imagen para perfil en la plataforma ', 2, 51200, '2022-01-10', '2022-01-10', 0),
(1, 'Backup Sistema', 'zip', 'Copia de seguridad del sistema', 4, 104857600, '2023-05-01', '2023-05-01', 1),
(2, 'Presentación Proyecto', 'pptx', 'Presentación del proyecto final', 8, 307200, '2020-07-22', '2020-07-22', 0),
(2, 'Reporte Financiero', 'xls', 'Reporte del estado financiero',7, 102400, '2022-12-05', '2022-12-06', 0),
(2, 'Diagrama de Red', 'png', 'Diagrama de la red interna', 18, 81920, '2021-09-15', '2021-09-15', 0),
(3, 'Manual de Usuario', 'pdf', 'Manual de uso del software', 1, 256000, '2021-11-10', '2021-11-11', 0),
(3, 'Informe de Ventas', 'xls', 'Informe de ventas del trimestre', 7, 76800, '2023-01-20', '2023-01-21', 0),
(4, 'Documento Legal', 'docx', 'Contrato legal revisado', 6, 51200, '2020-03-01', '2020-03-02', 0),
(4, 'Plan de Marketing', 'pptx', 'Plan de marketing para el nuevo producto', 8, 153600, '2022-10-10', '2022-10-11', 0),
(4, 'Presupuesto 2023', 'xls', 'Presupuesto Aprobado para 2023', 7, 128000, '2023-08-15', '2023-08-16', 0),
(4, 'Logo Empresa', 'png', 'Logo oficial de la empresa', 18, 102400, '2020-06-20', '2020-06-20', 1),
(5, 'Audio Conferencia', 'mp3', 'Grabacion de la conferencia anual', 15, 52428800, '2021-04-12', '2021-04-12', 0),
(5, 'Video Promocional', 'mp4', 'Video promocional del nuevo producto', 16, 104857600, '2023-02-14', '2023-02-14', 0),
(6, 'Guia de Estilo', 'docx', 'Guia de estilo para la empresa', 6, 40960, '2022-05-30', '2022-05-30', 0),
(6, 'Esquema de base de datos', 'pdf', 'Esquema detallado de la base de datos', 1, 102400, '2023-07-21', '2023-07-21', 0),
(7, 'Presentacion Producto', 'pptx', 'Presentacion de caracteristicas del nuevo producto', 8, 204800, '2021-08-15', '2021-08-15', 0),
(7, 'Analisis Competencia', 'docx', 'Analisis del mercado y competencia', 6, 61440, '2022-03-18', '2022-03-19', 0),
(8, 'Memorandum', 'docx', 'Memorandum para todo el personal', 6, 30720, '2023-11-10', '2023-11-10', 0),
(8, 'Propuesta Comercial', 'pdf', 'Propuesta comercial para el cliente', 1, 153600, '2021-04-05', '2021-04-06', 1),
(9, 'Plan Estrategico', 'xls', 'Plan estrategico para los proximos 5 años', 18, 256000, '2023-02-28', '2023-03-01', 0),
(9, 'Informe de sostenibilidad', 'pdf', 'Informe anual de sostenibilidad', 1, 204800, '2020-11-11', '2020-11-11', 0),
(9, 'Resumen Ejecutivo', 'docx', 'Resumen ejecutivo del informe anual', 6, 40960, '2021-12-20', '2021-12-21', 0),
(1, 'Backups Datos', 'zip', 'Copia de seguridad de los datos', 4, 209715200, '2024-01-01', '2022-01-02', 0),
(2, 'Esquema del proyecto', 'pdf', 'Esquema general del proyecto', 1, 102400, '2022-04-15', '2022-04-16', 0),
(3, 'Video Corporativo', 'mp4', 'Video de presentacion corporativa', 16, 157286400, '2023-06-05', '2023-06-05', 1),
(4, 'Documentacion de propuesta', 'docx', 'Propuesta enviada al cliente', 6, 61440, '2021-09-01', '2021-09-01', 0),
(5, 'Reporte de Uso', 'xls', 'Reporte de uso del recurso', 18, 122880, '2023-08-20', '2023-08-21', 0),
(6, 'Estudio de Mercado', 'pdf', 'Estudio de mercado para la nueva campaña', 1, 153600, '2022-06-22', '2022-06-23', 0),
(7, 'Modelo Financiero', 'xls', 'Modelo financiero para la nueva linea de negocio', 18, 204800, '2024-02-01', '2024-02-02', 0),
(8, 'Archivo de Codigo', 'zip', 'Codigo fuente del proyecto', 4, 104857600, '2023-03-30', '2023-03-31', 1),
(2, 'Documento Eliminado', 'docx', 'Archivo que fue eliminado', 6, 40960, '2021-07-15', '2021-07-15', 1),
(4, 'Imagen Vieja', 'png', 'Imagen que fue reemplazada', 18, 102400, '2022-09-10', '2022-09-10', 1),
(6, 'Archivo Descontinuado', 'pdf', 'Archivo que ya no se usa', 1, 153600, '2020-12-25', '2020-12-26', 1),
(8, 'Version Antigua', 'pptx', 'Version anterior de la presentacion', 8, 204800, '2023-05-15', '2023-05-16', 1);
GO
INSERT INTO ArchivosCompartidos (IdArchivo, IdUsuario, IdPermiso, FechaCompartido) VALUES
(1, 6, 1, '2022-05-11'),
(2, 7, 2, '2022-06-15'),
(3, 8, 3, '2023-01-12'),
(4, 9, 1, '2020-08-01'),
(5, 5, 4, '2023-09-20'),
(6, 6, 1, '2022-02-18'),
(7, 7, 3, '2021-10-05'),
(8, 8, 1, '2023-04-17'),
(9, 9, 2, '2020-04-25'),
(10, 1, 4, '2022-11-30'),
(11, 2, 1, '2021-06-22'),
(12, 3, 3, '2023-02-14'),
(13, 4, 2, '2020-01-19'),
(14, 6, 1, '2023-03-23'),
(15, 7, 4, '2022-07-29'),
(16, 7, 3, '2023-12-05'),
(17, 8, 1, '2021-09-16'),
(18, 9, 3, '2020-12-07'),
(18, 1, 4, '2024-02-28'),
(18, 10, 1, '2023-05-10');
GO
--2- Actualizar descripción de archivo eliminado:
--Cambiar la descripción del archivo llamado 'Documento Eliminado' a 'Archivo eliminado por
--el usuario'.
UPDATE Archivos SET Nombre = 'Archivo eliminado por el usuario' WHERE Nombre LIKE 'Documento Eliminado';

--3- Marcar como eliminados archivos viejos:
--Establecer Eliminado = 1 en los archivos cuya FechaCreacion sea anterior al '2021-01-01' y
--que aún no estén eliminados.
UPDATE Archivos SET Eliminado = 1 WHERE FechaCreacion < '2021-01-01';

--4- Eliminar un archivo ZIP del usuario 1:
--Eliminar un archivo ZIP del usuario con ID 1 (podés elegir cualquiera de ellos).
DELETE TOP(1) FROM Archivos WHERE Extension = 'zip' AND IdUsuarioDuenio = 1 AND Eliminado = 0;
--EN CASO QUE SEA BAJA LOGICA SERIA ASI:
UPDATE TOP(1) Archivos Set Eliminado = 1 WHERE Extension = 'zip' AND IdUsuarioDuenio = 1 AND Eliminado = 0;

--5- Asignar permiso de lectura:
--Insertar un nuevo permiso de Lectura para el usuario con ID = 10 sobre el archivo con ID = 1.
SELECT *  FROM ArchivosCompartidos WHERE IdUsuario = 10 ;
UPDATE ArchivosCompartidos SET IdArchivo = 1 , IdUsuario = 10,IdPermiso = 2,FechaCompartido = '2025-05-12' WHERE IdUsuario = 10 ;

--6- Eliminar archivos antiguos eliminados:
--Borrar archivos con Eliminado = 1 y FechaUltimaModificacion anterior al '2022-01-01'.
DELETE FROM Archivos WHERE Eliminado = 1 AND FechaUltimaModificacion < '2022-01-01';

--7. Corregir extensión de imagen:
--Cambiar la extensión 'jpg' por 'jpeg' en archivos cuyo tipo de archivo sea 'Imagen JPEG'.
UPDATE TiposArchivos SET TipoArchivo = 'Imagen JPEG' WHERE TipoArchivo LIKE 'Imagen JPG';

--8. Insertar archivo y compartirlo:
--Insertar un archivo nuevo en la tabla Archivos, y luego usar tres INSERT INTO para compartirlo
--con distintos usuarios (uno con Lectura, otro con Escritura y otro con Administrador).
INSERT INTO Archivos (IdUsuarioDuenio, Nombre, Extension, Descripcion, IDTipoArchivo, Tamanio, FechaCreacion, 
FechaUltimaModificacion, Eliminado) VALUES
(10, 'Informe Mensual', 'pdf', 'Informe de resultados mensuales', 2, 204800, '2024-06-05', '2024-06-05', 0);

Select * From Archivos WHERE IdUsuarioDuenio = 10 AND FechaCreacion = '2024-06-05';

INSERT INTO ArchivosCompartidos (IdArchivo, IdUsuario, IdPermiso, FechaCompartido) VALUES
(36,10,1,2024-06-05),
(36,10,3,2024-06-05),
(36,10,4,2024-06-05);

--9. Asignar permiso administrador a un usuario premium:
--Insertar un permiso de Administrador sobre el archivo con ID = 5 para un usuario con ID = 4.
SELECT A.IdArchivo, U.IdUsuario, A.IdPermiso, U.Apellido, U.Nombre, U.IdTipoUsuario FROM ArchivosCompartidos A 
INNER JOIN Usuarios U ON A.IdUsuario = u.IdUsuario WHERE IdArchivo = 5 AND U.IdUsuario = 4;
--REVISAR
SELECT * FROM Usuarios WHERE IdTipoUsuario = 4;

--10. Reemplazo de archivo eliminado:
--Borrar un archivo PPTX eliminado, y luego insertar uno nuevo con el mismo nombre seguido
--de '_v2', misma descripción y fecha actual.SELECT * FROM Archivos WHERE Extension LIKE '%PPTX%' AND Eliminado = 1;DELETE Archivos WHERE IdUsuarioDuenio = 8 AND IDTipoArchivo = 8 AND Eliminado = 1 ;INSERT INTO Archivos (IdUsuarioDuenio, Nombre, Extension, Descripcion, IDTipoArchivo, Tamanio, FechaCreacion, 
FechaUltimaModificacion, Eliminado) VALUES
(8, 'Version Antigua_v2', 'pptx', 'Version anterior de la presentacion', 2, 204800, '2023-05-15', '2023-05-15', 0);