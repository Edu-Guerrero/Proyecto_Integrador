drop procedure if exists ObtenerAsignaturasRestantes;
DELIMITER $$

CREATE PROCEDURE ObtenerAsignaturasRestantes(IN EstudianteId INT)
BEGIN
    CREATE TEMPORARY TABLE TempAsignaturasEstado AS
        SELECT 
            ct.Nombre as Categoria
        FROM
            Estudiante AS e
        JOIN   
            Carrera AS c ON e.Carrera_id = c.Carrera_id
        JOIN
            Malla_Carrera AS mc ON c.Carrera_id = mc.Carrera_id
        JOIN
            Malla_Extras AS me ON mc.MallaCarrera_id = me.MallaCarrera_id
        JOIN
            Categoria AS ct ON me.Categoria_id = ct.Categoria_id
        JOIN
            Kardex k ON e.Estudiante_id = k.Estudiante_id
        JOIN
            Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
        JOIN
            Asignatura as a ON ka.Asignatura_id = a.Asignatura_id AND a.Categoria_id = ct.Categoria_id
        WHERE
            e.Estudiante_id = EstudianteId
            AND a.Nombre NOT IN 
            (SELECT 
                a.Nombre as Asignatura
                FROM
                    Estudiante AS e
                JOIN
                    Malla_Carrera AS mc ON e.Carrera_id = mc.Carrera_id
                JOIN
                    MallaCarreraAsignatura AS mca ON mc.MallaCarrera_id = mca.MallaCarrera_id
                JOIN
                    Asignatura as a ON mca.Asignatura_id = a.Asignatura_id
                WHERE
                    e.Estudiante_id = EstudianteId);

        SET @tomadasElec := NULL; -- Inicializar la variable al inicio
        SET @tomadasOpt := NULL; -- Inicializar la variable al inicio
        -- Common Table Expression (CTE) for MateriasRestantes
        WITH MateriasRestantes AS (
            SELECT 
                a.Nombre AS 'Nombre Asignatura',
                CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura',
                a.Creditos AS 'Numero de Creditos',
                s.Nombre AS 'Semestre',
                s.Semestre_id AS 'Semestre_id'
            FROM 
                Estudiante e
            JOIN
                Carrera c ON e.Carrera_id = c.Carrera_id
            JOIN
                Malla_Carrera mc ON c.Carrera_id = mc.Carrera_id
            JOIN
                MallaCarreraAsignatura mca ON mc.MallaCarrera_id = mca.MallaCarrera_id
            JOIN
                Asignatura a ON mca.Asignatura_id = a.Asignatura_id
            JOIN
                Semestre s ON mca.Semestre_id = s.Semestre_id
            LEFT JOIN
                Kardex k ON e.Estudiante_id = k.Estudiante_id
            LEFT JOIN
                Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id AND ka.Asignatura_id = a.Asignatura_id AND ka.Aprobada = TRUE
            WHERE 
                e.Estudiante_id = EstudianteId
                AND ka.Asignatura_id IS NULL
            UNION ALL
            SELECT
                CASE 
                    WHEN me.Optativa = 1 THEN 'Optativa'
                    WHEN me.Electiva = 1 THEN 'Electiva'
                    ELSE ct.Nombre
                END as 'Nombre Asignatura',
                NULL AS 'Codigo Asignatura',
                3 AS 'Numero de Creditos',
                s.Nombre AS 'Semestre',
                s.Semestre_id AS 'Semestre_id'
            FROM
                Carrera as c
            JOIN
                Malla_Carrera as mc ON c.Carrera_id = mc.Carrera_id
            JOIN
                Malla_Extras as me ON mc.MallaCarrera_id = me.MallaCarrera_id
            JOIN    
                Semestre as s ON me.Semestre_id = s.Semestre_id
            LEFT JOIN
                Categoria as ct ON me.Categoria_id = ct.Categoria_id
            WHERE
                c.Carrera_id = 31
                AND (ct.Nombre is null or ct.nombre not in (SELECT Categoria FROM TempAsignaturasEstado))
                AND EXISTS (
                    SELECT 1
                    FROM Estudiante e
                    WHERE e.Carrera_id = c.Carrera_id
                    AND e.Estudiante_id = EstudianteId
                )
        ),
    ElectivasTomadas AS (
        SELECT 
            COUNT(a.Nombre) as Tomadas
        FROM
            Estudiante AS e
        JOIN   
            Kardex AS k ON e.Estudiante_id = k.Estudiante_id
        JOIN
            Kardex_Asignatura AS ka ON k.Kardex_id = ka.Kardex_id
        JOIN
            Asignatura AS a ON ka.Asignatura_id = a.Asignatura_id
        JOIN
            Carrera AS c ON a.Carrera_id = c.Carrera_id
        JOIN
            Colegio AS co ON c.Colegio_id = co.Colegio_id
        WHERE
            e.Estudiante_id = EstudianteId
            AND ka.Aprobada = TRUE
            AND a.asignatura_id NOT IN (
                SELECT 
                    a.asignatura_id
                FROM
                    Estudiante AS e
                JOIN   
                    Malla_Carrera AS mc ON e.Carrera_id = mc.Carrera_id
                JOIN
                    MallaCarreraAsignatura AS mca ON mc.MallaCarrera_id = mca.MallaCarrera_id
                JOIN
                    Asignatura AS a ON mca.Asignatura_id = a.asignatura_id
                WHERE
                    e.Estudiante_id = EstudianteId
            )
            AND co.Colegio_id not in (
                SELECT 
                    co.Colegio_id
                FROM
                    Estudiante AS e
                JOIN   
                    Carrera AS c ON e.Carrera_id = c.Carrera_id
                JOIN
                    Colegio AS co ON c.Colegio_id = co.Colegio_id
                WHERE
                    e.Estudiante_id = EstudianteId
            )
    ),
    OptativasTomadas AS (
        SELECT 
        Count(asig.Asignatura) AS Optativas
    FROM
        Estudiante AS e
    LEFT JOIN
        Carrera AS c ON e.Carrera_id = c.Carrera_id
    LEFT JOIN
        Colegio AS co ON c.Colegio_id = co.Colegio_id
    JOIN
        (SELECT 
            a.Nombre AS Asignatura,
            a.Asignatura_id,  -- Agregar Asignatura_id aquí
            c.Nombre as Carrera,
            c.`Colegio_id`
        FROM
            Carrera AS c
        JOIN
            Asignatura AS a ON c.Carrera_id = a.Carrera_id
        ) AS asig ON asig.Colegio_id = co.Colegio_id
    LEFT JOIN
        Kardex AS k ON e.Estudiante_id = k.Estudiante_id
    JOIN
        Kardex_Asignatura AS ka ON k.Kardex_id = ka.Kardex_id AND ka.Asignatura_id = asig.Asignatura_id  -- Usar asig.Asignatura_id
    WHERE
        e.Estudiante_id = EstudianteId
        AND asig.asignatura_id NOT IN (
                SELECT 
                    a.asignatura_id
                FROM
                    Estudiante AS e
                JOIN   
                    Malla_Carrera AS mc ON e.Carrera_id = mc.Carrera_id
                JOIN
                    MallaCarreraAsignatura AS mca ON mc.MallaCarrera_id = mca.MallaCarrera_id
                JOIN
                    Asignatura AS a ON mca.Asignatura_id = a.asignatura_id
                WHERE
                    e.Estudiante_id = EstudianteId
            )
    )
    SELECT *
    FROM (
        SELECT 
            mr.`Nombre Asignatura`,
            mr.`Codigo Asignatura`,
            mr.`Numero de Creditos`,
            mr.Semestre,
            CASE 
                WHEN mr.`Nombre Asignatura` = 'Electiva' THEN
                    CASE
                        WHEN (@tomadasElec := IF(@tomadasElec IS NULL, et.Tomadas, @tomadasElec - 1)) > 0 THEN 'Tomada'
                        ELSE 'No Tomada'
                    END
                WHEN mr.`Nombre Asignatura` = 'Optativa' THEN
                    CASE
                        WHEN (@tomadasOpt := IF(@tomadasOpt IS NULL, ot.Optativas, @tomadasOpt - 1)) > 0 THEN 'Tomada'
                        ELSE 'No Tomada'
                    END
                ELSE
                    CASE
                        WHEN ka.Kardex_Asignatura_id IS NOT NULL THEN 'Tomada'
                        ELSE 'No Tomada'
                    END
            END AS Estado
        FROM
            MateriasRestantes mr
        JOIN
            Estudiante e ON e.Estudiante_id = EstudianteId
        LEFT JOIN
            Kardex k ON e.Estudiante_id = k.Estudiante_id
        LEFT JOIN
            Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id AND ka.Asignatura_id = mr.`Codigo Asignatura` AND ka.Aprobada = TRUE
        JOIN
            ElectivasTomadas AS et ON e.Estudiante_id = EstudianteId
        JOIN
            OptativasTomadas AS ot ON e.Estudiante_id = EstudianteId
    ) AS Resultados
    WHERE
        Estado = 'No Tomada' -- Filtrar resultados
    ORDER BY
        Semestre;

    SET @tomadasElec := NULL; -- Resetear la variable después de la consulta si es necesario
    SET @tomadasOpt := NULL; -- Resetear la variable después de la consulta si es necesario

        -- Drop the temporary table
        DROP TABLE TempAsignaturasEstado;
