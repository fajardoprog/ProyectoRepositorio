-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Fipository;
USE Fipository;

-- Creación de la tabla Usuario

CREATE TABLE Usuario (
    nombre VARCHAR(255) PRIMARY KEY,
    reputacion INT,
    correo VARCHAR(255),
    contraseña VARCHAR(255),
    genero VARCHAR(10),
    foto BLOB,
    admin BOOLEAN
);

-- Creación de la tabla Repositorio
CREATE TABLE Repositorio (
    nombre_repositorio VARCHAR(255) PRIMARY KEY,
    fecha_creacion DATE,
    propietario_nombre VARCHAR(255),
    FOREIGN KEY (propietario_nombre) REFERENCES Usuario(nombre) ON DELETE CASCADE
);

-- Relación de muchos a muchos entre Usuario y Repositorio
CREATE TABLE Usuario_Repositorio (
    nombre_usuario VARCHAR(255),
    nombre_repositorio VARCHAR(255),
    PRIMARY KEY (nombre_usuario, nombre_repositorio),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (nombre_repositorio) REFERENCES Repositorio(nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Solicita_Acceso
CREATE TABLE Solicita_Acceso (
    cod_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(255),
    nombre_repositorio VARCHAR(255),
    FOREIGN KEY (nombre_usuario, nombre_repositorio) REFERENCES Usuario_Repositorio(nombre_usuario, nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Archivo (supertabla)
CREATE TABLE Archivo (
    nombre_archivo VARCHAR(255) PRIMARY KEY,
    fecha_creacion DATE,
    contenido LONGBLOB,
    carpeta BOOLEAN,
    nombre_repositorio VARCHAR(255),
    num_archivos INT,  -- Este atributo es específico de la tabla Carpeta
    peso DECIMAL(10, 2),  -- Este atributo es específico de la tabla Fichero
    CHECK (carpeta = FALSE AND num_archivos IS NULL AND peso IS NULL OR carpeta = TRUE AND num_archivos IS NOT NULL AND peso IS NULL OR carpeta = FALSE AND num_archivos IS NULL AND peso IS NOT NULL),
    FOREIGN KEY (nombre_repositorio) REFERENCES Repositorio(nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Partida
CREATE TABLE Partida (
    cod_partida INT AUTO_INCREMENT PRIMARY KEY,
    fecha_juego DATE,
    nombre_usuario VARCHAR(255),
    cod_palabra INT,
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (cod_palabra) REFERENCES Palabra(cod_palabra) ON DELETE CASCADE
);

-- Creación de la tabla Palabra
CREATE TABLE Palabra (
    cod_palabra INT AUTO_INCREMENT PRIMARY KEY,
    veces_acertadas INT,
    palabra VARCHAR(255)
);

-- Creación de la tabla Opinion (relación N:M entre Repositorio y Usuario)
CREATE TABLE Opinion (
    nombre_usuario VARCHAR(255),
    nombre_repositorio VARCHAR(255),
    estrella INT,
    valoracion TEXT,
    PRIMARY KEY (nombre_usuario, nombre_repositorio),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (nombre_repositorio) REFERENCES Repositorio(nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Accion
CREATE TABLE Accion (
    codigoAccion INT PRIMARY KEY,
    tipo VARCHAR(255)
);

-- Creación de la tabla Realiza (relación 1:N entre Usuario y Accion)
CREATE TABLE Realiza (
    nombre_usuario VARCHAR(255),
    codigoAccion INT,
    fecha_realizacion DATE,
    PRIMARY KEY (nombre_usuario, codigoAccion),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (codigoAccion) REFERENCES Accion(codigoAccion) ON DELETE CASCADE
);
