--Para materias restantes a un estudiante sin los extras
SELECT 
        a.Nombre AS 'Nombre Asignatura',
        CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura',
        a.Creditos AS 'Numero de Creditos',
        s.Nombre AS 'Semestre'
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
    ORDER BY
        s.Semestre_id;

--Para buscar la malla de una carrera inclyendo los extras.
SELECT * FROM (
    SELECT 
        a.Nombre AS 'Nombre Asignatura',
        CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura',
        a.Creditos AS 'Numero de Creditos',
        s.Nombre AS 'Semestre',
        s.Semestre_id AS 'Semestre_id'
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
    WHERE 
        c.Carrera_id = 31
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
        s.`Semestre_id` AS 'Semestre_id'
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
    ) AS combined_results
    ORDER BY
        `Semestre_id`;

-- Para ver Asignaturas con pre-requisitos
SELECT 
        a.Nombre AS 'Nombre Asignatura',
        CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura',
        pa.Nombre as 'Prerrequisito',
        p.Grupo as 'Grupo Prerrequisito'
    FROM
        Asignatura a
    JOIN
        grupo_prerrequisito gp ON a.Asignatura_id = gp.Asignatura_id
    JOIN
        Carrera c ON a.Carrera_id = c.Carrera_id
    JOIN
        Prerrequisito p ON gp.Prerrequisito_id = p.Prerrequisito_id
    JOIN
        (SELECT
                a.Nombre as Nombre,
                a.Asignatura_id as Asignatura_id
            FROM
                Asignatura a
            JOIN    
                prerrequisito as p ON a.Asignatura_id = p.Asignatura_id
        ) AS pa ON p.asignatura_id = pa.Asignatura_id


SELECT 
        a.Nombre AS 'Nombre Asignatura',
        CONCAT(c.Abreviatura, '-', a.Numero) AS 'Codigo Asignatura'
    FROM
        Asignatura a
    JOIN
        grupo_prerrequisito gp ON a.Asignatura_id = gp.Asignatura_id
    JOIN
        Carrera c ON a.Carrera_id = c.Carrera_id