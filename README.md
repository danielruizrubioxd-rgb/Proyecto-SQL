# Proyecto 4: Consultas SQL - Introducción a Bases de Datos

Resolución de consultas y ejercicios SQL aplicados a la base de datos relacional de la aerolínea **Bookings (Demo Postgres)**.
---

## Tecnologías Utilizadas
* **Base de Datos:** PostgreSQL
* **Herramientas:** `psql`, VSCode, Git & GitHub

---

## Ejercicios Resueltos (`IntroBBDD.sql`)

### Parte 1: Ejercicios Principales
1. **Estado de Vuelos:** Listar vuelos y rutas marcados como `'On Time'`.
2. **Monto de Reservas:** Buscar reservas que superen 1,000,000 de rublos.
3. **Flota de Aviones:** Mostrar todos los modelos de la tabla `airplanes_data`.
4. **Vuelos del Boeing 737:** Encontrar los vuelos operados con el modelo **Boeing 737** (`7M7`).
5. **Búsqueda de Pasajeros:** Buscar billetes del pasajero **Irina** usando `ILIKE` para no distinguir mayúsculas/minúsculas.

### Parte 2: Ejercicios de Ampliación
6. **Ciudades con Varios Aeropuertos:** Agrupar ciudades con más de un aeropuerto activo (`GROUP BY` + `HAVING`).
7. **Conteo por Avión:** Contar el total de vuelos que ha realizado cada aeronave.
8. **Reservas con Varios Billetes:** Detectar códigos de reserva asociados a múltiples billetes.
9. **Filtro de Demoras:** Filtrar vuelos cuya salida se haya retrasado más de 1 hora usando intervalos de tiempo.

---
##  Como Ejecutar el Proyecto
1. Clonar este repositorio:
```bash
git clone https://github.com/danielruizrubioxd-rgb/Proyecto-SQL.git
```

2. Conectarse a PostgreSQL en tu terminal:
```bash
psql -U postgres -d demo
```

3. Ejecutar el script con todas las consultas:
```sql
\i IntroBBDD.sql
```

---
**Autor:** Daniel Ruiz
