-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- crea la carpeta input in el HDFS

-- fs -mkdir input

-- copia los archivos del sistema local al HDFS
-- fs -put input/

datos = LOAD 'data.tsv' using PigStorage('\t') AS (id:chararray,date:chararray,numero:chararray);
y = GROUP datos BY $0;
z = FOREACH y GENERATE group, COUNT(datos);
STORE z INTO './output' using PigStorage('\t');
--dump datos;