END$$

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ObtenerKardexEst(IN student_id INT)
BEGIN
    SELECT 
        a.Nombre AS 'Subject Name',
        CONCAT(c.Abreviatura, '-', a.Numero) AS 'Subject Code',
        n.Nota AS 'Grade',
        CASE 
            WHEN ka.Aprobada = 1 THEN 'Aprobada'
            ELSE 'Not Aprobada'
        END AS 'Status',
        ct.Nombre as 'Categoria'
    FROM 
        Estudiante e
    JOIN 
        Kardex k ON e.Estudiante_id = k.Estudiante_id
    JOIN
        Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
    JOIN 
        Asignatura a ON ka.Asignatura_id = a.Asignatura_id
    JOIN
        Notas as n ON ka.Nota_id = n.Nota_id
    JOIN
        Carrera as c ON c.Carrera_id = a.Carrera_id
    JOIN
        Categoria as ct ON a.Categoria_id = ct.Categoria_id
    WHERE 
        e.Estudiante_id = student_id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetMallaCarrera(IN carrera_id INT)
BEGIN
    SELECT * FROM 
    (
        SELECT 
            a.Nombre AS 'Nombre Asignatura',
            CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura',
            a.Creditos AS 'Numero de Creditos',
            s.Nombre AS 'Semestre',
            s.Semestre_id AS 'Semestre_id',
            ct.Nombre as 'Categoria'
        FROM 
            Carrera as c
        JOIN
            Malla_Carrera as mc ON c.Carrera_id = mc.Carrera_id
        JOIN
            MallaCarreraAsignatura as mca ON mc.MallaCarrera_id = mca.MallaCarrera_id
        JOIN
            Asignatura as a ON mca.Asignatura_id = a.Asignatura_id
        JOIN
            Semestre as s ON mca.Semestre_id = s.Semestre_id
        JOIN
            Categoria as ct ON a.Categoria_id = ct.Categoria_id
        WHERE 
            c.Carrera_id = carrera_id
        UNION ALL
        SELECT 
            CASE 
                WHEN me.Optativa = 1 THEN 'Optativa'
                WHEN me.Electiva = 1 THEN 'Electiva'
                ELSE ct.Nombre
            END as 'Nombre Asignatura',
            NULL AS 'Codigo Asignatura',
            3 AS 'Numero de Creditos',
            s.Nombre AS 'Semestre',
            s.Semestre_id AS 'Semestre_id',
            ct.Nombre as 'Categoria'
        FROM
            Carrera as c
        JOIN
            Malla_Carrera as mc ON c.Carrera_id = mc.Carrera_id
        JOIN
            Malla_Extras as me ON mc.MallaCarrera_id = me.MallaCarrera_id
        JOIN    
            Semestre as s ON me.Semestre_id = s.Semestre_id
        LEFT JOIN
            Categoria as ct ON me.Categoria_id = ct.Categoria_id
        WHERE
            c.Carrera_id = carrera_id
    ) AS subquery
    ORDER BY
        subquery.Semestre_id;
