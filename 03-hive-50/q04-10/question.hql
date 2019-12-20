-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne los valores únicos de la columna `t0.c5` 
-- (ordenados). 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS temporal;
CREATE TABLE temporal AS
SELECT  c5[0] as data1,  c5[1] as data2,  c5[0] as data3
--SELECT c5
FROM tbl0;
--LATERAL VIEW explode(c5) asTable AS resultado;

DROP TABLE IF EXISTS temporal1;
CREATE TABLE temporal1 AS
SELECT data1 FROM temporal
union all select data2 from temporal
union all select data3 from temporal
;


INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE

select distinct * from temporal1
;
    --ORDER BY data;
    --LIMIT 5;
