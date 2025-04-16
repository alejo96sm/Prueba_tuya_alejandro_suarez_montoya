# Prueba_tuya_alejandro_suarez_montoya
En este repositorio se almacenará la solucon de los puntos propuestos en la prueba tecnica

Punto uno.
- El objetivo de este punto es lograr navegar entre directorios y subdirectorios, con el objetivo de identificar una lista de archivos html. Una vez identificado esto se desea capturar las imagenes que se logran identificar en el directorio para luego pasarlas a base64 y almacenarlas en un nuevo archivo html
Este codigo fue desarrollado por medio de funciones. La primera llamada obtener_archivos_html recibe un parametro llamado entrada, este parametro es un Path donde se va a buscar carpetas y subcarpetas para encontrar archivos html y así almacenarlos en un array, de esta manera se identifican todos los archivos contenidos en el directorio donde se accedio para la busqueda de estos.



Punto Dos- Transacciones
-Inicialmente se tienen 3 tablas, clientes, Transacciones y categoria consumo. Lo que se desea en esta tarea es hacer una consulta que contenga la informacion del cliente, de las transacciones y de las categorias, para despues buscar las categorias que mas transacciones tienen asignadas.
* para empezar se realiza la consulta inicial donde se agrupan todas las tablas por medio de un Left Join, esto con el objetivo de evidenciar que si se esté seleccionando la informacion que es requerida
* Luego, al verificar que la información que tomamos si es la adecuada procedemos a realizar una subconsulta. en escencia es el mismo Query de la parte uno solo que con un pqueño detalle adicional, Se usa la funcion Row_number over (partition by....) para tomar grupos de particiones asociados a un valor de identificacion, esto con el objetivo de hacer el conteo de las transacciones por categorioa y así ordenarlos de manera descendente, para luego tomar el primer valor y así identificar cual es el valor de categoria por cliente que mas transacciones posee

Punto 3 - Racha
- inicialmente tenemos 2 tablas, historial y retiros. Con base a la informacion del historial se debe categorizar los valores de los saldos segun la logica propuesta, para luego asignar una fecha de corte asignada por nostoros
- Luego con base a la informacion que poseemos debemos contar las rachas, esto se hace de la siguiente manera. Con la informacion que tenemos, se organiza la informacion de identificacion y niveles por orden de fecha, partiendo de esto se cuentan los valores consecutivos de las fechas segun cada identificacion y al realizar el contedo de esto con row number over partition ....., se logra hacer la separacion y el contelo.
- luego realizamos otra sub consulta, esto con el objetivo de realizar el conteo de las rachas anteriores para identificar las rachas mas largas y de esta manera, y comparando con una variable declarada, se pueden indentificar las rachas mayores o iguales al valor que nosotros dentro del codigo proponemos.
