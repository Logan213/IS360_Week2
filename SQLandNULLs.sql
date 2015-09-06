SELECT *
FROM Planes
WHERE SPEED is not NULL
ORDER by SPEED DESC;

SELECT
SUM(distance) AS 'TOTAL DIST'
FROM Flights
WHERE month = 1;

SELECT
SUM(distance) AS 'TOTAL DIST'
FROM Flights
WHERE month = 1 and tailnum is null;

SELECT 
planes.manufacturer, 
SUM(flights.distance) as 'Total Dist'
FROM flights
Inner Join planes 
ON planes.tailnum = flights.tailnum
WHERE flights.month = 7 and flights.day = 5
GROUP BY planes.manufacturer;

SELECT 
planes.manufacturer, 
SUM(flights.distance) as 'Total Dist'
FROM flights
Left Outer Join planes 
ON planes.tailnum = flights.tailnum
WHERE flights.month = 7 and flights.day = 5
GROUP BY planes.manufacturer;

SELECT
month, day, flights.year, flights.origin, dest, airports.name, 
SUM(planes.seats) as 'Total Seats'
FROM flights
LEFT JOIN airports on flights.dest = airports.faa
LEFT JOIN planes on flights.tailnum = planes.tailnum
Where month = 6 and day = 25 and dest = 'LAX' and planes.seats is not NULL
GROUP BY flights.origin;