-- Total Patients
SELECT COUNT(*) AS total_patients
FROM patients;

-- Total Doctors
SELECT COUNT(*) AS total_doctors
FROM doctors;

-- Total Appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- Most Visited Doctor
SELECT d.id, d.name, COUNT(a.id) AS total_visits
FROM doctors d
JOIN appointments a ON d.id = a.doctor_id
GROUP BY d.id, d.name
ORDER BY total_visits DESC LIMIT 1;

-- Patients Per Doctor
SELECT d.name, COUNT(a.patient_id)
FROm doctors d
LEFT JOIN appointments a ON d.id=a.doctor_id
GROUP BY d.name;

-- Daily Patient Count
SELECT appointment_date, COUNT(*)
FROM appointments
GROUP BY appointment_date;

-- Most Common Disease
SELECT disease, COUNT(*)
FROM patients
GROUP BY disease
ORDER BY COUNT(*) DESC LIMIT 1;

-- Disease-wise Count
SELECT disease, COUNT(*)
FROM patients
GROUP BY disease;

-- Female Patients
SELECT COUNT(*) 
FROM patients
WHERE gender='Female';

-- Male Patients
SELECT COUNT(*)
FROM patients
WHERE gender='Male';

-- Patients Above Age 30
SELECT *
FROM patients
WHERE age>30;

-- Appointment Details (JOIN)
SELECT p.name, d.name, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id;

-- Appointments on 2026-03-02
SELECT *
FROM appointments 
WHERE appointment_date='2026-03-02';

-- Doctors With Least Patients
SELECT d.id, d.name, COUNT(a.id) AS total
FROM doctors d
LEFT JOIN appointments a ON d.id = a.doctor_id
GROUP BY d.id, d.name
ORDER BY total ASC LIMIT 1;

-- Monthly Appointments
SELECT MONTH(appointment_date), COUNT(*)
FROM appointments
GROUP BY MONTH(appointment_date); 

-- Using Subquery
SELECT name
FROM doctors
WHERE id = (
		SELECT doctor_id
        FROM appointments
        GROUP BY doctor_id
        ORDER BY COUNT(*) DESC LIMIT 1
);

-- Find Patients Who Have Appointments
SELECT name
FROM patients
WHERE id IN (
		SELECT patient_id 
        FROM appointments
);

-- Patients Above Average age
SELECT name, age
FROM patients
WHERE age > (
		SELECT AVG(age)
        FROM patients
);

-- Doctors Who Treated More Than One Patient
SELECT name
FROM doctors d
WHERE EXISTS (
		SELECT 1
        FROM appointments a
        WHERE a.doctor_id = d.id
        GROUP BY a.doctor_id
        HAVING COUNT(*) > 1
);

-- Delete
DELETE FROM patients;
		OR
DELETE FROM patients
WHERE id=1;
    
-- Truncate
TRUNCATE TABLE patients;

-- Clear Database
DROP DATABASE hospital_management;