END //

DELIMITER ;

-- Obtener PreRequisitos de una Asignatura
DELIMITER //

CREATE PROCEDURE ObtenerDetallesAsignatura(IN asignaturaId INT)
BEGIN
    SELECT 
        a.`Asignatura_id` AS 'Asignatura_id',
        a.Nombre AS 'Nombre', 
        CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura',
        GROUP_CONCAT(dep.Nombre SEPARATOR ' AND ') AS 'Prerrequisitos'  -- Concatenar los nombres de los prerrequisitos
    FROM
        Asignatura a
    JOIN
        Prerrequisito p ON a.Asignatura_id = p.Asignatura_id    
    JOIN
        Carrera c ON a.Carrera_id = c.Carrera_id
    LEFT JOIN
        Asignatura dep ON p.Dependencia_id = dep.Asignatura_id  -- Auto-join para obtener el nombre del prerrequisito
    WHERE
        a.`Asignatura_id` = asignaturaId  -- Filtrar por ID de asignatura
    GROUP BY 
        a.`Asignatura_id`, a.Nombre, c.Abreviatura, a.Numero;  -- Agrupar por asignatura
END //

DELIMITER ;
-- Verificar si cumple con los prerrequisitos
DELIMITER //

CREATE PROCEDURE VerificarPrerrequisitos (
    IN p_Estudiante_id INT,
    IN p_Asignatura_id INT
)
BEGIN
    SELECT 
        CASE 
            WHEN COUNT(p.Dependencia_id) = 0 THEN 'Cumple con los prerrequisitos'
            ELSE 'No cumple con los prerrequisitos'
        END AS Estado
    FROM 
        Asignatura a
    JOIN 
        Prerrequisito p ON a.Asignatura_id = p.Asignatura_id
    WHERE 
        a.Asignatura_id = p_Asignatura_id  -- Especifica la materia
        AND p.Dependencia_id NOT IN (
            SELECT 
                a.Asignatura_id 
            FROM 
                Estudiante e
            JOIN
                Kardex k ON e.Estudiante_id = k.Estudiante_id
            JOIN
                Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
            JOIN
                Asignatura a ON ka.Asignatura_id = a.Asignatura_id
            WHERE 
                k.Estudiante_id = p_Estudiante_id
                AND ka.Aprobada = TRUE
        );
