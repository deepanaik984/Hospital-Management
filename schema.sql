CREATE DATABASE hospital_management;
USE hospital_management;
SELECT datbase();

CREATE TABLE patients(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
age INT,
gender VARCHAR(10),
disease VARCHAR(100)
);

CREATE TABLE doctors(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
specialization VARCHAR(50)
);

CREATE TABLE appointments(
id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
doctor_id INT,
appointment_date DATE,
FOREIGN KEY(patient_id) REFERENCES patients(id),
FOREIGN KEY(doctor_id)vREFERENCES doctors(id)
);
