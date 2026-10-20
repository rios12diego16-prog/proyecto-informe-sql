-- =====================================================================
-- PROYECTO: Sistema de Gestión de Trayectoria Educativa
-- ARCHIVO: 01_creacion_tablas.sql
-- DESCRIPCIÓN: Script DDL para la creación de las tablas relacionales 
--              principales del sistema en SQL Server.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Tabla: institucion_educativa
-- Almacena la información de los planteles educativos registrados.
-- ---------------------------------------------------------------------
CREATE TABLE institucion_educativa (
    id INT IDENTITY(1,1) PRIMARY KEY,                   -- Identificador único de la institución
    codigo_modular VARCHAR(10) NOT NULL UNIQUE,         -- Código modular oficial del colegio
    nombre VARCHAR(150) NOT NULL,                       -- Nombre oficial de la institución educativa
    gestion VARCHAR(50),                                -- Tipo de gestión (Pública, Privada, etc.)
    departamento VARCHAR(50),                           -- Departamento de ubicación
    provincia VARCHAR(50),                              -- Provincia de ubicación
    distrito VARCHAR(50)                                -- Distrito de ubicación
);

-- ---------------------------------------------------------------------
-- 2. Tabla: estudiante
-- Contiene los datos sociodemográficos básicos y anonimizados del alumno.
-- ---------------------------------------------------------------------
CREATE TABLE estudiante (
    id INT IDENTITY(1,1) PRIMARY KEY,                   -- Identificador único del estudiante
    codigo_anonimizado VARCHAR(64) NOT NULL UNIQUE,     -- Hash o código seguro para proteger la identidad
    genero CHAR(1),                                     -- Género del estudiante (M/F)
    anio_nacimiento INT                                 -- Año de nacimiento
);

-- ---------------------------------------------------------------------
-- 3. Tabla: trayectoria_matricula
-- Registra el historial de matrículas por año, nivel y estado del alumno.
-- ---------------------------------------------------------------------
CREATE TABLE trayectoria_matricula (
    id INT IDENTITY(1,1) PRIMARY KEY,                   -- Identificador único del registro de matrícula
    estudiante_id INT NOT NULL,                         -- Relación con la tabla estudiante
    institucion_id INT NOT NULL,                        -- Relación con la tabla institucion_educativa
    anio INT NOT NULL,                                  -- Año lectivo de la matrícula
    nivel VARCHAR(30) NOT NULL,                         -- Nivel educativo (Primaria, Secundaria, etc.)
    grado VARCHAR(20) NOT NULL,                         -- Grado cursado
    estado VARCHAR(30) NOT NULL,                        -- Estado de matrícula (Promovido, Retirado, etc.)
    
    -- Definición de Llaves Foráneas (Foreign Keys)
    FOREIGN KEY (estudiante_id) REFERENCES estudiante(id),
    FOREIGN KEY (institucion_id) REFERENCES institucion_educativa(id)
);
