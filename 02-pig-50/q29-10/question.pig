-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
datos = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = FOREACH datos GENERATE birthday as birthday;

datos1 = FOREACH datos GENERATE birthday as columna1, 
SUBSTRING(birthday,5,7) as columna2,
SUBSTRING(birthday,5,7) as columna3,
SUBSTRING(birthday,5,7) as columna4;

datosA = FOREACH datos1 GENERATE columna1, columna2, REPLACE(columna3, '01', 'ene') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2,REPLACE(columna3, '02', 'feb') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '03', 'mar') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '04', 'abr') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '05', 'may') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '06', 'jun') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '07', 'jul') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '08', 'ago') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '09', 'sep') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '10', 'oct') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, columna2, REPLACE(columna3, '11', 'nov') AS columna3, columna4;
datosA = FOREACH datosA GENERATE columna1, REPLACE(columna3, '12', 'dic') AS columna3, columna2, (int) columna4;



STORE datosA INTO './output' using PigStorage(',');