END //

DELIMITER ;
drop procedure if exists ObtenerCorrequisitos;
DELIMITER //

CREATE PROCEDURE ObtenerCorrequisitos(IN p_asignatura_id INT)
BEGIN
    SELECT 
        CASE 
            WHEN a1.Asignatura_id = p_asignatura_id THEN a1.Nombre
            ELSE a2.Nombre
        END AS 'Asignatura',

        CASE 
            WHEN a2.Asignatura_id = p_asignatura_id THEN a1.Nombre
            ELSE a2.Nombre
        END AS 'Correquisito'
    FROM 
        Asignatura a1
    JOIN
        Correquisito cr ON a1.Asignatura_id = cr.Asignatura_id
    JOIN
        Asignatura a2 ON cr.Correquisito_Asignatura_id = a2.Asignatura_id
    WHERE 
        a1.Asignatura_id = p_asignatura_id
        OR a2.Asignatura_id = p_asignatura_id;
END //

DELIMITER ;
---- Observar Las restricciones de una asignatura
DELIMITER //

CREATE PROCEDURE ObtenerInformacionAsignatura(IN asignaturaID INT)
BEGIN
    SELECT 
        a.Nombre AS Asignatura, 
        c.Nombre AS Carrera,
        Co.Nombre AS Colegio,
        S.Nombre AS Semestre
    FROM
        Asignatura a
    INNER JOIN
        Restricciones r ON a.Asignatura_id = r.Asignatura_id
    LEFT JOIN
        Carrera c ON r.Carrera_id = c.Carrera_id
    LEFT JOIN
        Colegio Co ON r.Colegio_id = Co.Colegio_id
    LEFT JOIN
        Semestre S ON r.Semestre_id = S.Semestre_id
    WHERE
        a.Asignatura_id = asignaturaID;
