-- Active: 1726172189649@@127.0.0.1@3306@proyectointegrador
DROP DATABASE IF EXISTS ProyectoIntegrador;
#BD LOGROS COLECCIONABLES
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS ProyectoIntegrador;
USE ProyectoIntegrador;

-- Eliminar la tabla Colegio si ya existe
DROP TABLE IF EXISTS Colegio;

-- Crear la tabla Colegio
CREATE TABLE Colegio (
    Colegio_id INT PRIMARY KEY,  -- Identificador único del colegio
    Nombre VARCHAR(255) NOT NULL    -- Nombre del colegio (POLI, COCOA, etc.)
);

-- Eliminar la tabla KeyWords si ya existe
DROP TABLE IF EXISTS KeyWords;

-- Crear la tabla KeyWords
CREATE TABLE KeyWords (
    Keyword_id INT PRIMARY KEY,  -- Identificador único de la palabra clave
    Palabra VARCHAR(255) NOT NULL   -- Palabra clave que el estudiante puede elegir
);

-- Eliminar la tabla Semestre si ya existe
DROP TABLE IF EXISTS Semestre;

-- Crear la tabla Semestre
CREATE TABLE Semestre (
    Semestre_id INT PRIMARY KEY,  -- Identificador único del semestre
    Nombre VARCHAR(255) NOT NULL     -- Nombre del semestre (por ejemplo: "Primer Semestre")
);

-- Eliminar la tabla Notas si ya existe
DROP TABLE IF EXISTS Notas;

-- Crear la tabla Notas
CREATE TABLE Notas (
    Nota_id INT PRIMARY KEY,  -- Identificador único de la calificación
    Nota VARCHAR(10) NOT NULL    -- Calificación (por ejemplo: A, B, C, etc.)
);

-- Eliminar la tabla Categoria si ya existe
DROP TABLE IF EXISTS Categoria;

-- Crear la tabla Categoria
CREATE TABLE Categoria (
    Categoria_id INT PRIMARY KEY,  -- Identificador único de la categoría
    Nombre VARCHAR(255) NOT NULL      -- Nombre de la categoría (Arte, Deporte, Inglés, etc.)
);

-- Eliminar la tabla Profesor si ya existe
DROP TABLE IF EXISTS Profesor;

-- Crear la tabla Profesor
CREATE TABLE Profesor (
    Profesor_id INT PRIMARY KEY,  -- Identificador único del profesor
    Nombre VARCHAR(255) NOT NULL,    -- Nombre del profesor
    Correo VARCHAR(255)              -- Correo del profesor
);

-- Eliminar la tabla Dias si ya existe
DROP TABLE IF EXISTS Dias;

-- Crear la tabla Dias
CREATE TABLE Dias (
    Dia_id INT PRIMARY KEY,       -- Identificador único del día
    Abreviatura CHAR(1) NOT NULL,    -- Abreviatura del día (L, M, I, J, V, S, D)
    Nombre VARCHAR(50) NOT NULL      -- Nombre completo del día
);

-- Eliminar la tabla Horario si ya existe
DROP TABLE IF EXISTS Horario;

-- Crear la tabla Horario
CREATE TABLE Horario (
    Horario_id INT PRIMARY KEY,   -- Identificador único del horario
    Hora VARCHAR(20) NOT NULL        -- Intervalo de tiempo (por ejemplo: '10:00-11:20')
);

-- Eliminar la tabla Edificio si ya existe
DROP TABLE IF EXISTS Edificio;

-- Crear la tabla Edificio
CREATE TABLE Edificio (
    Edificio_id INT PRIMARY KEY,  -- Identificador único del edificio
    Abreviatura CHAR(2) NOT NULL,    -- Abreviatura del edificio (G, M, DW, etc.)
    Nombre VARCHAR(255) NOT NULL     -- Nombre completo del edificio
);

-- Eliminar la tabla Modalidad si ya existe
DROP TABLE IF EXISTS Modalidad;

-- Crear la tabla Modalidad
CREATE TABLE Modalidad (
    Modalidad_id INT PRIMARY KEY,  -- Identificador único de la modalidad
    Nombre VARCHAR(255) NOT NULL      -- Nombre de la modalidad (por ejemplo: "Presencial", "Virtual", etc.)
);

-- Eliminar la tabla Carrera si ya existe
DROP TABLE IF EXISTS Carrera;

