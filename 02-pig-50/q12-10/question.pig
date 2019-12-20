-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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
datos = FOREACH datos GENERATE surname AS surname;
datos1 = FILTER datos BY (surname) matches '.*D.*' 
or surname matches '.*E.*' 
or surname matches '.*F.*' 
or surname matches '.*G.*'
or surname matches '.*H.*'
or surname matches '.*I.*'
or surname matches '.*J.*'
or surname matches '.*K.*'
; 

STORE datos1 INTO './output' using PigStorage(',');