END //

DELIMITER ;

-- Verificar si el estudiante cumple con las restricciones de una asignatura
DELIMITER //

CREATE PROCEDURE VerificarRestriccionesEstudiante(
    IN estudianteID INT,
    IN asignaturaID INT
)
BEGIN
    DECLARE cumple BOOLEAN DEFAULT TRUE;  -- Variable para almacenar si cumple las restricciones
    DECLARE estudianteCarrera INT;
    DECLARE estudianteColegio INT;
    DECLARE estudianteSemestre INT;

    -- Obtener la carrera, colegio y semestre del estudiante
    SELECT 
        c.Carrera_id, 
        co.Colegio_id, 
        s.Semestre_id 
    INTO 
        estudianteCarrera, 
        estudianteColegio, 
        estudianteSemestre
    FROM 
        Estudiante e
    JOIN
        Carrera c ON e.Carrera_id = c.Carrera_id
    JOIN
        Colegio co ON c.Colegio_id = co.Colegio_id
    JOIN
        Semestre s ON e.Semestre_id = s.Semestre_id
    WHERE 
        e.Estudiante_id = estudianteID;

    -- Verificar si la asignatura tiene restricciones
    IF EXISTS (
        SELECT 1
        FROM Restricciones r
        WHERE r.Asignatura_id = asignaturaID
    ) THEN
        -- Verificar si el estudiante cumple con las restricciones de carrera
        IF EXISTS (
            SELECT 1
            FROM Restricciones r
            WHERE r.Asignatura_id = asignaturaID
            AND r.Carrera_id IS NOT NULL
            AND r.Carrera_id != estudianteCarrera
        ) THEN
            SET cumple = FALSE;
        END IF;

        -- Verificar si el estudiante cumple con las restricciones de colegio
        IF EXISTS (
            SELECT 1
            FROM Restricciones r
            WHERE r.Asignatura_id = asignaturaID
            AND r.Colegio_id IS NOT NULL
            AND r.Colegio_id != estudianteColegio
        ) THEN
            SET cumple = FALSE;
        END IF;

        -- Verificar si el estudiante cumple con la restricción de semestre
        IF EXISTS (
            SELECT 1
            FROM Restricciones r
            WHERE r.Asignatura_id = asignaturaID
            AND r.Semestre_id IS NOT NULL
            AND r.Semestre_id > estudianteSemestre
        ) THEN
            SET cumple = FALSE;
        END IF;
    END IF;

    -- Mostrar si el estudiante cumple con las restricciones o no
    IF cumple THEN
        SELECT 'El estudiante cumple con todas las restricciones para tomar la asignatura.' AS Resultado;
    ELSE
        SELECT 'El estudiante NO cumple con las restricciones para tomar la asignatura.' AS Resultado;
    END IF;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE getOptativas(IN EstudianteID INT)
