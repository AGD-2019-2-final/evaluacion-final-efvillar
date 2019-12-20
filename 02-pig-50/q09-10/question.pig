-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.csv' using PigStorage(',') AS (columna1:int,columna2:chararray,columna3:chararray,
                                                columna4:chararray,columna5:chararray,columna6:int);

datos = FOREACH datos GENERATE columna2 as columna2, columna3 as columna3;

datos = FOREACH datos GENERATE CONCAT(columna2,'@',columna3);

STORE datos INTO './output' using PigStorage('\t');