-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' using PigStorage('\t') AS (columna1:chararray,columna2:chararray,columna3:chararray);


datos = FOREACH datos GENERATE REPLACE(columna2, '\\u0028', '') AS columna2, REPLACE(columna3, '\\u005D', '') AS columna3;
datos = FOREACH datos GENERATE REPLACE(columna2, '\\u0029', '') AS columna2, REPLACE(columna3, '\\u005B', '') AS columna3;
datos = FOREACH datos GENERATE REPLACE(columna2, '\\u007B', '') AS columna2, REPLACE(columna3, '\\d', '') AS columna3;
datos = FOREACH datos GENERATE REPLACE(columna2, '\\u007D', '') AS columna2, REPLACE(columna3, '#', '') AS columna3;
datos = FOREACH datos GENERATE FLATTEN(TOKENIZE(columna2,',')) AS columna2, FLATTEN(TOKENIZE(columna3,',')) AS columna3;


--datos = FOREACH datos GENERATE TOKENIZE(columna2,',') as columna2, REPLACE(columna3, '\\u005D', '') AS columna3;
--datos = FOREACH datos GENERATE REPLACE(columna2, '\\u0028', '') AS columna2, REPLACE(columna3, '\\u005B', '') AS columna3;
--datos = FOREACH datos GENERATE REPLACE(columna2, '\\u0029', '') AS columna2, REPLACE(columna3, '\\d', '') AS columna3;
--datos = FOREACH datos GENERATE REPLACE(columna2, '\\u007B', '') AS columna2, REPLACE(columna3, '#', '') AS columna3;
--datos = FOREACH datos GENERATE REPLACE(columna2, '\\u007D', '') AS columna2, TOKENIZE(columna3,',') AS columna3;

--datosA = FOREACH datos GENERATE FLATTEN(columna2) AS columna2;
--datosB = FOREACH datos GENERATE FLATTEN(columna3) AS columna3;
--datosA = FOREACH datosA GENERATE REPLACE(columna2, '\\u0028', '') AS columna2;
--datosA = FOREACH datosA GENERATE REPLACE(columna2, '\\u0029', '') AS columna2;
--datosA = FOREACH datosA GENERATE REPLACE(columna2, '\\u007B', '') AS columna2;
--datosA = FOREACH datosA GENERATE REPLACE(columna2, '\\u007D', '') AS columna2;

--datos = CROSS datosA, datosB;
datos = FOREACH datos GENERATE ($0,$1) as data;



datos = GROUP datos BY data;

datos = FOREACH datos GENERATE group, COUNT(datos);


STORE datos INTO './output' using PigStorage('\t');