-- Crear la tabla Carrera
CREATE TABLE Carrera (
    Carrera_id INT PRIMARY KEY,      -- Identificador único de la carrera
    Colegio_id INT,                     -- FK del colegio al que pertenece
    Abreviatura VARCHAR(10) NOT NULL,   -- Abreviatura de la carrera (ejemplo: CMP)
    Nombre VARCHAR(255) NOT NULL,       -- Nombre de la carrera
    FOREIGN KEY (Colegio_id) REFERENCES Colegio(Colegio_id)
);

-- Eliminar la tabla SubEspecializacion si ya existe
DROP TABLE IF EXISTS SubEspecializacion;

-- Crear la tabla SubEspecializacion
CREATE TABLE SubEspecializacion (
    SubEsp_id INT PRIMARY KEY,        -- Identificador único de la subespecialización (minor)
    Colegio_id INT,					  -- FK del colegio al que pertenece
    Nombre VARCHAR(255) NOT NULL,         -- Nombre del minor
    FOREIGN KEY (Colegio_id)  REFERENCES Colegio(Colegio_id)
);

-- Eliminar la tabla Estudiante si ya existe
DROP TABLE IF EXISTS Estudiante;

-- Crear la tabla Estudiante
CREATE TABLE Estudiante (
    Estudiante_id INT PRIMARY KEY,   -- Identificador único del estudiante (código banner)
    Nombres VARCHAR(255) NOT NULL,      -- Nombres del estudiante
    Apellidos VARCHAR(255) NOT NULL,    -- Apellidos del estudiante
    Correo VARCHAR(255) NOT NULL,       -- Correo institucional
    Contraseña VARCHAR(255) NOT NULL,   -- Contraseña del estudiante
    Carrera_id INT NOT NULL, 
    Semestre_id INT NOT NULL,
    SubEsp_id INT NULL,
    FOREIGN KEY (Carrera_id) REFERENCES Carrera(Carrera_id),  -- FK de la carrera que sigue el estudiante
    FOREIGN KEY (Semestre_id) REFERENCES Semestre(Semestre_id),  -- FK del semestre en el que se encuentra
    FOREIGN KEY (SubEsp_id) REFERENCES SubEspecializacion(SubEsp_id)  -- FK opcional del minor (puede ser NULL)
);

-- Eliminar la tabla Palabra_Estudiante si ya existe
DROP TABLE IF EXISTS Palabra_Estudiante;

-- Crear la tabla Palabra_Estudiante
CREATE TABLE Palabra_Estudiante (
	Keyword_id INT NOT NULL,
    Estudiante_id INT NOT NULL,
    FOREIGN KEY (Keyword_id) REFERENCES KeyWords(Keyword_id),   -- Identificador de la palabra clave (FK)
    FOREIGN KEY (Estudiante_id) REFERENCES Estudiante(Estudiante_id),  -- Identificador del estudiante (FK)
    PRIMARY KEY (Keyword_id, Estudiante_id)  -- Combinación única de Keyword_id y Estudiante_id
);

-- Eliminar la tabla Asignatura si ya existe
DROP TABLE IF EXISTS Asignatura;

-- Crear la tabla Asignatura
CREATE TABLE Asignatura (
    Asignatura_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Identificador de la asignatura
    Nombre VARCHAR(255) NOT NULL,                          -- Nombre de la asignatura
    Descripcion TEXT,                                     -- Descripción de la asignatura
    Carrera_id INT NOT NULL,                               -- FK, identificador de la carrera a la que pertenece la asignatura
    Categoria_id INT NOT NULL,                             -- FK, categoría a la que pertenece la asignatura
    Nota_id INT NOT NULL,                                 -- FK, nota mínima para pasar
    Numero VARCHAR(20) NOT NULL,                           -- Número de curso para la carrera (por ejemplo CMP-1001)
    Creditos INT NOT NULL,                                -- Créditos que tiene la asignatura
    FOREIGN KEY (Carrera_id) REFERENCES Carrera(Carrera_id),  -- FK que referencia a Carrera
    FOREIGN KEY (Categoria_id) REFERENCES Categoria(Categoria_id),  -- FK que referencia a Categoria
    FOREIGN KEY (Nota_id) REFERENCES Notas(Nota_id)        -- FK que referencia a Notas
);

-- Eliminar la tabla Malla_Subespecializacion si ya existe
DROP TABLE IF EXISTS Malla_Subespecializacion;

-- Crear la tabla Malla_Subespecializacion
CREATE TABLE Malla_Subespecializacion (
    MallaSubEsp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Identificador de la malla del minor
    SubEsp_id INT NOT NULL,                                  -- FK del minor
    FOREIGN KEY (SubEsp_id) REFERENCES SubEspecializacion(SubEsp_id)  -- FK que referencia a SubEspecializacion
);

