/* 1º consulta
Quantitat de registres de la taula de vols. */
SELECT COUNT(*) FROM flights;
/*----------------------------------------*/

/* 2º consulta 
Retard promig de sortida i arribada segons l’aeroport origen.*/
SELECT Origin As Origen, AVG(ArrDelay) As Promedio_llegada, AVG(DepDelay) As Promedio_Salida
FROM flights
GROUP BY Origin;
/*----------------------------------------*/

/* 3º consulta 
Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen.*/
SELECT Origin, colYear, colMonth, AVG(ArrDelay)
FROM flights
GROUP BY flightID
ORDER BY Origin, colYear, colMonth;
/*----------------------------------------*/

/* 4º consulta 
Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen 
(mateixa consulta que abans i amb el mateix ordre). 
Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.*/
SELECT City, colYear, colMonth, AVG(ArrDelay)
FROM flights
LEFT JOIN usairports
  ON flights.Origin = usairports.IATA
GROUP BY flightID
ORDER BY City, colYear, colMonth, ArrDelay;
/*----------------------------------------*/

/* 5º consulta 
Les companyies amb més vols cancelats, per mesos i any. 
A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.*/
SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) As total_Cancelled
FROM flights
GROUP BY UniqueCarrier, colMonth, colYear
ORDER BY total_Cancelled DESC;
/* --------------------------------------- */

/* 6º consulta
L’identificador dels 10 avions que més distància han recorregut fent vols.
*/
SELECT TailNum, SUM(Distance) As totalDistance
FROM flights WHERE TailNum LIKE 'N%'
GROUP BY TailNum
ORDER BY totalDistance DESC LIMIT 10;
/* --------------------------------------- */


/* 7º consulta
Companyies amb el seu retard promig només d’aquelles les quals els seus vols
 arriben al seu destí amb un retràs promig major de 10 minuts.
*/
SELECT UniqueCarrier, AVG(ArrDelay) As avgDelay
FROM flights
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay)>10
ORDER BY avgDelay DESC;



