/*CONSULTA BÁSICA NO.1: Sabemos que en el mes de diciembre por las festividades muchos llamamos a 
nuestros familiares por lo cuál queremos conocer el promedio de la duración de las llamadas del mes
 de diciembre y tambièn la duración máxima*/
USE calls;
SELECT
    ROUND(AVG(duration),3) AS Average_duration,
    ROUND(STDDEV(duration),3) AS Stardard_dev_duration,
    MAX(duration) AS max_duration
FROM
    megaline_calls
WHERE
    MONTH(call_date) = 12;
    
/*De acuerdo con la consulta anterior podemos calcular el coef. de variación de la duración
de las llamadas en el mes de diciembre el cuál es: 87.81%, lo cuál nos dice que el promedio de las llamadas
no es muy representativo, podemos intuir que existe mucha dispersión entre los datos */    
    
/*CONSULTA BÁSICA NO.2: Conocer el total de llamadas que ha realizado el user_id=1002*/    

USE calls;
SELECT COUNT(id) AS total_calls
FROM megaline_calls
WHERE user_id = 1002 ; 


/*CONSULTA BÁSICA NO.3: Conocer el total de usuarios, edad mínima, máxima y promedio por cada plan*/

use calls;
SELECT 
    plan_name,
    COUNT(*) AS numero_usuarios,
    MIN(age) AS MinEdad,
    ROUND(AVG(age),1) AS edad_promedio,
    MAX(age)
FROM
    megaline_users
GROUP BY plan_name;