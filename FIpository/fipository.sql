-- TODO: Arreglar tabla solicitar

-- Creación de la base de datos
-- CREATE DATABASE Fipository;


-- Creación de la tabla Usuario
CREATE OR REPLACE TABLE Usuario (
    nombre VARCHAR(25) PRIMARY KEY,
    reputacion INT,
    correo VARCHAR(50),
    contraseña VARCHAR(16),
    genero VARCHAR(10),
    foto VARCHAR(50),
    admin BOOLEAN
);

-- Creación de la tabla Repositorio
CREATE OR REPLACE TABLE Repositorio (
    nombre_usuario VARCHAR(25),
    nombre_repositorio VARCHAR(25),
    PRIMARY KEY (nombre_usuario, nombre_repositorio),
    fecha_creacion DATE,
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE
);

-- Creación de la tabla Solicita_Acceso
CREATE OR REPLACE TABLE Solicita_Acceso (
    -- Arreglar
    cod_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(25),
    nombre_repositorio VARCHAR(25),
    FOREIGN KEY (nombre_usuario, nombre_repositorio) REFERENCES Repositorio(nombre_usuario, nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Colaboradores
CREATE OR REPLACE TABLE Colaboradores (
    nombre_usuario_colaborador VARCHAR(25),
    nombre_usuario_colaborado VARCHAR(25),
    nombre_repositorio_colaborado VARCHAR(25),
    PRIMARY KEY (nombre_usuario_colaborador, nombre_usuario_colaborado, nombre_repositorio_colaborado),
    FOREIGN KEY (nombre_usuario_colaborador) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (nombre_usuario_colaborado, nombre_repositorio_colaborado) REFERENCES Repositorio(nombre_usuario, nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Archivo (supertabla)
CREATE OR REPLACE TABLE Archivo (
    nombre_archivo VARCHAR(255),
    fecha_creacion DATE,
    carpeta BOOLEAN,
    nombre_usuario VARCHAR(25),
    nombre_repositorio VARCHAR(25),
    num_archivos INT,  -- Este atributo es específico de la tabla Carpeta
    peso DECIMAL(10, 2),  -- Este atributo es específico de la tabla Fichero
    CHECK (carpeta = FALSE AND num_archivos IS NULL AND peso IS NULL OR carpeta = TRUE AND num_archivos IS NOT NULL AND peso IS NULL OR carpeta = FALSE AND num_archivos IS NULL AND peso IS NOT NULL),
    PRIMARY KEY (nombre_usuario, nombre_repositorio, nombre_archivo),
    FOREIGN KEY (nombre_usuario, nombre_repositorio) REFERENCES Repositorio(nombre_usuario, nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Palabra
CREATE OR REPLACE TABLE Palabra (
    cod_palabra INT AUTO_INCREMENT PRIMARY KEY,
    veces_acertadas INT,
    palabra VARCHAR(10)
);

-- Creación de la tabla Partida
CREATE OR REPLACE TABLE Partida (
    cod_partida INT AUTO_INCREMENT PRIMARY KEY,
    fecha_juego DATE,
    nombre_usuario VARCHAR(25),
    cod_palabra INT,
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (cod_palabra) REFERENCES Palabra(cod_palabra) ON DELETE CASCADE
);


-- Creación de la tabla Opinion (relación N:M entre Repositorio y Usuario)
CREATE OR REPLACE TABLE Opinion (
    nombre_usuario VARCHAR(25),
    nombre_usuario_opinado VARCHAR(25),
    nombre_repositorio VARCHAR(25),
    estrella INT,
    valoracion TEXT,
    PRIMARY KEY (nombre_usuario_opinado, nombre_repositorio),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    FOREIGN KEY (nombre_usuario_opinado, nombre_repositorio) REFERENCES Repositorio(nombre_usuario, nombre_repositorio) ON DELETE CASCADE
);

-- Creación de la tabla Accion
CREATE OR REPLACE TABLE AccionSobreUsuario (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario_afectado VARCHAR(25),
    FOREIGN KEY (codigo_usuario_afectado) REFERENCES Usuario(nombre) ON DELETE CASCADE,
    tipo VARCHAR(25)
);

CREATE OR REPLACE TABLE AccionSobreRepositorio (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario_afectado VARCHAR(25),
    codigo_repositorio_afectado VARCHAR(25),
    FOREIGN KEY (codigo_usuario_afectado, codigo_repositorio_afectado) REFERENCES Repositorio(nombre_usuario, nombre_repositorio) ON DELETE CASCADE,
    tipo VARCHAR(25)
);

CREATE OR REPLACE TABLE AccionSobreArchivo (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario_afectado VARCHAR(25),
    nombre_archivo VARCHAR(255),
    codigo_repositorio_afectado VARCHAR(25),
    FOREIGN KEY (codigo_usuario_afectado, codigo_repositorio_afectado, nombre_archivo) REFERENCES Archivo(nombre_usuario, nombre_repositorio, nombre_archivo) ON DELETE CASCADE,
    tipo VARCHAR(25)
);

CREATE OR REPLACE TABLE AccionSobrePartida (
    codigo_accion INT AUTO_INCREMENT PRIMARY KEY,
    cod_partida_afectada INT,
    FOREIGN KEY (cod_partida_afectada) REFERENCES Partida(cod_partida) ON DELETE CASCADE
);

-- Creación de la tabla Realiza (relación 1:N entre Usuario y Accion)
CREATE OR REPLACE TABLE Realiza (
    nombre_usuario VARCHAR(25),
    codigo_accion INT,
    fecha_realizacion DATE,
    tipo_accion VARCHAR(25),
    PRIMARY KEY (nombre_usuario, codigo_accion, fecha_realizacion),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuario(nombre) ON DELETE CASCADE
);
