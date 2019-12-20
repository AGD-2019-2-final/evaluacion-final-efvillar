-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

CREATE DATABASE IF NOT EXISTS datos;

--DROP TABLE IF EXISTS tabla_datos;

DROP TABLE tabla_datos;
CREATE TABLE tabla_datos (columna1 STRING, columna2 STRING, columna3 INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';


--LOAD DATA INPATH "/tmp/q01/data.tsv" OVERWRITE INTO TABLE tabla_datos;
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE tabla_datos;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT DISTINCT columna3 FROM tabla_datos 
    ORDER BY columna3
    LIMIT 5;
