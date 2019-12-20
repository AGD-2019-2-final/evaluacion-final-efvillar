-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' using PigStorage('\t') AS (columna1:chararray,columna2:chararray,columna3:int);
x = FOREACH datos GENERATE FLATTEN(TOKENIZE(columna2)) AS data;
y = GROUP x BY data;
z = FOREACH y GENERATE group, COUNT(x);
zz = LIMIT z 7;

STORE zz INTO './output' using PigStorage('\t');
