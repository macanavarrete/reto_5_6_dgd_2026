/*
MISIÓN B: LABORATORIO DE PERFORMANCE - RETO 5 COMPLETADO
Objetivo: Comparar CROSS JOIN vs INNER JOIN
*/

-- PASO 0: PREPARACIÓN
-- Activa las estadísticas para ver la "sangre" del servidor
SET STATISTICS IO ON;  -- Muestra lecturas de disco
SET STATISTICS TIME ON; -- Muestra tiempo de CPU

PRINT '>>> INICIO DEL BENCHMARK <<<';

-- =======================================================
-- ESCENARIO 1: LA CONSULTA TÓXICA (CROSS JOIN)
-- =======================================================
PRINT '--- EJECUTANDO CROSS JOIN (Producto Cartesiano) ---';

-- Esta consulta combina TODOS los clientes con TODOS los productos.
-- Si tienes 5 clientes y 5 productos, traerá 25 filas.
-- Si tienes 1 millón de clientes... bueno, ya sabes.

SELECT 
    v.Transaccion_ID,
    c.Cliente_Nombre
FROM VENTAS v
CROSS JOIN CLIENTES c;

-- PREGUNTA DE ANÁLISIS:
-- ¿Cuántos "Logical Reads" muestra la pestaña Messages?
-- ¿Por qué el número de filas es Mayor que la tabla de ventas real?

-- =======================================================
-- ESCENARIO 2: LA CONSULTA EFICIENTE (INNER JOIN)
-- =======================================================
PRINT '--- EJECUTANDO INNER JOIN (Ventas Reales) ---';

-- Esta consulta usa la FK para unir solo lo que existe.

SELECT 
    v.Transaccion_ID,
    c.Cliente_Nombre
FROM VENTAS v
INNER JOIN CLIENTES c
    ON v.Cliente_ID = c.Cliente_ID;

-- COMPARACIÓN:
-- Mira los Logical Reads aquí. Deberían ser drásticamente menores.

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
