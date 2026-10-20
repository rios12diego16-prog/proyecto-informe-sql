-- =============================================
-- CAPA BASE DE DATOS: Procedimientos Almacenados (Stored Procedures)
-- Descripción: Lógica transaccional (INSERT, UPDATE, DELETE, SELECT).
-- =============================================

-- Ejemplo de estructura base:
/*
CREATE PROCEDURE sp_InsertarCliente
    @nombre VARCHAR(100),
    @dni CHAR(8)
AS
BEGIN
    INSERT INTO Cliente(nombre, dni) VALUES (@nombre, @dni);
END;
*/