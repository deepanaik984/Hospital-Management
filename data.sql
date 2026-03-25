INSERT INTO patients(name, age, gender, disease) VALUES
('Ravi', 25, 'Male', 'Fever'),
('Anita', 30, 'Female', 'Diabetes'),
('Kiran;, 40, 'Male', 'Heart'),
('Sneha', 22, 'Female', 'Fever');

INSERT INTO doctors(name, specialization) VALUES
('Dr. Sharma', 'General'),
('Dr.Mehta', 'Cardiology');

INSERT INTO appointments(patient_id, doctor_id, appointment_date) VALUES
(1, 1, '2026-03-01'),
(2, 1, '2026-03-02'),
(3, 2, '2026-03-02'),
(4, 1, '2026-03-03');
