CREATE DATABASE tiendaplantas;
GO
USE tiendaplantas;
GO

CREATE TABLE categorias (
    idCategoria INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    idProducto  INT IDENTITY(1,1) PRIMARY KEY,
    nombre      VARCHAR(50)   NOT NULL,
    precio      DECIMAL(10,2) NOT NULL,
    idCategoria INT NOT NULL,
    CONSTRAINT FK_productos_categorias
        FOREIGN KEY (idCategoria) REFERENCES categorias(idCategoria)
);
GO

INSERT INTO categorias (descripcion) VALUES
 ('Interior'),
 ('Exterior'),
 ('Suculentas y cactus'),
 ('Aromáticas');

INSERT INTO productos (nombre, precio, idCategoria) VALUES
 ('Monstera',  18500, 1),
 ('Potus',      6500, 1),
 ('Lavanda',    7200, 2),
 ('Laurel',     3800, 4),
 ('Aloe vera',  5500, 3),
 ('Romero',     4900, 4),
 ('Helecho',    3000, 1);
GO

SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria
FROM productos p
JOIN categorias c ON c.idCategoria = p.idCategoria
ORDER BY p.nombre;