BEGIN
        SELECT 
        a.Asignatura_id, 
        a.Numero,
        a.Nombre AS Asignatura,
        ca.Nombre AS Carrera,
        co.Nombre AS Colegio
    FROM 
        Asignatura a
    JOIN 
        Carrera ca ON a.Carrera_id = ca.Carrera_id
    JOIN 
        Colegio co ON ca.Colegio_id = co.Colegio_id
    LEFT JOIN 
        (SELECT ka.Asignatura_id
        FROM Estudiante e
        JOIN Kardex k ON e.Estudiante_id = k.Estudiante_id
        JOIN Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
        WHERE e.Estudiante_id = EstudianteID) AS kardex_asig ON a.Asignatura_id = kardex_asig.Asignatura_id
    LEFT JOIN 
        (SELECT ma.Asignatura_id
        FROM Estudiante e
        JOIN Carrera c ON e.Carrera_id = c.Carrera_id
        JOIN Malla_Carrera mc ON c.Carrera_id = mc.Carrera_id
        JOIN MallaCarreraAsignatura ma ON mc.MallaCarrera_id = ma.MallaCarrera_id
        WHERE e.Estudiante_id = EstudianteID) AS malla_asig ON a.Asignatura_id = malla_asig.Asignatura_id
    LEFT JOIN 
        Restricciones r ON a.Asignatura_id = r.Asignatura_id
    LEFT JOIN 
        Estudiante e ON e.Estudiante_id = EstudianteID
    LEFT JOIN 
        Prerrequisito p ON a.Asignatura_id = p.Asignatura_id
    WHERE 
        co.Colegio_id = (SELECT co2.Colegio_id 
                        FROM Estudiante e2
                        JOIN Carrera c2 ON e2.Carrera_id = c2.Carrera_id
                        JOIN Colegio co2 ON c2.Colegio_id = co2.Colegio_id
                        WHERE e2.Estudiante_id = EstudianteID)
        AND kardex_asig.Asignatura_id IS NULL  -- Asignaturas que no están en el kardex del estudiante
        AND malla_asig.Asignatura_id IS NULL   -- Asignaturas que no están en la malla de la carrera del estudiante
        AND (r.Carrera_id IS NULL OR r.Carrera_id = e.Carrera_id) -- Cumple con la carrera
        AND (r.Colegio_id IS NULL OR r.Colegio_id = co.Colegio_id) -- Cumple con el colegio
        AND (r.Semestre_id IS NULL OR r.Semestre_id <= e.Semestre_id) -- Cumple con el semestre
        AND (p.Dependencia_id IS NULL OR p.Dependencia_id IN (SELECT ka.Asignatura_id
                                                            FROM Estudiante e
                                                            JOIN Kardex k ON e.Estudiante_id = k.Estudiante_id
                                                            JOIN Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
                                                            WHERE e.Estudiante_id = EstudianteID)) -- Cumple con los prerrequisitos
        AND a.Numero REGEXP '^[2-6]'
        ORDER BY 
        a.Asignatura_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetElectivas(IN EstudianteID INT)