-- Eliminar la tabla MallaSubEsp_Asignatura si ya existe
DROP TABLE IF EXISTS MallaSubEsp_Asignatura;

-- Crear la tabla MallaSubEsp_Asignatura
CREATE TABLE MallaSubEsp_Asignatura (
    MallaSubEsp_id INT NOT NULL,                             -- FK, PK, Identificador de la malla del minor
    Asignatura_id INT NOT NULL,                              -- PK, FK, Identificador de la asignatura
    PRIMARY KEY (MallaSubEsp_id, Asignatura_id),             -- Clave primaria compuesta
    FOREIGN KEY (MallaSubEsp_id) REFERENCES Malla_Subespecializacion(MallaSubEsp_id),  -- FK que referencia a Malla_Subespecializacion
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id)    -- FK que referencia a Asignatura
);

-- Eliminar la tabla Malla_Carrera si ya existe
DROP TABLE IF EXISTS Malla_Carrera;

-- Crear la tabla Malla_Carrera
CREATE TABLE Malla_Carrera (
    MallaCarrera_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Identificador de la malla de la carrera
    Carrera_id INT NOT NULL,                                  -- FK de la carrera
    FOREIGN KEY (Carrera_id) REFERENCES Carrera(Carrera_id)  -- FK que referencia a Carrera
);

-- Eliminar la tabla MallaCarreraAsignatura si ya existe
DROP TABLE IF EXISTS MallaCarreraAsignatura;

-- Crear la tabla MallaCarreraAsignatura
CREATE TABLE MallaCarreraAsignatura (
    MallaCarrera_id INT NOT NULL,                             -- FK, PK, Identificador de la malla de una carrera
    Asignatura_id INT NOT NULL,                              -- PK, FK, Identificador de la asignatura
    Semestre_id INT NOT NULL,                                -- FK, identificador del semestre al que pertenece la asignatura
    PRIMARY KEY (MallaCarrera_id, Asignatura_id),             -- Clave primaria compuesta
    FOREIGN KEY (MallaCarrera_id) REFERENCES Malla_Carrera(MallaCarrera_id),  -- FK que referencia a Malla_Carrera
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id),    -- FK que referencia a Asignatura
    FOREIGN KEY (Semestre_id) REFERENCES Semestre(Semestre_id)  -- FK que referencia a Semestre
);

-- Eliminar la tabla Campus si ya existe
DROP TABLE IF EXISTS Campus;

-- Crear la tabla Campus
CREATE TABLE Campus (
    Campus_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Identificador del campus
    Nombre VARCHAR(255) NOT NULL                        -- Nombre del campus
);

-- Eliminar la tabla Kardex si ya existe
DROP TABLE IF EXISTS Kardex;

-- Crear la tabla Kardex
CREATE TABLE Kardex (
    Kardex_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Identificador del kardex
    Estudiante_id INT NOT NULL,                        -- FK del estudiante al que pertenece el kardex
    FOREIGN KEY (Estudiante_id) REFERENCES Estudiante(Estudiante_id)  -- FK referencia a la tabla Estudiante
);


-- Eliminar la tabla Kardex_Asignatura si ya existe
DROP TABLE IF EXISTS Kardex_Asignatura;

-- Crear la tabla Kardex_Asignatura
CREATE TABLE Kardex_Asignatura (
    Kardex_id INT NOT NULL,                         -- FK identificador del kardex del estudiante
    Asignatura_id INT NOT NULL,                     -- FK identificador de la asignatura
    Nota_id INT NOT NULL,                           -- FK identificador de la nota obtenida en esa asignatura
    FOREIGN KEY (Kardex_id) REFERENCES Kardex(Kardex_id),  -- FK referencia a la tabla Kardex
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id),  -- FK referencia a la tabla Asignatura
    FOREIGN KEY (Nota_id) REFERENCES Notas(Nota_id),  -- FK referencia a la tabla Notas
    PRIMARY KEY (Kardex_id, Asignatura_id)           -- Combinación única de Kardex_id y Asignatura_id
);

-- Eliminar la tabla Curso si ya existe
DROP TABLE IF EXISTS Curso;

