/*
RETO PARTE A: DISEÑO DEL ESQUEMA RELACIONAL
Estudiante: [Maria Camila Navarrete Pinzón]
Fecha: [19 Enero 2026]

```
INSTRUCCIONES:
1.  Crea la base de datos si no existe.
2.  Define las tablas maestras primero (las que no dependen de nadie).
3.  Define las tablas transaccionales al final.

```
SOLUCIÓN: 

En el archivo raw_sales_dump.cvs se presentan diferentes inconsistencias de diversas índoles.
Inicialmente se evidencian 200 registros en la base, sin embargo solo se encuentran 20 correos únicos, lo que indica que la información esta repetida. Por otro lado, el mismo cliente aparece múltiples veces (tal vez porque compra varias veces), no obstante, no hay un ID único de cada cliente, solo de la transacción.
En un análisis mas general se puede evidenciar que las variables no están estandarizadas lo que dificulta el proceso estadístico, como por ejemplo el uso de las tildes, o los formatos de textos mixtos (mayúsculas, miúsculas, fecha larga, corta). Todo esto ralentiza el modelado y análisis de información.

Para hacer la misión A se definieron las siguientes tablas:

1. CLIENTES
- Cliente_Nombre
- Cliente_Email

2. PRODUCTOS
- Producto
- Precio_Unitario
- Categoria

3. VENTAS
- Cantidad
- Fecha_Venta
- Transaccion_ID

4. SUCURSAL
- Sucursal
- Ciudad_Sucursal  

*/

-- CREATE DATABASE RetoSQL;
-- GO
-- USE RetoSQL;
-- GO

-- Tabla CLIENTES
CREATE TABLE CLIENTES (
    Cliente_ID INT PRIMARY KEY,
    Cliente_Nombre VARCHAR(255),
    Cliente_Email VARCHAR(255)
);

-- Tabla PRODUCTOS
CREATE TABLE PRODUCTOS (
    Producto_ID INT PRIMARY KEY,
    Producto VARCHAR(255),
    Precio_Unitario DECIMAL(10,2),
    Categoria VARCHAR(100)
);

-- Tabla SUCURSAL
CREATE TABLE SUCURSAL (
    Sucursal_ID INT PRIMARY KEY,
    Sucursal VARCHAR(255),
    Ciudad_Sucursal VARCHAR(100)
);

-- Tabla VENTAS
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
*/
