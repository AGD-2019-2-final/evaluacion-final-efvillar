-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
-- salida.
-- 
--    1971-07-08,08,8,jue,jueves
--    1974-05-23,23,23,jue,jueves
--    1973-04-22,22,22,dom,domingo
--    1975-01-29,29,29,mie,miercoles
--    1974-07-03,03,3,mie,miercoles
--    1974-10-18,18,18,vie,viernes
--    1970-10-05,05,5,lun,lunes
--    1969-02-24,24,24,lun,lunes
--    1974-10-17,17,17,jue,jueves
--    1975-02-28,28,28,vie,viernes
--    1969-12-07,07,7,dom,domingo
--    1973-12-24,24,24,lun,lunes
--    1970-08-27,27,27,jue,jueves
--    1972-12-12,12,12,mar,martes
--    1970-07-01,01,1,mie,miercoles
--    1974-02-11,11,11,lun,lunes
--    1973-04-01,01,1,dom,domingo
--    1973-04-29,29,29,dom,domingo
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
SUBSTRING(birthday,8,10) as columna2,
(int) SUBSTRING(birthday,8,10) as columna3, ToString(ToDate(birthday),'E') as columna4, 
ToString(ToDate(birthday),'E') as columna5;


datosA = FOREACH datos1 GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Mon', 'lun') AS columna4,
 REPLACE(columna5, 'Mon', 'lunes') AS columna5;

datosA = FOREACH datosA GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Tue', 'mar') AS columna4,
 REPLACE(columna5, 'Tue', 'martes') AS columna5;

datosA = FOREACH datosA GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Wed', 'mie') AS columna4,
 REPLACE(columna5, 'Wed', 'miercoles') AS columna5;

datosA = FOREACH datosA GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Thu', 'jue') AS columna4,
 REPLACE(columna5, 'Thu', 'jueves') AS columna5;

datosA = FOREACH datosA GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Fri', 'vie') AS columna4,
 REPLACE(columna5, 'Fri', 'viernes') AS columna5;

datosA = FOREACH datosA GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Sat', 'sab') AS columna4,
 REPLACE(columna5, 'Sat', 'sabado') AS columna5;

datosA = FOREACH datosA GENERATE columna1, columna2, columna3, REPLACE(columna4, 'Sun', 'dom') AS columna4,
 REPLACE(columna5, 'Sun', 'domingo') AS columna5;

STORE datosA INTO './output' using PigStorage(',');
