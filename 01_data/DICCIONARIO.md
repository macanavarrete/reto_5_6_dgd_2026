
# Diccionario de Datos Originales

| Campo | Descripción | Problema a Resolver |
| --- | --- | --- |
| `Cliente_Nombre` | Nombre del comprador | Aparece en mayúsculas y minúsculas. Normalizar. |
| `Cliente_Email` | Identificador único lógico | Se repite en cada compra. Mover a tabla Clientes. |
| `Producto` | Nombre del item | Texto repetido. Mover a tabla Productos. |
| `Categoria` | Clasificación | Depende del producto. Evaluar si requiere tabla propia. |
| `Sucursal` | Nombre de la tienda | Texto repetido. Mover a tabla Sucursales. |
| `Ciudad_Sucursal` | Ubicación | Dependencia transitiva de Sucursal. |
| EOF |  |  |

echo "✅ Datos crudos y diccionario generados."

# ------------------------------------------------------------------------------

# 5. GENERACIÓN DE PLANTILLAS DE CÓDIGO (SCAFFOLDING)

# ------------------------------------------------------------------------------

# Template DDL (Parte A)

cat << 'EOF' > "$PROJECT_DIR/02_sql/1_ddl_diseno/template_schema.sql"
/*
RETO PARTE A: DISEÑO DEL ESQUEMA RELACIONAL
Estudiante: [Tu Nombre]
Fecha: [Fecha]

```
INSTRUCCIONES:
1.  Crea la base de datos si no existe.
2.  Define las tablas maestras primero (las que no dependen de nadie).
3.  Define las tablas transaccionales al final.

```

*/

-- CREATE DATABASE RetoSQL;
-- GO
-- USE RetoSQL;
-- GO

-- =======================================================
-- 1. TABLAS MAESTRAS (Clientes, Productos, Sucursales)
-- =======================================================

-- PISTA: Usa IDENTITY(1,1) para las llaves primarias.
/*
CREATE TABLE Cliente (
ClienteID INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL, -- Constraint de unicidad
...
);
*/

-- =======================================================
-- 2. TABLA TRANSACCIONAL (Ventas)
-- =======================================================

/*
CREATE TABLE Venta (
VentaID INT IDENTITY(1,1) PRIMARY KEY,
Fecha DATETIME DEFAULT GETDATE(),

```
-- LLAVES FORÁNEAS (La magia de la relación)
ClienteID INT,
ProductoID INT,

CONSTRAINT FK_Venta_Cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
...

```

);
*/