BEGIN
    SELECT 
        a.Asignatura_id, 
        a.Numero,
        a.Nombre AS Asignatura,
        ca.Nombre AS Carrera,
        co.Nombre AS Colegio
    FROM 
        Asignatura a
    LEFT JOIN 
        Carrera ca ON a.Carrera_id = ca.Carrera_id
    LEFT JOIN 
        Colegio co ON ca.Colegio_id = co.Colegio_id
    LEFT JOIN 
        (SELECT ka.Asignatura_id
         FROM Estudiante e
         JOIN Kardex k ON e.Estudiante_id = k.Estudiante_id
         JOIN Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
         WHERE e.Estudiante_id = EstudianteID) AS kardex_asig ON a.Asignatura_id = kardex_asig.Asignatura_id
    LEFT JOIN 
        (SELECT ma.Asignatura_id
         FROM Estudiante e
         JOIN Carrera c ON e.Carrera_id = c.Carrera_id
         JOIN Malla_Carrera mc ON c.Carrera_id = mc.Carrera_id
         JOIN MallaCarreraAsignatura ma ON mc.MallaCarrera_id = ma.MallaCarrera_id
         WHERE e.Estudiante_id = EstudianteID) AS malla_asig ON a.Asignatura_id = malla_asig.Asignatura_id
    LEFT JOIN 
        Restricciones r ON a.Asignatura_id = r.Asignatura_id
    LEFT JOIN 
        Estudiante e ON e.Estudiante_id = EstudianteID
    LEFT JOIN 
        Prerrequisito p ON a.Asignatura_id = p.Asignatura_id
    WHERE 
        kardex_asig.Asignatura_id IS NULL  -- Asignaturas que no están en el kardex del estudiante
        AND malla_asig.Asignatura_id IS NULL   -- Asignaturas que no están en la malla de la carrera del estudiante
        AND (r.Carrera_id IS NULL OR r.Carrera_id = e.Carrera_id) -- Cumple con la carrera
        AND (r.Colegio_id IS NULL OR r.Colegio_id = co.Colegio_id) -- Cumple con el colegio
        AND (r.Semestre_id IS NULL OR r.Semestre_id <= e.Semestre_id) -- Cumple con el semestre
        AND (p.Dependencia_id IS NULL OR p.Dependencia_id IN (SELECT ka.Asignatura_id
                                                              FROM Estudiante e
                                                              JOIN Kardex k ON e.Estudiante_id = k.Estudiante_id
                                                              JOIN Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id
                                                              WHERE e.Estudiante_id = EstudianteID)) -- Cumple con los prerrequisitos
        AND a.Carrera_id NOT IN (SELECT c.Carrera_id
                                 FROM Estudiante e
                                 JOIN Carrera c ON e.Carrera_id = c.Carrera_id
                                 WHERE e.Estudiante_id = EstudianteID) 
        AND co.Colegio_id NOT IN (SELECT co.Colegio_id 
                                  FROM Estudiante e
                                  JOIN Carrera c ON e.Carrera_id = c.Carrera_id
                                  JOIN Colegio co ON c.Colegio_id = co.Colegio_id
                                  WHERE e.Estudiante_id = EstudianteID)
    ORDER BY 
        a.Asignatura_id;
END //

DELIMITER ;

-- Ver Cursos
DELIMITER //

CREATE PROCEDURE VerCursos(IN asignaturaId INT)
BEGIN
    SELECT 
        CONCAT(c.abreviatura, '-', a.Numero) AS `Subject Code`,
        a.`Nombre` AS `Subject Name`, 
        cu.`Curso_id` AS `NRC`,
        m.`Nombre` AS `Modalidad`,
        GROUP_CONCAT(d.`Abreviatura` SEPARATOR ', ') AS `Days`,
        h.`Hora` AS `Schedule`,
        p.Nombre AS `Professor`,
        ca.Nombre AS `Campus`,
        CONCAT(edf.Nombre, ' ', cu.Aula) AS `Location`,
        a.`Creditos` AS `Credits`
    FROM
        Asignatura a
    JOIN
        Curso cu ON a.Asignatura_id = cu.Asignatura_id
    JOIN    
        Modalidad m ON cu.Modalidad_id = m.Modalidad_id
    JOIN
        Horario h ON cu.Horario_id = h.Horario_id
    JOIN    
        Profesor p ON cu.Profesor_id = p.Profesor_id    
    JOIN
        Campus ca ON cu.Campus_id = ca.Campus_id
    JOIN
        Edificio edf ON cu.Edificio_id = edf.Edificio_id
    JOIN
        Carrera c ON a.Carrera_id = c.Carrera_id
    JOIN
        dias_asignatura da ON cu.curso_id = da.Curso_id
    JOIN
        Dias d ON da.Dia_id = d.Dia_id
    WHERE
        a.`Asignatura_id` = asignaturaId
    GROUP BY
        cu.`Curso_id`;
