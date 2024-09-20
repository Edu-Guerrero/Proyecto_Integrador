
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
            e.Estudiante_id = 00999999
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
                    e.Estudiante_id = 00999999);

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
                e.Estudiante_id = 00999999
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
                    AND e.Estudiante_id = 00999999
                )
        ),
    ElectivasTomadas AS (
        SELECT 
            COUNT(a.Nombre) AS Tomadas
        FROM
            Estudiante AS e
        JOIN   
            Kardex AS k ON e.Estudiante_id = k.Estudiante_id
        JOIN
            Kardex_Asignatura AS ka ON k.Kardex_id = ka.Kardex_id
        JOIN
            Asignatura AS a ON ka.Asignatura_id = a.Asignatura_id
        WHERE
            e.Estudiante_id = 00999999
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
                    e.Estudiante_id = 00999999
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
        e.Estudiante_id = 00999999
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
                    e.Estudiante_id = 00999999
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
            Estudiante e ON e.Estudiante_id = 00999999
        LEFT JOIN
            Kardex k ON e.Estudiante_id = k.Estudiante_id
        LEFT JOIN
            Kardex_Asignatura ka ON k.Kardex_id = ka.Kardex_id AND ka.Asignatura_id = mr.`Codigo Asignatura` AND ka.Aprobada = TRUE
        JOIN
            ElectivasTomadas AS et ON e.Estudiante_id = 999999
        JOIN
            OptativasTomadas AS ot ON e.Estudiante_id = 999999
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

