/*
My First SQL Lesson
Author - Matthew Emery
18/06/2026
*/

-- Querying Surgical Activity
SELECT
    ps.PatientId
    ,ps.Hospital    
    ,ps.Ward    
    ,DATEADD(WEEK, -2, ps.AdmittedDate) AS ReminderDate
    ,ps.AdmittedDate    
    ,ps.DischargeDate  
	,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    ,ps.Tariff
	-- CREATE A COLUMN Budget 50% higher than the Tariff
	,ps.Tariff * 1.5 AS Budget
FROM
    PatientStay ps

WHERE ps.Hospital IN ('Kingston', 'PRUH')
--    AND ps.Ward LIKE '%Surgery'
--    AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-02-29'
ORDER BY ps.Tariff DESC, ps.PatientId DESC

SELECT 
	ps.Hospital
	, ps.Ward
	,COUNT(*) AS NumberOfPatients
	,SUM(ps.Tariff) AS TotalTariff
	,AVG(ps.Tariff) AS AverageTariff
FROM 
	PatientStay ps
	GROUP BY 
	ps.Hospital
	,ps.Ward
	ORDER BY TotalTariff DESC

	SELECT * from PatientStay ps
	SELECT * from DimHospital

	SELECT 
		ps.PatientId
		, ps.Hospital
		, h.HospitalType
		, h.Hospital
	FROM 
		PatientStay ps
	LEFT JOIN 
		DimHospitalBad h
	ON ps.Hospital = h.Hospital
--	WHERE h.HospitalType = 'Teaching'

SELECT * FROM DimHospitalBad
SELECT * FROM DimHospital