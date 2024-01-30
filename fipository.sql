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

-- Inserción de registros de ejemplo
INSERT INTO Usuario VALUES ('Usuario1', 100, 'correo1@example.com', 'contraseña1', 'Masculino', NULL, FALSE);
INSERT INTO Usuario VALUES ('Usuario2', 80, 'correo2@example.com', 'contraseña2', 'Femenino', NULL, TRUE);

INSERT INTO Repositorio VALUES ('Repo1', '2024-01-30', 'Usuario1');
INSERT INTO Repositorio VALUES ('Repo2', '2024-01-29', 'Usuario2');

INSERT INTO Usuario_Repositorio VALUES ('Usuario1', 'Repo1');
INSERT INTO Usuario_Repositorio VALUES ('Usuario2', 'Repo2');

INSERT INTO Solicita_Acceso (nombre_usuario, nombre_repositorio) VALUES ('Usuario1', 'Repo2');
INSERT INTO Solicita_Acceso (nombre_usuario, nombre_repositorio) VALUES ('Usuario2', 'Repo1');

-- Ejemplo de inserción de archivo con datos binarios (LONGBLOB)
INSERT INTO Archivo VALUES ('Archivo1', '2024-01-30', 0x546869732069732061206c6f6e67626c6f622e, FALSE, 'Repo1', NULL, NULL);

-- Ejemplo de inserción de carpeta con datos binarios (LONGBLOB)
INSERT INTO Archivo VALUES ('Carpeta1', '2024-01-29', NULL, TRUE, 'Repo2', 2, NULL);

-- Ejemplo de inserción de fichero con datos binarios (LONGBLOB)
INSERT INTO Archivo VALUES ('Fichero1', '2024-01-29', NULL, FALSE, 'Repo2', NULL, 500.25);

-- Ejemplo de inserción de partida y palabra
INSERT INTO Palabra (veces_acertadas, palabra) VALUES (3, 'Palabra1');
INSERT INTO Partida (fecha_juego, nombre_usuario, cod_palabra) VALUES ('2024-02-01', 'Usuario1', 1);
