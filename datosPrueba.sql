-- Datos ficticios para DimPersona
INSERT INTO DimPersona (idPersona, NombreCompleto, Domicilio, CodigoPostal, Nacionalidad, Telefono) VALUES
(1, 'Juan Perez', 'Calle Falsa 123', '12345', 'Mexicana', '555-1234'),
(2, 'Maria Lopez', 'Av. Siempre Viva 742', '67890', 'Mexicana', '555-5678'),
(3, 'Carlos Ruiz', 'Calle Luna 456', '54321', 'Mexicana', '555-8765');

-- Datos ficticios para DimMedicamento
INSERT INTO DimMedicamento (idMedicamento, Marca, NombreMedicamento) VALUES
(1, 'Pfizer', 'Paracetamol'),
(2, 'Bayer', 'Aspirina'),
(3, 'Moderna', 'Ibuprofeno');

-- Datos ficticios para DimDoctor
INSERT INTO DimDoctor (idDoctor, Cedula, NumeroDoctor, Horario, idPersona) VALUES
(1, 'D001', '1001', 'Lunes a Viernes 9am-5pm', 1),
(2, 'D002', '1002', 'Lunes a Viernes 10am-6pm', 2),
(3, 'D003', '1003', 'Lunes a Viernes 8am-4pm', 3);

-- Datos ficticios para DimEnfermero
INSERT INTO DimEnfermero (idEnfermero, Titulo, NumeroEnfermero, Horario, idPersona) VALUES
(1, 'Licenciado', 'E001', 'Lunes a Viernes 9am-5pm', 1),
(2, 'Técnico', 'E002', 'Lunes a Viernes 10am-6pm', 2),
(3, 'Licenciado', 'E003', 'Lunes a Viernes 8am-4pm', 3);

-- Datos ficticios para DimPadecimiento
INSERT INTO DimPadecimiento (idPadecimiento, Descripcion, Gravedad) VALUES
(1, 'Hipertensión', 'Alta'),
(2, 'Diabetes', 'Media'),
(3, 'Asma', 'Baja');

-- Datos ficticios para Paciente
INSERT INTO Paciente (idPaciente, NumeroPaciente, Altura, Peso, Sangre, idPersona) VALUES
(1, 'P001', 1.75, 70.5, 'O+', 1),
(2, 'P002', 1.62, 60.2, 'A-', 2),
(3, 'P003', 1.80, 80.3, 'B+', 3);

-- Datos ficticios para HechosPaciente
INSERT INTO HechosPaciente (idPaciente, idDoctor, idEnfermero, idPadecimiento, idMedicamento, FechaDiagnostico, Cantidad, Altura, Peso, Sangre) VALUES
(1, 1, 1, 1, 1, '2023-01-01', 2, 1.75, 70.5, 'O+'),
(2, 2, 2, 2, 2, '2023-02-01', 1, 1.62, 60.2, 'A-'),
(3, 3, 3, 3, 3, '2023-03-01', 3, 1.80, 80.3, 'B+');
