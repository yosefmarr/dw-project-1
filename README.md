# Data Warehouse - Project # 1

## Intrucciones:

El archivo SuperStoreOutput.csv contiene varios años de las ventas de una cadena de Supermercados, similar al ejemplo visto en clase.
Se requiere que construya un Data Warehouse para almacenar los datos de ventas. Recuerde documentar las decisiones de diseño que toma en cada etapa del proceso.

Para hacerlo, debe realizar lo siguiente:

1. Analizar los datos para identificar la granularidad
2. Identificar y describir las dimensiones del modelo.
   2.1 Describir que atributos de las dimensiones deben tener control de cambios y que estrategia utilizaría para convertir la dimension a slow changing dimension.
3. Construir el DDL del modelo estrella.
4. Utilizar Tableau Prep para realizar la carga de inicial de datos de las dimensiones.
   4.1 Cargar la dimensión de Fechas del archivo de fechas adjunto.
   4.2 Puntos Extra: Crear el procedimiento para al menos un atributo de una slow changing dimension.
5. Con las dimensiones cargadas, llenar la tabla de hechos.
   5.1 Para simplificar, puede utilizar un solo atributo de tiempo que se relacione con la dimensión de tiempo.
   5.2 Puntos extra: Utilizar dos atributos de tiempo en la tabla de hechos (Investigar role-playing dimensions)
   5.3 Definir como utilizara el Order ID.
6. Cargar su modelo dimensional en Tableau Desktop y realice análisis exploratorio de datos.

Debe entregar 5 archivos en un zip:

1. Documento en PDF con todas las secciones de un proyecto formal, incluir la información solo de los integrantes que participaron en el Proyecto. Identifica la granularidad, las dimensiones y decisiones de diseño.
2. Archivo SQL con el DDL
3. Archivo(s) de Tableau Prep con procesos de ETL.
4. Archivo de backup de su base de datos.
5. Archivo de tableau desktop con análisis exploratorio del modelo dimensional (exportar el packaged workbook)
