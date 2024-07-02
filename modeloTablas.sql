DROP DATABASE IF EXISTS health;
CREATE DATABASE health;
use health;


-- Crear tablas de dimensiones
CREATE TABLE DimPersona (
    idPersona INT PRIMARY KEY,
    NombreCompleto VARCHAR(255),
    Domicilio VARCHAR(255),
    CodigoPostal VARCHAR(10),
    Nacionalidad VARCHAR(50),
    Telefono VARCHAR(15)
);

CREATE TABLE DimMedicamento (
    idMedicamento INT PRIMARY KEY,
    Marca VARCHAR(50),
    NombreMedicamento VARCHAR(100)
);

CREATE TABLE DimDoctor (
    idDoctor INT PRIMARY KEY,
    Cedula VARCHAR(20),
    NumeroDoctor VARCHAR(50),
    Horario VARCHAR(255),
    idPersona INT,
    FOREIGN KEY (idPersona) REFERENCES DimPersona(idPersona)
);

CREATE TABLE DimEnfermero (
    idEnfermero INT PRIMARY KEY,
    Titulo VARCHAR(50),
    NumeroEnfermero VARCHAR(50),
    Horario VARCHAR(255),
    idPersona INT,
    FOREIGN KEY (idPersona) REFERENCES DimPersona(idPersona)
);

CREATE TABLE DimPadecimiento (
    idPadecimiento INT PRIMARY KEY,
    Descripcion TEXT,
    Gravedad VARCHAR(50)
);

-- Crear tabla Paciente
CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY,
    NumeroPaciente VARCHAR(50),
    Altura DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Sangre VARCHAR(3),
    idPersona INT,
    FOREIGN KEY (idPersona) REFERENCES DimPersona(idPersona)
);

-- Crear tabla de hechos
CREATE TABLE HechosPaciente (
    idPaciente INT,
    idDoctor INT,
    idEnfermero INT,
    idPadecimiento INT,
    idMedicamento INT,
    FechaDiagnostico DATE,
    Cantidad INT,
    Altura DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Sangre VARCHAR(3),
    PRIMARY KEY (idPaciente, idPadecimiento, FechaDiagnostico),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idDoctor) REFERENCES DimDoctor(idDoctor),
    FOREIGN KEY (idEnfermero) REFERENCES DimEnfermero(idEnfermero),
    FOREIGN KEY (idPadecimiento) REFERENCES DimPadecimiento(idPadecimiento),
    FOREIGN KEY (idMedicamento) REFERENCES DimMedicamento(idMedicamento)
);


