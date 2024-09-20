CREATE TRIGGER after_colegio_insert
AFTER INSERT ON Colegio
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Colegio', CONCAT('Se insertó el colegio: ', NEW.Nombre, ' (ID: ', NEW.Colegio_id, ')'));
END;
CREATE TRIGGER after_colegio_update
AFTER UPDATE ON Colegio
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Colegio', CONCAT('Se actualizó el colegio: ', OLD.Nombre, ' (ID: ', OLD.Colegio_id, ') a ', NEW.Nombre));
END;
CREATE TRIGGER after_colegio_delete
AFTER DELETE ON Colegio
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Colegio', CONCAT('Se eliminó el colegio: ', OLD.Nombre, ' (ID: ', OLD.Colegio_id, ')'));
END;
CREATE TRIGGER after_keywords_insert
AFTER INSERT ON KeyWords
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'KeyWords', CONCAT('Se insertó la palabra clave: ', NEW.Palabra, ' (ID: ', NEW.Keyword_id, ')'));
END;
CREATE TRIGGER after_keywords_update
AFTER UPDATE ON KeyWords
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'KeyWords', CONCAT('Se actualizó la palabra clave: ', OLD.Palabra, ' (ID: ', OLD.Keyword_id, ') a ', NEW.Palabra));
END;
CREATE TRIGGER after_keywords_delete
AFTER DELETE ON KeyWords
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'KeyWords', CONCAT('Se eliminó la palabra clave: ', OLD.Palabra, ' (ID: ', OLD.Keyword_id, ')'));
END;
CREATE TRIGGER after_semestre_insert
AFTER INSERT ON Semestre
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Semestre', CONCAT('Se insertó el semestre: ', NEW.Nombre, ' (ID: ', NEW.Semestre_id, ')'));
END;
CREATE TRIGGER after_semestre_update
AFTER UPDATE ON Semestre
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Semestre', CONCAT('Se actualizó el semestre: ', OLD.Nombre, ' (ID: ', OLD.Semestre_id, ') a ', NEW.Nombre));
END;
CREATE TRIGGER after_semestre_delete
AFTER DELETE ON Semestre
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Semestre', CONCAT('Se eliminó el semestre: ', OLD.Nombre, ' (ID: ', OLD.Semestre_id, ')'));
END;
CREATE TRIGGER after_notas_insert
AFTER INSERT ON Notas
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Notas', CONCAT('Se insertó la nota: ', NEW.Nota, ' (ID: ', NEW.Nota_id, ')'));
END;
CREATE TRIGGER after_notas_update
AFTER UPDATE ON Notas
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Notas', CONCAT('Se actualizó la nota: ', OLD.Nota, ' (ID: ', OLD.Nota_id, ') a ', NEW.Nota));
END;
CREATE TRIGGER after_notas_delete
AFTER DELETE ON Notas
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Notas', CONCAT('Se eliminó la nota: ', OLD.Nota, ' (ID: ', OLD.Nota_id, ')'));
END;
CREATE TRIGGER after_categoria_insert
AFTER INSERT ON Categoria
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Categoria', CONCAT('Se insertó la categoría: ', NEW.Nombre, ' (ID: ', NEW.Categoria_id, ')'));
END;
CREATE TRIGGER after_categoria_delete
AFTER DELETE ON Categoria
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Categoria', CONCAT('Se eliminó la categoría: ', OLD.Nombre, ' (ID: ', OLD.Categoria_id, ')'));
END;
CREATE TRIGGER after_categoria_update
AFTER UPDATE ON Categoria
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Categoria', CONCAT('Se actualizó la categoría: ', OLD.Nombre, ' (ID: ', OLD.Categoria_id, ') a ', NEW.Nombre));
END;
-- Trigger para registrar inserciones en la tabla Profesor
CREATE TRIGGER after_profesor_insert
AFTER INSERT ON Profesor
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Profesor', CONCAT('Se insertó el profesor: ', NEW.Nombre, ' (ID: ', NEW.Profesor_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Profesor
CREATE TRIGGER after_profesor_update
AFTER UPDATE ON Profesor
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Profesor', CONCAT('Se actualizó el profesor: ', OLD.Nombre, ' (ID: ', OLD.Profesor_id, ') a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Profesor
CREATE TRIGGER after_profesor_delete
AFTER DELETE ON Profesor
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Profesor', CONCAT('Se eliminó el profesor: ', OLD.Nombre, ' (ID: ', OLD.Profesor_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Dias
CREATE TRIGGER after_dias_insert
AFTER INSERT ON Dias
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Dias', CONCAT('Se insertó el día: ', NEW.Nombre, ' (ID: ', NEW.Dia_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Dias
CREATE TRIGGER after_dias_update
AFTER UPDATE ON Dias
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Dias', CONCAT('Se actualizó el día: ', OLD.Nombre, ' (ID: ', OLD.Dia_id, ') a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Dias
CREATE TRIGGER after_dias_delete
AFTER DELETE ON Dias
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Dias', CONCAT('Se eliminó el día: ', OLD.Nombre, ' (ID: ', OLD.Dia_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Horario
CREATE TRIGGER after_horario_insert
AFTER INSERT ON Horario
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Horario', CONCAT('Se insertó el horario: ', NEW.Hora, ' (ID: ', NEW.Horario_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Horario
CREATE TRIGGER after_horario_update
AFTER UPDATE ON Horario
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Horario', CONCAT('Se actualizó el horario: ', OLD.Hora, ' (ID: ', OLD.Horario_id, ') a ', NEW.Hora));
END;

-- Trigger para registrar eliminaciones en la tabla Horario
CREATE TRIGGER after_horario_delete
AFTER DELETE ON Horario
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Horario', CONCAT('Se eliminó el horario: ', OLD.Hora, ' (ID: ', OLD.Horario_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Edificio
CREATE TRIGGER after_edificio_insert
AFTER INSERT ON Edificio
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Edificio', CONCAT('Se insertó el edificio: ', NEW.Nombre, ' (ID: ', NEW.Edificio_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Edificio
CREATE TRIGGER after_edificio_update
AFTER UPDATE ON Edificio
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Edificio', CONCAT('Se actualizó el edificio: ', OLD.Nombre, ' (ID: ', OLD.Edificio_id, ') a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Edificio
CREATE TRIGGER after_edificio_delete
AFTER DELETE ON Edificio
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Edificio', CONCAT('Se eliminó el edificio: ', OLD.Nombre, ' (ID: ', OLD.Edificio_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Modalidad
CREATE TRIGGER after_modalidad_insert
AFTER INSERT ON Modalidad
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Modalidad', CONCAT('Se insertó la modalidad: ', NEW.Nombre, ' (ID: ', NEW.Modalidad_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Modalidad
CREATE TRIGGER after_modalidad_update
AFTER UPDATE ON Modalidad
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Modalidad', CONCAT('Se actualizó la modalidad: ', OLD.Nombre, ' (ID: ', OLD.Modalidad_id, ') a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Modalidad
CREATE TRIGGER after_modalidad_delete
AFTER DELETE ON Modalidad
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Modalidad', CONCAT('Se eliminó la modalidad: ', OLD.Nombre, ' (ID: ', OLD.Modalidad_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Carrera
CREATE TRIGGER after_carrera_insert
AFTER INSERT ON Carrera
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Carrera', CONCAT('Se insertó la carrera: ', NEW.Nombre, ' (ID: ', NEW.Carrera_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Carrera
CREATE TRIGGER after_carrera_update
AFTER UPDATE ON Carrera
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Carrera', CONCAT('Se actualizó la carrera: ', OLD.Nombre, ' (ID: ', OLD.Carrera_id, ') a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Carrera
CREATE TRIGGER after_carrera_delete
AFTER DELETE ON Carrera
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Carrera', CONCAT('Se eliminó la carrera: ', OLD.Nombre, ' (ID: ', OLD.Carrera_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla SubEspecializacion
CREATE TRIGGER after_subespecializacion_insert
AFTER INSERT ON SubEspecializacion
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'SubEspecializacion', CONCAT('Se insertó la subespecialización: ', NEW.Nombre, ' (ID: ', NEW.SubEsp_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla SubEspecializacion
CREATE TRIGGER after_subespecializacion_update
AFTER UPDATE ON SubEspecializacion
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'SubEspecializacion', CONCAT('Se actualizó la subespecialización: ', OLD.Nombre, ' (ID: ', OLD.SubEsp_id, ') a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla SubEspecializacion
CREATE TRIGGER after_subespecializacion_delete
AFTER DELETE ON SubEspecializacion
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'SubEspecializacion', CONCAT('Se eliminó la subespecialización: ', OLD.Nombre, ' (ID: ', OLD.SubEsp_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Estudiante
CREATE TRIGGER after_estudiante_insert
AFTER INSERT ON Estudiante
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Estudiante', CONCAT('Se insertó el estudiante: ', NEW.Nombres, ' ', NEW.Apellidos, ' (ID: ', NEW.Estudiante_id, ')'));
END;

-- Trigger para registrar actualizaciones en la tabla Estudiante
CREATE TRIGGER after_estudiante_update
AFTER UPDATE ON Estudiante
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Estudiante', CONCAT('Se actualizó el estudiante: ', OLD.Nombres, ' ', OLD.Apellidos, ' (ID: ', OLD.Estudiante_id, ') a ', NEW.Nombres, ' ', NEW.Apellidos));
END;

-- Trigger para registrar eliminaciones en la tabla Estudiante
CREATE TRIGGER after_estudiante_delete
AFTER DELETE ON Estudiante
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Estudiante', CONCAT('Se eliminó el estudiante: ', OLD.Nombres, ' ', OLD.Apellidos, ' (ID: ', OLD.Estudiante_id, ')'));
END;
-- Trigger para registrar inserciones en la tabla Palabra_Estudiante
CREATE TRIGGER after_palabra_estudiante_insert
AFTER INSERT ON Palabra_Estudiante
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Palabra_Estudiante', CONCAT('Se insertó la relación de palabra clave: ', NEW.Keyword_id, ' con el estudiante ID: ', NEW.Estudiante_id));
END;

-- Trigger para registrar actualizaciones en la tabla Palabra_Estudiante
CREATE TRIGGER after_palabra_estudiante_update
AFTER UPDATE ON Palabra_Estudiante
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Palabra_Estudiante', CONCAT('Se actualizó la relación de palabra clave: ', OLD.Keyword_id, ' con el estudiante ID: ', OLD.Estudiante_id, ' a ', NEW.Keyword_id));
END;

-- Trigger para registrar eliminaciones en la tabla Palabra_Estudiante
CREATE TRIGGER after_palabra_estudiante_delete
AFTER DELETE ON Palabra_Estudiante
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Palabra_Estudiante', CONCAT('Se eliminó la relación de palabra clave: ', OLD.Keyword_id, ' con el estudiante ID: ', OLD.Estudiante_id));
END;
-- Trigger para registrar inserciones en la tabla Asignatura
CREATE TRIGGER after_asignatura_insert
AFTER INSERT ON Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Asignatura', CONCAT('Se insertó la asignatura: ', NEW.Nombre, ' con ID: ', NEW.Asignatura_id));
END;

-- Trigger para registrar actualizaciones en la tabla Asignatura
CREATE TRIGGER after_asignatura_update
AFTER UPDATE ON Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Asignatura', CONCAT('Se actualizó la asignatura: ', OLD.Nombre, ' con ID: ', OLD.Asignatura_id, ' a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Asignatura
CREATE TRIGGER after_asignatura_delete
AFTER DELETE ON Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Asignatura', CONCAT('Se eliminó la asignatura: ', OLD.Nombre, ' con ID: ', OLD.Asignatura_id));
END;
-- Trigger para registrar inserciones en la tabla Prerrequisito
CREATE TRIGGER after_prerrequisito_insert
AFTER INSERT ON Prerrequisito
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Prerrequisito', CONCAT('Se insertó el prerrequisito: Asignatura ID ', NEW.Asignatura_id, ' depende de Asignatura ID ', NEW.Dependencia_id));
END;

-- Trigger para registrar actualizaciones en la tabla Prerrequisito
CREATE TRIGGER after_prerrequisito_update
AFTER UPDATE ON Prerrequisito
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Prerrequisito', CONCAT('Se actualizó el prerrequisito: Asignatura ID ', OLD.Asignatura_id, ' ahora depende de Asignatura ID ', NEW.Dependencia_id));
END;

-- Trigger para registrar eliminaciones en la tabla Prerrequisito
CREATE TRIGGER after_prerrequisito_delete
AFTER DELETE ON Prerrequisito
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Prerrequisito', CONCAT('Se eliminó el prerrequisito: Asignatura ID ', OLD.Asignatura_id, ' que dependía de Asignatura ID ', OLD.Dependencia_id));
END;
-- Trigger para registrar inserciones en la tabla Malla_Subespecializacion
CREATE TRIGGER after_malla_subespecializacion_insert
AFTER INSERT ON Malla_Subespecializacion
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Subespecializacion', CONCAT('Se insertó la malla del minor con ID ', NEW.MallaSubEsp_id, ' para el minor ID ', NEW.SubEsp_id));
END;

-- Trigger para registrar actualizaciones en la tabla Malla_Subespecializacion
CREATE TRIGGER after_malla_subespecializacion_update
AFTER UPDATE ON Malla_Subespecializacion
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Subespecializacion', CONCAT('Se actualizó la malla del minor con ID ', OLD.MallaSubEsp_id, ' para el minor ID ', NEW.SubEsp_id));
END;

-- Trigger para registrar eliminaciones en la tabla Malla_Subespecializacion
CREATE TRIGGER after_malla_subespecializacion_delete
AFTER DELETE ON Malla_Subespecializacion
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Subespecializacion', CONCAT('Se eliminó la malla del minor con ID ', OLD.MallaSubEsp_id));
END;
-- Trigger para registrar inserciones en la tabla MallaSubEsp_Asignatura
CREATE TRIGGER after_mallasubesp_asignatura_insert
AFTER INSERT ON MallaSubEsp_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'MallaSubEsp_Asignatura', CONCAT('Se insertó la asignatura con ID ', NEW.Asignatura_id, ' en la malla del minor ID ', NEW.MallaSubEsp_id));
END;

-- Trigger para registrar actualizaciones en la tabla MallaSubEsp_Asignatura
CREATE TRIGGER after_mallasubesp_asignatura_update
AFTER UPDATE ON MallaSubEsp_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'MallaSubEsp_Asignatura', CONCAT('Se actualizó la asignatura con ID ', OLD.Asignatura_id, ' en la malla del minor ID ', NEW.MallaSubEsp_id));
END;

-- Trigger para registrar eliminaciones en la tabla MallaSubEsp_Asignatura
CREATE TRIGGER after_mallasubesp_asignatura_delete
AFTER DELETE ON MallaSubEsp_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'MallaSubEsp_Asignatura', CONCAT('Se eliminó la asignatura con ID ', OLD.Asignatura_id, ' de la malla del minor ID ', OLD.MallaSubEsp_id));
END;
-- Trigger para registrar inserciones en la tabla Malla_Carrera
CREATE TRIGGER after_malla_carrera_insert
AFTER INSERT ON Malla_Carrera
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Carrera', CONCAT('Se insertó la malla de carrera con ID ', NEW.MallaCarrera_id, ' para la carrera ID ', NEW.Carrera_id));
END;

-- Trigger para registrar actualizaciones en la tabla Malla_Carrera
CREATE TRIGGER after_malla_carrera_update
AFTER UPDATE ON Malla_Carrera
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Carrera', CONCAT('Se actualizó la malla de carrera con ID ', OLD.MallaCarrera_id, ' para la carrera ID ', NEW.Carrera_id));
END;

-- Trigger para registrar eliminaciones en la tabla Malla_Carrera
CREATE TRIGGER after_malla_carrera_delete
AFTER DELETE ON Malla_Carrera
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Carrera', CONCAT('Se eliminó la malla de carrera con ID ', OLD.MallaCarrera_id, ' para la carrera ID ', OLD.Carrera_id));
END;
-- Trigger para registrar inserciones en la tabla MallaCarreraAsignatura
CREATE TRIGGER after_mallacarreraasignatura_insert
AFTER INSERT ON MallaCarreraAsignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'MallaCarreraAsignatura', CONCAT('Se insertó la relación de asignatura con ID ', NEW.MallaCarreraAsignatura_id, ' en la malla de carrera ID ', NEW.MallaCarrera_id));
END;

-- Trigger para registrar actualizaciones en la tabla MallaCarreraAsignatura
CREATE TRIGGER after_mallacarreraasignatura_update
AFTER UPDATE ON MallaCarreraAsignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'MallaCarreraAsignatura', CONCAT('Se actualizó la relación de asignatura con ID ', OLD.MallaCarreraAsignatura_id, ' en la malla de carrera ID ', NEW.MallaCarrera_id));
END;

-- Trigger para registrar eliminaciones en la tabla MallaCarreraAsignatura
CREATE TRIGGER after_mallacarreraasignatura_delete
AFTER DELETE ON MallaCarreraAsignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'MallaCarreraAsignatura', CONCAT('Se eliminó la relación de asignatura con ID ', OLD.MallaCarreraAsignatura_id, ' en la malla de carrera ID ', OLD.MallaCarrera_id));
END;
-- Trigger para registrar inserciones en la tabla Campus
CREATE TRIGGER after_campus_insert
AFTER INSERT ON Campus
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Campus', CONCAT('Se insertó el campus ', NEW.Nombre));
END;

-- Trigger para registrar actualizaciones en la tabla Campus
CREATE TRIGGER after_campus_update
AFTER UPDATE ON Campus
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Campus', CONCAT('Se actualizó el campus ', OLD.Nombre, ' a ', NEW.Nombre));
END;

-- Trigger para registrar eliminaciones en la tabla Campus
CREATE TRIGGER after_campus_delete
AFTER DELETE ON Campus
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Campus', CONCAT('Se eliminó el campus ', OLD.Nombre));
END;

-- Trigger para registrar inserciones en la tabla Kardex
CREATE TRIGGER after_kardex_insert
AFTER INSERT ON Kardex
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Kardex', CONCAT('Se creó el kardex para el estudiante ID ', NEW.Estudiante_id));
END;

-- Trigger para registrar actualizaciones en la tabla Kardex
CREATE TRIGGER after_kardex_update
AFTER UPDATE ON Kardex
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Kardex', CONCAT('Se actualizó el kardex del estudiante ID ', OLD.Estudiante_id));
END;

-- Trigger para registrar eliminaciones en la tabla Kardex
CREATE TRIGGER after_kardex_delete
AFTER DELETE ON Kardex
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Kardex', CONCAT('Se eliminó el kardex del estudiante ID ', OLD.Estudiante_id));
END;
-- Trigger para registrar inserciones en la tabla Kardex_Asignatura
CREATE TRIGGER after_kardex_asignatura_insert
AFTER INSERT ON Kardex_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Kardex_Asignatura', CONCAT('Se registró la asignatura ID ', NEW.Asignatura_id, ' para el kardex ID ', NEW.Kardex_id));
END;

-- Trigger para registrar actualizaciones en la tabla Kardex_Asignatura
CREATE TRIGGER after_kardex_asignatura_update
AFTER UPDATE ON Kardex_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Kardex_Asignatura', CONCAT('Se actualizó la nota de la asignatura ID ', OLD.Asignatura_id, ' del kardex ID ', OLD.Kardex_id));
END;

-- Trigger para registrar eliminaciones en la tabla Kardex_Asignatura
CREATE TRIGGER after_kardex_asignatura_delete
AFTER DELETE ON Kardex_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Kardex_Asignatura', CONCAT('Se eliminó la asignatura ID ', OLD.Asignatura_id, ' del kardex ID ', OLD.Kardex_id));
END;
-- Trigger para registrar inserciones en la tabla Curso
CREATE TRIGGER after_curso_insert
AFTER INSERT ON Curso
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Curso', CONCAT('Se registró el curso ID ', NEW.Curso_id, ' para la asignatura ID ', NEW.Asignatura_id));
END;

-- Trigger para registrar actualizaciones en la tabla Curso
CREATE TRIGGER after_curso_update
AFTER UPDATE ON Curso
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Curso', CONCAT('Se actualizó el curso ID ', OLD.Curso_id, ' de la asignatura ID ', OLD.Asignatura_id));
END;

-- Trigger para registrar eliminaciones en la tabla Curso
CREATE TRIGGER after_curso_delete
AFTER DELETE ON Curso
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Curso', CONCAT('Se eliminó el curso ID ', OLD.Curso_id, ' de la asignatura ID ', OLD.Asignatura_id));
END;
-- Trigger para registrar inserciones en la tabla Dias_Asignatura
CREATE TRIGGER after_dias_asignatura_insert
AFTER INSERT ON Dias_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Dias_Asignatura', CONCAT('Se registró la relación entre curso ID ', NEW.Curso_id, ' y día ID ', NEW.Dia_id));
END;

-- Trigger para registrar actualizaciones en la tabla Dias_Asignatura
CREATE TRIGGER after_dias_asignatura_update
AFTER UPDATE ON Dias_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Dias_Asignatura', CONCAT('Se actualizó la relación entre curso ID ', OLD.Curso_id, ' y día ID ', OLD.Dia_id));
END;

-- Trigger para registrar eliminaciones en la tabla Dias_Asignatura
CREATE TRIGGER after_dias_asignatura_delete
AFTER DELETE ON Dias_Asignatura
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Dias_Asignatura', CONCAT('Se eliminó la relación entre curso ID ', OLD.Curso_id, ' y día ID ', OLD.Dia_id));
END;
-- Trigger para registrar inserciones en la tabla Correquisito
CREATE TRIGGER after_correquisito_insert
AFTER INSERT ON Correquisito
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Correquisito', CONCAT('Se registró un correquisito entre la asignatura ID ', NEW.Asignatura_id, ' y la asignatura correquisito ID ', NEW.Correquisito_Asignatura_id));
END;

-- Trigger para registrar actualizaciones en la tabla Correquisito
CREATE TRIGGER after_correquisito_update
AFTER UPDATE ON Correquisito
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Correquisito', CONCAT('Se actualizó el correquisito de la asignatura ID ', OLD.Asignatura_id, ' a la asignatura correquisito ID ', OLD.Correquisito_Asignatura_id));
END;

-- Trigger para registrar eliminaciones en la tabla Correquisito
CREATE TRIGGER after_correquisito_delete
AFTER DELETE ON Correquisito
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Correquisito', CONCAT('Se eliminó el correquisito entre la asignatura ID ', OLD.Asignatura_id, ' y la asignatura correquisito ID ', OLD.Correquisito_Asignatura_id));
END;
-- Trigger para registrar inserciones en la tabla Restricciones
CREATE TRIGGER after_restricciones_insert
AFTER INSERT ON Restricciones
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Restricciones', CONCAT('Se registró una restricción para la asignatura ID ', NEW.Asignatura_id));
END;

-- Trigger para registrar actualizaciones en la tabla Restricciones
CREATE TRIGGER after_restricciones_update
AFTER UPDATE ON Restricciones
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Restricciones', CONCAT('Se actualizó una restricción para la asignatura ID ', OLD.Asignatura_id));
END;

-- Trigger para registrar eliminaciones en la tabla Restricciones
CREATE TRIGGER after_restricciones_delete
AFTER DELETE ON Restricciones
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Restricciones', CONCAT('Se eliminó una restricción para la asignatura ID ', OLD.Asignatura_id));
END;
-- Trigger para registrar inserciones en la tabla Malla_Extras
CREATE TRIGGER after_malla_extras_insert
AFTER INSERT ON Malla_Extras
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Extras', CONCAT('Se registró una malla extra para la malla de carrera ID ', NEW.MallaCarrera_id));
END;

-- Trigger para registrar actualizaciones en la tabla Malla_Extras
CREATE TRIGGER after_malla_extras_update
AFTER UPDATE ON Malla_Extras
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Extras', CONCAT('Se actualizó una malla extra para la malla de carrera ID ', OLD.MallaCarrera_id));
END;

-- Trigger para registrar eliminaciones en la tabla Malla_Extras
CREATE TRIGGER after_malla_extras_delete
AFTER DELETE ON Malla_Extras
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Usuario, Tabla_Modificada, Descripcion)
    VALUES (CURRENT_USER(), 'Malla_Extras', CONCAT('Se eliminó una malla extra para la malla de carrera ID ', OLD.MallaCarrera_id));
END;
