-- Creación de la base de datos
-- CREATE DATABASE Fipository;


-- Creación de la tabla Usuario
CREATE OR REPLACE TABLE Usuario (
    nombre_usuario VARCHAR(25) PRIMARY KEY,
    password_usuario VARCHAR(16) NOT NULL,
    nombre_completo VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(30) NOT NULL,
    segundo_apellido VARCHAR(30) NOT NULL,
    reputacion INT DEFAULT 0,
    correo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    genero VARCHAR(25) NOT NULL,
    foto VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    admin BOOLEAN NOT NULL
);

-- Creación de la tabla Repositorio
CREATE OR REPLACE TABLE Repositorio (
    nombre_usuario VARCHAR(25) NOT NULL,
    nombre_repositorio VARCHAR(25) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_creacion DATE NOT NULL,
    PRIMARY KEY (nombre_usuario, nombre_repositorio)
);

-- Creación de la tabla Solicita_Acceso
CREATE OR REPLACE TABLE Solicita_Acceso (
    cod_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(25) NOT NULL,
    nombre_repositorio VARCHAR(25) NOT NULL
);

-- Creación de la tabla Reporte
CREATE OR REPLACE TABLE Reporte (
    cod_reporte INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(25) NOT NULL,
    usuario_reportado VARCHAR(25) NOT NULL,
    fecha_reporte DATE NOT NULL
);

-- Creación de la tabla Colaboradores
CREATE OR REPLACE TABLE Colaboradores (
    nombre_usuario_colaborador VARCHAR(25),
    nombre_usuario_colaborado VARCHAR(25),
    nombre_repositorio_colaborado VARCHAR(25),
    PRIMARY KEY (nombre_usuario_colaborador, nombre_usuario_colaborado, nombre_repositorio_colaborado)
);

-- Creación de la tabla Archivo (supertabla)
CREATE OR REPLACE TABLE Archivo (
    nombre_archivo VARCHAR(255),
    fecha_creacion DATE NOT NULL,
    carpeta BOOLEAN NOT NULL,
    nombre_usuario VARCHAR(25),
    nombre_repositorio VARCHAR(25),
    num_archivos INT NOT NULL,  -- Este atributo es específico de la tabla Carpeta
    peso DECIMAL(10, 2) NOT NULL,  -- Este atributo es específico de la tabla Fichero
    CHECK (carpeta = FALSE AND num_archivos IS NULL AND peso IS NULL OR carpeta = TRUE AND num_archivos IS NOT NULL AND peso IS NULL OR carpeta = FALSE AND num_archivos IS NULL AND peso IS NOT NULL),
    PRIMARY KEY (nombre_usuario, nombre_repositorio, nombre_archivo)
);

-- Creación de la tabla Opinion (relación N:M entre Repositorio y Usuario)
CREATE OR REPLACE TABLE Opinion (
    nombre_usuario VARCHAR(25),
    nombre_usuario_opinado VARCHAR(25),
    nombre_repositorio VARCHAR(25),
    estrella INT,
    valoracion TEXT, 
    PRIMARY KEY (nombre_usuario_opinado, nombre_repositorio)
);

-- Creación de la tabla Accion
CREATE OR REPLACE TABLE AccionSobreUsuario (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario_afectado VARCHAR(25),
    tipo VARCHAR(25)
);

CREATE OR REPLACE TABLE AccionSobreRepositorio (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario_afectado VARCHAR(25),
    codigo_repositorio_afectado VARCHAR(25),
    tipo VARCHAR(25)
);

CREATE OR REPLACE TABLE AccionSobreArchivo (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario_afectado VARCHAR(25),
    nombre_archivo VARCHAR(255),
    codigo_repositorio_afectado VARCHAR(25),
    tipo VARCHAR(25)
);

-- Creación de la tabla Realiza (relación 1:N entre Usuario y Accion)
CREATE OR REPLACE TABLE Realiza (
    nombre_usuario VARCHAR(25),
    codigo_accion INT,
    fecha_realizacion DATE,
    tipo_accion VARCHAR(25),
    PRIMARY KEY (nombre_usuario, codigo_accion, fecha_realizacion)
);