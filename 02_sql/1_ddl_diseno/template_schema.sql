-- =========================
-- MISION A - Diseño Normalizado 3FN
-- =========================

CREATE TABLE CLIENTES (
    Cliente_ID INT PRIMARY KEY,
    Cliente_Nombre VARCHAR(255),
    Cliente_Email VARCHAR(255)
);

CREATE TABLE PRODUCTOS (
    Producto_ID INT PRIMARY KEY,
    Producto VARCHAR(255),
    Precio_Unitario DECIMAL(10,2),
    Categoria VARCHAR(100)
);

CREATE TABLE SUCURSAL (
    Sucursal_ID INT PRIMARY KEY,
    Sucursal VARCHAR(255),
    Ciudad_Sucursal VARCHAR(100)
);

CREATE TABLE VENTAS (
    Transaccion_ID INT PRIMARY KEY,
    Cantidad INT,
    Fecha_Venta DATE,
    Cliente_ID INT,
    Producto_ID INT,
    Sucursal_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES CLIENTES(Cliente_ID),
    FOREIGN KEY (Producto_ID) REFERENCES PRODUCTOS(Producto_ID),
    FOREIGN KEY (Sucursal_ID) REFERENCES SUCURSAL(Sucursal_ID)
);
