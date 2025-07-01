-- Crear base de datos 
CREATE DATABASE DashboardVentas;
GO

-- Usar la base de datos
USE DashboardVentas;
GO

-- Tabla de Categorías
CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100)
);

-- Tabla de Productos
CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    IdCategoria INT FOREIGN KEY REFERENCES Categorias(IdCategoria),
    Precio DECIMAL(10, 2)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY IDENTITY,
    Fecha DATE,
    IdEmpleado INT FOREIGN KEY REFERENCES Empleados(IdEmpleado),
    Total DECIMAL(10, 2)
);

-- Tabla Detalles de Ventas
CREATE TABLE DetallesVenta (
    IdDetalle INT PRIMARY KEY IDENTITY,
    IdVenta INT FOREIGN KEY REFERENCES Ventas(IdVenta),
    IdProducto INT FOREIGN KEY REFERENCES Productos(IdProducto),
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2)
);

-- Insertar Categorías
INSERT INTO Categorias (Nombre) VALUES
('Electrónica'),
('Hogar'),
('Ropa'),
('Juguetes'),
('Librería');

-- Insertar Productos
INSERT INTO Productos (Nombre, IdCategoria, Precio) VALUES
('Televisor', 1, 50000),
('Celular', 1, 30000),
('Notebook', 1, 90000),
('Heladera', 2, 70000),
('Lavarropas', 2, 60000),
('Remera', 3, 5000),
('Pantalón', 3, 8000),
('Muñeca', 4, 4500),
('Auto de Juguete', 4, 6500),
('Cuaderno', 5, 1200),
('Lápices de colores', 5, 700);

-- Insertar Empleados
INSERT INTO Empleados (Nombre) VALUES
('Carlos Pérez'),
('Lucía Gómez'),
('Ana Torres'),
('Diego Martínez');

-- Insertar Ventas
INSERT INTO Ventas (Fecha, IdEmpleado, Total) VALUES
('2024-01-03', 1, 30000),
('2024-01-10', 2, 5000),
('2024-01-20', 3, 90000),
('2024-02-05', 4, 4500),
('2024-02-15', 1, 70000),
('2024-03-02', 2, 1200),
('2024-03-05', 3, 60000),
('2024-03-10', 1, 8000),
('2024-03-15', 4, 700),
('2024-03-25', 2, 50000),
('2024-04-12', 3, 6500),
('2024-05-01', 1, 30000),
('2024-05-07', 2, 90000),
('2024-05-14', 3, 1200),
('2024-05-20', 4, 5000),
('2024-05-30', 1, 8000),
('2024-06-03', 2, 50000),
('2024-06-20', 3, 700),
('2024-07-12', 4, 70000),
('2024-08-01', 1, 60000),
('2024-08-08', 2, 4500),
('2024-08-15', 3, 70000),
('2024-08-22', 4, 8000),
('2024-09-04', 1, 90000),
('2024-09-12', 2, 6500),
('2024-09-26', 3, 1200),
('2024-10-10', 4, 50000),
('2024-11-03', 1, 5000),
('2024-11-12', 2, 70000),
('2024-11-20', 3, 4500),
('2024-11-28', 4, 30000),
('2024-12-01', 1, 8000),
('2024-12-10', 2, 50000),
('2024-12-20', 3, 700),
('2024-12-28', 4, 90000),
('2025-01-08', 1, 30000),
('2025-01-20', 2, 90000),
('2025-02-05', 3, 5000),
('2025-02-15', 4, 4500),
('2025-02-25', 1, 70000),
('2025-03-10', 2, 1200),
('2025-03-28', 3, 60000),
('2025-04-12', 4, 8000),
('2025-04-22', 1, 700),
('2025-05-03', 2, 50000),
('2025-06-06', 3, 6500),
('2025-06-18', 4, 30000),
('2025-06-28', 1, 90000),
('2025-07-05', 2, 5000),
('2025-07-20', 3, 8000),
('2025-08-02', 4, 70000),
('2025-08-22', 1, 60000),
('2025-09-04', 2, 4500),
('2025-09-18', 3, 50000),
('2025-10-05', 4, 5000),
('2025-10-28', 1, 700),
('2025-11-02', 2, 90000),
('2025-11-20', 3, 1200),
('2025-12-03', 4, 70000),
('2025-12-29', 1, 30000),
('2026-01-10', 1, 50000),
('2026-01-15', 2, 12000),
('2026-02-05', 3, 60000),
('2026-02-18', 4, 7000),
('2026-03-03', 1, 30000),
('2026-03-17', 2, 10000),
('2026-04-10', 3, 42000),
('2026-04-25', 4, 13000),
('2026-05-05', 1, 90000),
('2026-05-20', 2, 7200),
('2026-06-01', 3, 8000),
('2026-06-15', 4, 20000),
('2026-07-08', 1, 70000),
('2026-07-25', 2, 16000),
('2026-08-04', 3, 5800),
('2026-08-22', 4, 13000),
('2026-09-02', 1, 55000),
('2026-09-18', 2, 11000),
('2026-10-06', 3, 9100),
('2026-10-20', 4, 50000),
('2026-11-10', 1, 40000),
('2026-11-22', 2, 8000),
('2026-12-01', 3, 10000),
('2026-12-15', 4, 70000),
('2026-12-29', 1, 30000);

