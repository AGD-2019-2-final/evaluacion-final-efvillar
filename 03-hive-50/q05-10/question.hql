-- 
-- Pregunta
-- ===========================================================================
--
-- Realice una consulta que compute la cantidad de veces que aparece cada valor 
-- de la columna `t0.c5`  por año.
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
SELECT  c5[0] as data1,  c5[1] as data2,  c5[2] as data3,
c5[3] as data4, c5[4] as data5, YEAR(c4) as anno
FROM tbl0;




DROP TABLE IF EXISTS temporal1;
CREATE TABLE temporal1 AS
SELECT anno, data1 as final  FROM temporal
union all select anno, data2 as final from temporal
union all select anno, data3 as final from temporal
union all select anno, data4 as final from temporal
union all select anno, data5 as final from temporal
;


DROP TABLE IF EXISTS temporal2;
CREATE TABLE temporal2 AS
select anno, final from temporal1
where final <> '\\N';


INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
--Select * FROM temporal2;

select anno, final, count(final) from temporal2
GROUP BY anno, final

;

