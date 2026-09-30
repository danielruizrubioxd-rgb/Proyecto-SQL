-- ==============================================================================
-- PROYECTO 4: CONSULTAS SQL (INTRODUCCIÓN A BASES DE DATOS)
-- Base de datos: Bookings
-- ==============================================================================
-- Configuración inicial de sesión
SET client_encoding = 'UTF8';
SET search_path TO bookings, public;

-- ==============================================================================
-- EJERCICIOS OBLIGATORIOS
-- ==============================================================================
-- ------------------------------------------------------------------------------
-- EJERCICIO 1: Vuelos e identificadores con status 'On Time'
-- ------------------------------------------------------------------------------
SELECT 
    flight_id, 
    route_no, 
    status 
FROM 
    flights 
WHERE 
    status = 'On Time';


-- ------------------------------------------------------------------------------
-- EJERCICIO 2: Reservas con cantidad total mayor a 1,000,000 de rublos
-- ------------------------------------------------------------------------------
SELECT 
    * 
FROM 
    bookings 
WHERE 
    total_amount > 1000000;


-- ------------------------------------------------------------------------------
-- EJERCICIO 3: Modelos de aviones disponibles
-- ------------------------------------------------------------------------------
SELECT 
    * 
FROM 
    airplanes_data;


-- ------------------------------------------------------------------------------
-- EJERCICIO 4: Identificadores de vuelo en Boeing 737 (Código = 7M7)
-- ------------------------------------------------------------------------------
SELECT DISTINCT
    f.flight_id, 
    f.route_no,
    r.airplane_code
FROM 
    flights f
JOIN 
    routes r ON f.route_no = r.route_no
WHERE 
    r.airplane_code = '7M7';


-- ------------------------------------------------------------------------------
-- EJERCICIO 5: Tickets comprados por personas llamadas Irina
-- (Uso de ILIKE para evitar problemas de mayúsculas/minúsculas)
-- ------------------------------------------------------------------------------
SELECT 
    * 
FROM 
    tickets 
WHERE 
    passenger_name ILIKE '%irina%';


-- ==============================================================================
-- EJERCICIOS OPCIONALES / DE PRÁCTICA
-- ==============================================================================
-- ------------------------------------------------------------------------------
-- EJERCICIO 6: Ciudades con más de un aeropuerto
-- (Extracción del campo JSON 'city' para mayor claridad)
-- ------------------------------------------------------------------------------
SELECT 
    city->>'en' AS ciudad, 
    COUNT(*) AS total_aeropuertos
FROM 
    airports_data
GROUP BY 
    city->>'en'
HAVING 
    COUNT(*) > 1;


-- ------------------------------------------------------------------------------
-- EJERCICIO 7: Número de vuelos por modelo de avión
-- ------------------------------------------------------------------------------
SELECT 
    r.airplane_code, 
    COUNT(f.flight_id) AS total_vuelos
FROM 
    flights f
JOIN 
    routes r ON f.route_no = r.route_no
GROUP BY 
    r.airplane_code
ORDER BY 
    total_vuelos DESC;


-- ------------------------------------------------------------------------------
-- EJERCICIO 8: Reservas con más de un billete (varios pasajeros)
-- ------------------------------------------------------------------------------
SELECT 
    book_ref, 
    COUNT(*) AS total_billetes
FROM 
    tickets
GROUP BY 
    book_ref
HAVING 
    COUNT(*) > 1;


-- ------------------------------------------------------------------------------
-- EJERCICIO 9: Vuelos con retraso de salida superior a una hora
-- ------------------------------------------------------------------------------
SELECT 
    flight_id, 
    route_no, 
    scheduled_departure, 
    actual_departure,
    (actual_departure - scheduled_departure) AS tiempo_retraso
FROM 
    flights
WHERE 
    actual_departure > scheduled_departure + INTERVAL '1 hour';