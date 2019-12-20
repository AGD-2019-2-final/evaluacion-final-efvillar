--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
datos = LOAD 'truck_event_text_partition.csv' 
using PigStorage(',') AS 
(driverId:INT,
truckId:INT,
eventTime:CHARARRAY,
eventType:CHARARRAY,
longitude:FLOAT,
latitude:FLOAT,
eventKey:CHARARRAY,
correlationId:CHARARRAY,
driverName:CHARARRAY,
routeId:LONG,
routeName:CHARARRAY,
eventDate:CHARARRAY);

y = FOREACH datos generate driverId, truckId, eventTime;
z = LIMIT y 10;
x = ORDER z BY driverId, truckId, eventTime ASC;


STORE x INTO './output' using PigStorage(',');