-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- se crea el esquema de la tabla
--hdfs dfs -copyFromLocal data.tsv  /tmp/q01/


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
SELECT columna1, count(columna1) FROM tabla_datos 
    GROUP BY Columna1;