-- Active: 1726172189649@@127.0.0.1@3306@proyectointegrador
USE ProyectoIntegrador;

-- Insert data into the Campus table
INSERT INTO Campus (Campus_id, Nombre) VALUES 
(1, 'Cumbaya'),
(2, 'Galapagos'),
(3, 'Estacion Tiputini');

-- Insertar los datos en la tabla Colegio
INSERT INTO Colegio (Colegio_id, Nombre, Abreviatura) VALUES
(1, 'Colegio de Administración de Empresas', 'CADE'),
(2, 'Colegio de Arquitectura y Diseño Interior', 'CADI'),
(3, 'Colegio de Ciencias Biológicas y Ambientales', 'COCIBA'),
(4, 'Colegio de Ciencias de la Salud', 'COCSA'),
(5, 'Colegio de Ciencias e Ingenierías', 'POLI'),
(6, 'Colegio de Ciencias Sociales y Humanidades', 'COCISOH'),
(7, 'Colegio de Comunicación y Artes Contemporáneas', 'COCOA'),
(8, 'Colegio de Economía', 'ECON'),
(9, 'Colegio de Hospitalidad, Arte Culinario y Turismo', 'CHAT'),
(10, 'Colegio de Jurisprudencia', 'JUR'),
(11, 'College of Music', 'COM');

INSERT INTO Dias (Dia_id, Abreviatura, Nombre) VALUES
(1, 'L', 'Lunes'),
(2, 'M', 'Martes'),
(3, 'I', 'Miércoles'),
(4, 'J', 'Jueves'),
(5, 'V', 'Viernes'),
(6, 'S', 'Sábado'),
(7, 'D', 'Domingo');

-- Insertar calificaciones en la tabla Notas
INSERT INTO Notas (Nota_id, Nota) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'F'),
(6, 'P');

-- Insertar edificios en la tabla Edificio
INSERT INTO Edificio (Edificio_id, Abreviatura, Nombre) VALUES
(1, 'MS', 'Miguel de Santiago'),
(2, 'A', 'Aristóteles'),
(3, 'S', 'Sócrates'),
(4, 'M', 'Mozart'),
(5, 'LZ', 'Lao Zi'),
(6, 'TM', 'Taller de metal'),
(7, 'H', 'Herbario'),
(8, 'CA', 'Coliseo Alexandros'),
(9, 'P', 'Pagoda'),
(10, 'G', 'Galileo'),
(11, 'N', 'Newton'),
(12, 'D', 'Darwin'),
(13, 'CB', 'Casa Blanca'),
(14, 'CT', 'La Casita Tomate'),
(15, 'CC', 'Casa Corona'),
(16, 'MX', 'Maxwell'),
(17, 'CO', 'Clínica Odontológica'),
(18, 'DV', 'Da Vinci'),
(19, 'C', 'Cicerón'),
(20, 'E', 'Einstein'),
(21, 'EE', 'Eugenio Espejo'),
(22, 'EP', 'Epicuro');

-- Insertar datos en la tabla Carrera
INSERT INTO Carrera (Carrera_id, Colegio_id, Abreviatura, Nombre) VALUES
(1, 1, 'AE', 'Administracion de Empresas'),
(2, 1, 'AE-G', 'Administracion de Empresas (Galapagos)'),
(3, 7, 'AD', 'Animacion Digital'),
(4, 6, 'ANT', 'Antropologia'),
(5, 2, 'ARQ', 'Arquitectura'),
(6, 6, 'AL', 'Artes Liberales'),
(7, 7, 'AV', 'Artes Visuales'),
(8, 7, 'AV-DM', 'Artes Visuales: Diseno de modas'),
(9, 3, 'BIO', 'Biologia'),
(10, 3, 'BIO-T', 'Biotecnologia'),
(11, 6, 'CP', 'Ciencias Politicas'),
(12, 7, 'CINE', 'Cine'),
(13, 11, 'CMC', 'Composicion para Medios Contemporaneos'),
(14, 7, 'COM', 'Comunicacion'),
(15, 10, 'DER', 'Derecho'),
(16, 2, 'DI', 'Diseno de Interiores'),
(17, 7, 'DMI', 'Diseno de Medios Interactivos'),
(18, 7, 'DGC', 'Diseno Grafico: Diseno Comunicacional'),
(19, 8, 'ECO', 'Economia'),
(20, 6, 'EDU', 'Educacion'),
(21, 11, 'EMC', 'Ejecucion de Musica Contemporanea'),
(22, 1, 'FIN', 'Finanzas'),
(23, 5, 'FIS', 'Fisica'),
(24, 9, 'GAST', 'Gastronomia'),
(25, 3, 'GA-G', 'Gestion Ambiental (Galapagos)'),
(26, 9, 'HH', 'Hospitalidad y Hoteleria'),
(27, 5, 'IA', 'Ingenieria Ambiental'),
(28, 5, 'IC', 'Ingenieria Civil'),
(29, 5, 'IA-A', 'Ingenieria en Agronomia'),
(30, 5, 'IA-F', 'Ingenieria en Alimentos'),
(31, 5, 'IA-CC', 'Ingenieria en Ciencias de la Computacion'),
(32, 5, 'IA-EA', 'Ingenieria en Electronica y Automatizacion'),
(33, 5, 'IA-MAC', 'Ingenieria en Matematicas Aplicadas y Computacion (MAC)'),
(34, 5, 'II', 'Ingenieria Industrial'),
(35, 5, 'IM', 'Ingenieria Mecanica'),
(36, 5, 'IQ', 'Ingenieria Quimica'),
(37, 1, 'MARK', 'Marketing'),
(38, 5, 'MAT', 'Matematica'),
(39, 4, 'MED', 'Medicina'),
(40, 4, 'MV', 'Medicina Veterinaria'),
(41, 4, 'ND', 'Nutricion y Dietetica'),
(42, 4, 'OD', 'Odontologia'),
(43, 7, 'PER', 'Periodismo'),
(44, 11, 'PM', 'Produccion Musical'),
(45, 6, 'PSI', 'Psicologia'),
(46, 6, 'PSIC', 'Psicologia Clinica'),
(47, 7, 'PUB', 'Publicidad'),
(48, 6, 'RI', 'Relaciones Internacionales');
