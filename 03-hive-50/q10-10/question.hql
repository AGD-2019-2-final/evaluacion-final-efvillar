-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS temporal;
CREATE TABLE temporal AS
SELECT  temp1 FROM t0
    LATERAL VIEW explode(c3) ss as temp1, temp2;


DROP TABLE IF EXISTS temporal1;
CREATE TABLE temporal1 AS
SELECT  temp1, count(temp1) FROM temporal
    GROUP BY temp1;


INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
STORED AS TEXTFILE
Select * FROM temporal1;