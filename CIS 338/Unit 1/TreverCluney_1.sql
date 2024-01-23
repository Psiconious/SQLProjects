/*
* Name: Trever Cluney
* Date: 08/30/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 1 hands on assignments part II
*/

--Hands-On Assignments--

--1--
SELECT d.firstname, d.lastname, p.pledgedate, p.pledgeamt
FROM dd_pledge p JOIN dd_donor d
USING (IDDONOR)
WHERE p.paymonths = 0
ORDER BY d.firstname, d.lastname, p.pledgedate;

--2--
SELECT d.firstname, d.lastname, p.pledgedate, p.pledgeamt, (p.pledgeamt/p.paymonths) AS "Monthly Payment"
FROM dd_pledge p JOIN dd_donor d
USING (IDDONOR)
WHERE p.paymonths = 12
ORDER BY d.firstname, d.lastname, p.pledgedate;

--3--
SELECT DISTINCT idproj, projname
FROM dd_project pj 
JOIN dd_pledge pl
USING (idproj)
ORDER BY idproj;

--4--
SELECT d.iddonor, d.firstname, d.lastname, COUNT(d.iddonor) AS "# of pledges"
FROM dd_pledge p 
JOIN dd_donor d
ON p.iddonor = d.iddonor
GROUP BY d.iddonor, d.firstname, d.lastname
ORDER BY iddonor;

--5--
SELECT *
FROM dd_pledge p
WHERE p.pledgedate < '08-MAR-2012';
