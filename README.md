# 🛒 Supermarket Sales Analysis

En este proyecto se presenta el análisis de ventas de un supermercado ficticio con el objetivo del análisis es extraer información valiosa a través de consultas en SQL y visualizaciones de los resultados con un dashboard interactivo en Looker Studio. Abarca fechas desde enero 2023 hasta junio 2025.

---

## Objetivos del proyecto

- Analizar ingresos y utilidad total del negocio
- Detectar los productos más rentables y con mayor utilidad
- Identificar a los clientes más y menos valiosos por utilidad generada
- Visualizar el comportamiento temporal de las ventas y utilidades
- Crear un dashboard interactivo, claro y profesional para toma de decisiones

---

## Herramientas utilizadas

- **MySQL**: consultas y agregaciones de datos
- **Looker Studio**: visualización de datos y construcción del dashboard
- **Google Sheets**: limpieza y preparación de los datos

---

## Consultas realizadas en SQL

Puedes ver las consultas SQL en el archivo [`sql_queries.sql`](sql_queries.sql)

---

## Visualizaciones incluidas en el dashboard

- Indicadores clave: ingresos, utilidad, total de productos, total de clientes
- Top 10 productos por utilidad y por margen
- Análisis de utilidad mensual por año
- Clientes con mayor y menor utilidad generada
- Filtros interactivos por rango de fechas y categoría de producto

---

## Vista previa

![Vista previa del dashboard](screenshots/dashboard-overview.png) 


---

## Vista en linea
🔗 **[Ver dashboard en línea](https://lookerstudio.google.com/reporting/dadadcde-f922-4a88-96cf-bbf7d6fb6a0b)**  

---

## PRINCIPALES CONCLUSIONES

A continuación, menciono algunos de los hallazgos obtenidos al realizar el análisis de la tienda:

- La utilidad bruta obtenida entre 2023 y 2025 representa el 66% de los ingresos totales.
- Los 10 productos que generaron mayor utilidad son muy similares a los 10 productos con mayor margen (precio - costo); las únicas diferencias corresponden a:
  - WiFi Enabled Smart Light Switch
  - Handmade Wooden Utensil Set
  - Roasted Garlic Butter

  Sobre estos productos, la empresa podría implementar campañas para incrementar sus ventas, aprovechando que presentan un alto margen unitario y, por lo tanto, pueden contribuir significativamente a aumentar la utilidad bruta del negocio.
- La utilidad promedio generada por cliente es de $2,134.49. Sin embargo, al analizar a los **clientes top**, observamos que generan más de $4,000 en utilidad, mientras que algunos clientes no superan los $1,000. Esto sugiere oportunidades para implementar programas de fidelización que impulsen el consumo de todos los clientes en la tienda.
- El año 2024 tuvo el mejor desempeño con más de $80,000 en utilidad. Es importante considerar que los datos de 2025 solo abarcan el primer semestre; por ello, se recomienda realizar un nuevo análisis con la información completa al finalizar el año para confirmar si la utilidad mantiene una tendencia creciente.