-- Crear la tabla Curso
CREATE TABLE Curso (
    Curso_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,   -- Identificador del curso (NRC)
    Asignatura_id INT NOT NULL,                         -- FK Asignatura a la que pertenece el curso
    Profesor_id INT NOT NULL,                           -- FK Profesor que dicta el curso
    Horario_id INT NOT NULL,                            -- FK Horario en el que se dicta el curso
    Campus_id INT NOT NULL,                             -- FK Campus donde se dicta el curso
    Modalidad_id INT NOT NULL,                          -- FK Modalidad en la que se dicta el curso
    Edificio_id INT NOT NULL,                           -- FK Edificio en el que se dicta el curso
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id),  -- FK referencia a la tabla Asignatura
    FOREIGN KEY (Profesor_id) REFERENCES Profesor(Profesor_id),        -- FK referencia a la tabla Profesor
    FOREIGN KEY (Horario_id) REFERENCES Horario(Horario_id),           -- FK referencia a la tabla Horario
    FOREIGN KEY (Campus_id) REFERENCES Campus(Campus_id),              -- FK referencia a la tabla Campus
    FOREIGN KEY (Modalidad_id) REFERENCES Modalidad(Modalidad_id),     -- FK referencia a la tabla Modalidad
    FOREIGN KEY (Edificio_id) REFERENCES Edificio(Edificio_id)         -- FK referencia a la tabla Edificio
);

-- Eliminar la tabla Dias_Asignatura si ya existe
DROP TABLE IF EXISTS Dias_Asignatura;

-- Crear la tabla Dias_Asignatura
CREATE TABLE Dias_Asignatura (
    Curso_id INT NOT NULL,      -- Identificador del curso (FK)
    Dia_id INT NOT NULL,        -- Identificador del día (FK)
    PRIMARY KEY (Curso_id, Dia_id),  -- Combinación única de Curso_id y Dia_id
    FOREIGN KEY (Curso_id) REFERENCES Curso(Curso_id),   -- FK referencia a la tabla Curso
    FOREIGN KEY (Dia_id) REFERENCES Dias(Dia_id)         -- FK referencia a la tabla Dias
);

-- Eliminar la tabla Prerrequisito si ya existe
DROP TABLE IF EXISTS Prerrequisito;

-- Crear la tabla Prerrequisito
CREATE TABLE Prerrequisito (
    Asignatura_id INT NOT NULL,   -- Asignatura que tiene un prerrequisito (FK)
    Prerrequisito_id INT NOT NULL, -- Asignatura que es el prerrequisito (FK)
    Identificador INT NOT NULL,   -- Identificador para agrupar prerrequisitos (PK)
    PRIMARY KEY (Asignatura_id, Prerrequisito_id, Identificador), -- Combinación única
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id),  -- FK referencia a la asignatura
    FOREIGN KEY (Prerrequisito_id) REFERENCES Asignatura(Asignatura_id) -- FK referencia al prerrequisito
);

-- Eliminar la tabla Correquisito si ya existe
DROP TABLE IF EXISTS Correquisito;

-- Crear la tabla Correquisito
CREATE TABLE Correquisito (
    Asignatura_id INT NOT NULL,       -- Asignatura que tiene un correquisito (FK)
    Correquisito_id INT NOT NULL,     -- Asignatura que es correquisito (FK)
    PRIMARY KEY (Asignatura_id, Correquisito_id), -- Combinación única
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id),  -- FK referencia a la asignatura
    FOREIGN KEY (Correquisito_id) REFERENCES Asignatura(Asignatura_id) -- FK referencia al correquisito
);

-- Eliminar la tabla Restricciones si ya existe
DROP TABLE IF EXISTS Restricciones;

-- Crear la tabla Restricciones
CREATE TABLE Restricciones (
    Restriccion_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único de la restricción
    Asignatura_id INT NOT NULL,                     -- FK, Asignatura a la cual pertenecen las restricciones
    Carrera_id INT NULL,                            -- FK opcional, carrera que se restringe
    Colegio_id INT NULL,                            -- FK opcional, colegio que se restringe
    Semestre_id INT NULL,                           -- FK opcional, desde qué semestre se aplica la restricción
    FOREIGN KEY (Asignatura_id) REFERENCES Asignatura(Asignatura_id),  -- FK a la tabla Asignatura
    FOREIGN KEY (Carrera_id) REFERENCES Carrera(Carrera_id),           -- FK opcional a la tabla Carrera
    FOREIGN KEY (Colegio_id) REFERENCES Colegio(Colegio_id),           -- FK opcional a la tabla Colegio
    FOREIGN KEY (Semestre_id) REFERENCES Semestre(Semestre_id)         -- FK opcional a la tabla Semestre
); 
