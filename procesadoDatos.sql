DELIMITER //

CREATE PROCEDURE ProcesarDatos()
BEGIN
    -- Limpiar duplicados en DimPersona
    DELETE p1 FROM DimPersona p1
    INNER JOIN DimPersona p2
    WHERE p1.idPersona > p2.idPersona
    AND p1.NombreCompleto = p2.NombreCompleto
    AND p1.Domicilio = p2.Domicilio
    AND p1.CodigoPostal = p2.CodigoPostal
    AND p1.Nacionalidad = p2.Nacionalidad
    AND p1.Telefono = p2.Telefono;

    -- Limpiar duplicados en DimMedicamento
    DELETE m1 FROM DimMedicamento m1
    INNER JOIN DimMedicamento m2
    WHERE m1.idMedicamento > m2.idMedicamento
    AND m1.Marca = m2.Marca
    AND m1.NombreMedicamento = m2.NombreMedicamento;

    -- Limpiar duplicados en DimDoctor
    DELETE d1 FROM DimDoctor d1
    INNER JOIN DimDoctor d2
    WHERE d1.idDoctor > d2.idDoctor
    AND d1.Cedula = d2.Cedula
    AND d1.NumeroDoctor = d2.NumeroDoctor
    AND d1.Horario = d2.Horario
    AND d1.idPersona = d2.idPersona;

    -- Limpiar duplicados en DimEnfermero
    DELETE e1 FROM DimEnfermero e1
    INNER JOIN DimEnfermero e2
    WHERE e1.idEnfermero > e2.idEnfermero
    AND e1.Titulo = e2.Titulo
    AND e1.NumeroEnfermero = e2.NumeroEnfermero
    AND e1.Horario = e2.Horario
    AND e1.idPersona = e2.idPersona;

    -- Limpiar duplicados en DimPadecimiento
    DELETE p1 FROM DimPadecimiento p1
    INNER JOIN DimPadecimiento p2
    WHERE p1.idPadecimiento > p2.idPadecimiento
    AND p1.Descripcion = p2.Descripcion
    AND p1.Gravedad = p2.Gravedad;

    -- Eliminar datos con valores nulos en DimPersona
    DELETE FROM DimPersona WHERE idPersona IS NOT NULL
    AND (NombreCompleto IS NULL OR Domicilio IS NULL
    OR CodigoPostal IS NULL OR Nacionalidad IS NULL OR Telefono IS NULL);

    -- Eliminar datos con valores nulos en DimMedicamento
    DELETE FROM DimMedicamento WHERE idMedicamento IS NOT NULL
    AND (Marca IS NULL OR NombreMedicamento IS NULL);

    -- Eliminar datos con valores nulos en DimDoctor
    DELETE FROM DimDoctor WHERE idDoctor IS NOT NULL
    AND (Cedula IS NULL OR NumeroDoctor IS NULL OR Horario IS NULL OR idPersona IS NULL);

    -- Eliminar datos con valores nulos en DimEnfermero
    DELETE FROM DimEnfermero WHERE idEnfermero IS NOT NULL
    AND (Titulo IS NULL OR NumeroEnfermero IS NULL OR Horario IS NULL OR idPersona IS NULL);

    -- Eliminar datos con valores nulos en DimPadecimiento
    DELETE FROM DimPadecimiento WHERE idPadecimiento IS NOT NULL
    AND (Descripcion IS NULL OR Gravedad IS NULL);

    -- Eliminar datos con valores nulos en Paciente
    DELETE FROM Paciente WHERE idPaciente IS NOT NULL
    AND (NumeroPaciente IS NULL OR Altura IS NULL OR Peso IS NULL
    OR Sangre IS NULL OR idPersona IS NULL);

    -- Eliminar datos con valores nulos en HechosPaciente
    DELETE FROM HechosPaciente WHERE (idPaciente IS NOT NULL OR idDoctor IS NOT NULL OR idEnfermero IS NOT NULL
    OR idPadecimiento IS NOT NULL OR idMedicamento IS NOT NULL OR FechaDiagnostico IS NOT NULL
    OR Cantidad IS NOT NULL OR Altura IS NOT NULL OR Peso IS NOT NULL OR Sangre IS NOT NULL)
    AND (idPaciente IS NULL OR idDoctor IS NULL OR idEnfermero IS NULL
    OR idPadecimiento IS NULL OR idMedicamento IS NULL OR FechaDiagnostico IS NULL
    OR Cantidad IS NULL OR Altura IS NULL OR Peso IS NULL OR Sangre IS NULL);

    -- Eliminar registros en HechosPaciente con claves foráneas que no existen en las tablas correspondientes
    DELETE hp FROM HechosPaciente hp
    LEFT JOIN Paciente p ON hp.idPaciente = p.idPaciente
    WHERE p.idPaciente IS NULL;

    DELETE hp FROM HechosPaciente hp
    LEFT JOIN DimDoctor d ON hp.idDoctor = d.idDoctor
    WHERE d.idDoctor IS NULL;

    DELETE hp FROM HechosPaciente hp
    LEFT JOIN DimEnfermero e ON hp.idEnfermero = e.idEnfermero
    WHERE e.idEnfermero IS NULL;

    DELETE hp FROM HechosPaciente hp
    LEFT JOIN DimPadecimiento pd ON hp.idPadecimiento = pd.idPadecimiento
    WHERE pd.idPadecimiento IS NULL;

    DELETE hp FROM HechosPaciente hp
    LEFT JOIN DimMedicamento m ON hp.idMedicamento = m.idMedicamento
    WHERE m.idMedicamento IS NULL;
END //

DELIMITER ;



SET SQL_SAFE_UPDATES = 0;
CALL ProcesarDatos();
SET SQL_SAFE_UPDATES = 1;
