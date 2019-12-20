-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' using PigStorage('\t') AS (columna1:chararray,columna2:chararray,columna3:chararray);
x = FOREACH datos GENERATE REPLACE(columna3, '\\u005D', '') AS data;
y = FOREACH x GENERATE REPLACE(data, '\\u005B', '') AS data;
z = FOREACH y GENERATE REPLACE(data, '\\d', '') AS data;
z = FOREACH z GENERATE REPLACE(data, '#', '') AS data;
z = FOREACH z GENERATE FLATTEN(TOKENIZE(data,',')) AS data;
z = GROUP z BY $0;
z = FOREACH z GENERATE group, COUNT(z);

STORE z INTO './output' using PigStorage(',');
