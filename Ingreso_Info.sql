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
-- Insertar edificios en la tabla Edificio con nuevas abreviaturas
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

