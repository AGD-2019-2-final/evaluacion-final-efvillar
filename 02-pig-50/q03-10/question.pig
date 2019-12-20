-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' using PigStorage('\t') AS (id:chararray,date:chararray,numero:int);
y = ORDER datos BY numero ASC;
x = FOREACH y generate numero;
z = LIMIT x 5;

STORE z INTO './output' using PigStorage('\t');