-- Insertar Detalles 
INSERT INTO DetallesVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario) VALUES
(1, 2, 1, 30000),
(2, 6, 1, 5000),
(3, 3, 1, 90000),
(4, 8, 1, 4500),
(5, 4, 1, 70000),
(6, 10, 1, 1200),
(7, 5, 1, 60000),
(8, 7, 1, 8000),
(9, 11, 1, 700),
(10, 1, 1, 50000),
(11, 9, 1, 6500),
(12, 2, 1, 30000),
(13, 3, 1, 90000),
(14, 10, 1, 1200),
(15, 6, 1, 5000),
(16, 7, 1, 8000),
(17, 1, 1, 50000),
(18, 11, 1, 700),
(19, 4, 1, 70000),
(20, 5, 1, 60000),
(21, 8, 1, 4500),
(22, 4, 1, 70000),
(23, 7, 1, 8000),
(24, 3, 1, 90000),
(25, 9, 1, 6500),
(26, 10, 1, 1200),
(27, 1, 1, 50000),
(28, 6, 1, 5000),
(29, 4, 1, 70000),
(30, 8, 1, 4500),
(31, 2, 1, 30000),
(32, 7, 1, 8000),
(33, 1, 1, 50000),
(34, 11, 1, 700),
(35, 3, 1, 90000),
(36, 2, 1, 30000),
(37, 3, 1, 90000),
(38, 6, 1, 5000),
(39, 8, 1, 4500),
(40, 4, 1, 70000),
(41, 10, 1, 1200),
(42, 5, 1, 60000),
(43, 7, 1, 8000),
(44, 11, 1, 700),
(45, 1, 1, 50000),
(46, 9, 1, 6500),
(47, 2, 1, 30000),
(48, 3, 1, 90000),
(49, 6, 1, 5000),
(50, 7, 1, 8000),
(51, 4, 1, 70000),
(52, 5, 1, 60000),
(53, 8, 1, 4500),
(54, 1, 1, 50000),
(55, 6, 1, 5000),
(56, 11, 1, 700),
(57, 3, 1, 90000),
(58, 10, 1, 1200),
(59, 4, 1, 70000),
(60, 2, 1, 30000),
(61, 2, 1, 50000),
(62, 10, 1, 12000),
(63, 5, 1, 60000),
(64, 11, 10, 700),
(65, 2, 1, 30000),
(66, 7, 1, 10000),
(67, 3, 1, 42000),
(68, 9, 2, 6500),
(69, 3, 1, 90000),
(70, 11, 10, 720),
(71, 6, 1, 8000),
(72, 8, 4, 5000),
(73, 4, 1, 70000),
(74, 7, 2, 8000),
(75, 8, 1, 5800),
(76, 9, 2, 6500),
(77, 1, 1, 55000),
(78, 10, 1, 11000),
(79, 11, 13, 700),
(80, 1, 1, 50000),
(81, 5, 1, 40000),
(82, 7, 1, 8000),
(83, 10, 1, 10000),
(84, 4, 1, 70000),
(85, 2, 1, 30000);

-- STORED PROCEDURES
-- Ventas por mes
CREATE PROCEDURE VentasPorMes
AS
BEGIN
    SELECT 
        FORMAT(Fecha, 'yyyy-MM') AS Mes,
        SUM(Total) AS TotalVentas
    FROM Ventas
    WHERE YEAR(Fecha) = YEAR(GETDATE())
    GROUP BY FORMAT(Fecha, 'yyyy-MM')
    ORDER BY Mes
END

-- Productos por categoría
CREATE PROCEDURE ProductosPorCategoria
AS
BEGIN
    SELECT 
        c.Nombre AS Categoria,
        SUM(dv.Cantidad) AS TotalVendidos
    FROM DetallesVenta dv
    JOIN Productos p ON dv.IdProducto = p.IdProducto
    JOIN Categorias c ON p.IdCategoria = c.IdCategoria
    GROUP BY c.Nombre
    ORDER BY TotalVendidos DESC
END

-- Ventas por empleado
CREATE PROCEDURE VentasPorEmpleado
AS
BEGIN
    SELECT 
        e.Nombre AS Empleado,
        SUM(v.Total) AS TotalVendido
    FROM Ventas v
    JOIN Empleados e ON v.IdEmpleado = e.IdEmpleado
    GROUP BY e.Nombre
    ORDER BY TotalVendido DESC
END

-- Comparación ventas anual vs año anterior
CREATE PROCEDURE ComparacionVentasAnual
AS
BEGIN
    DECLARE @anioActual INT = YEAR(GETDATE());
    DECLARE @anioAnterior INT = @anioActual - 1;

    SELECT 
        MONTH(Fecha) AS Mes,
        YEAR(Fecha) AS Anio,
        SUM(Total) AS Total
    FROM Ventas
    WHERE YEAR(Fecha) IN (@anioActual, @anioAnterior)
    GROUP BY YEAR(Fecha), MONTH(Fecha)
    ORDER BY Mes, Anio
END