END //

DELIMITER ;

-- Ver malla Subesp
DELIMITER //

CREATE PROCEDURE getSubEspecializacion(IN p_SubEsp_id INT)
BEGIN
    SELECT 
        CONCAT(c.Abreviatura, ' ', a.Numero) AS Clave,
        a.Nombre AS Asignatura, 
        a.Creditos AS Creditos
    FROM
        subespecializacion se 
    JOIN
        malla_subespecializacion ms ON se.SubEsp_id = ms.SubEsp_id
    JOIN
        mallasubesp_asignatura msa ON ms.MallaSubEsp_id = msa.MallaSubEsp_id
    JOIN
        asignatura a ON msa.Asignatura_id = a.Asignatura_id
    JOIN
        carrera c ON a.Carrera_id = c.Carrera_id
    WHERE
        se.SubEsp_id = p_SubEsp_id;
END //

DELIMITER ;

--Ver Asignaturas restantes para la sub
DELIMITER //

CREATE PROCEDURE verSubEspRestantes(IN p_Estudiante_id INT)
BEGIN
    SELECT 
        CONCAT(c.Abreviatura, ' ', a.Numero) AS Clave,
        a.Nombre AS Asignatura, 
        a.Creditos AS Creditos
    FROM
        subespecializacion se 
    JOIN
        malla_subespecializacion ms ON se.SubEsp_id = ms.SubEsp_id
    JOIN
        mallasubesp_asignatura msa ON ms.MallaSubEsp_id = msa.MallaSubEsp_id
    JOIN
        asignatura a ON msa.Asignatura_id = a.Asignatura_id
    JOIN
        carrera c ON a.Carrera_id = c.Carrera_id
    LEFT JOIN
        (SELECT ka.Asignatura_id
         FROM kardex k
         JOIN kardex_asignatura ka ON k.Kardex_id = ka.Kardex_id
         WHERE k.Estudiante_id = p_Estudiante_id
           AND ka.Aprobada = 1) AS kardex_tomado ON kardex_tomado.Asignatura_id = a.Asignatura_id
    WHERE
        se.SubEsp_id = (SELECT e.SubEsp_id FROM estudiante e WHERE e.Estudiante_id = p_Estudiante_id)
        AND kardex_tomado.Asignatura_id IS NULL;
END //

DELIMITER ;

--Ver Asignaturas tomadas para la sub
DELIMITER //

CREATE PROCEDURE verSubEspTomadas(IN p_Estudiante_id INT)
BEGIN
    SELECT 
        CONCAT(c.Abreviatura, ' ', a.Numero) as Clave,
        a.Nombre as Asignatura, 
        a.Creditos as Creditos
    FROM
        subespecializacion se 
    JOIN
        malla_subespecializacion ms ON se.SubEsp_id = ms.SubEsp_id
    JOIN
        mallasubesp_asignatura msa ON ms.MallaSubEsp_id = msa.MallaSubEsp_id
    JOIN
        asignatura a ON msa.Asignatura_id = a.Asignatura_id
    JOIN
        carrera c ON a.Carrera_id = c.Carrera_id
    JOIN
        estudiante e ON e.SubEsp_id = se.SubEsp_id
    JOIN
        kardex k ON e.Estudiante_id = k.Estudiante_id
    JOIN 
        kardex_asignatura ka ON k.Kardex_id = ka.Kardex_id
        AND ka.Asignatura_id = a.Asignatura_id
    WHERE
        e.Estudiante_id = p_Estudiante_id
        AND ka.Aprobada = 1;
END //

DELIMITER ;