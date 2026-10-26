-- Role Creation and Permission Assignments
CREATE ROLE IF NOT EXISTS 'admin_role';
CREATE ROLE IF NOT EXISTS 'doctor_role';
CREATE ROLE IF NOT EXISTS 'receptionist_role';
CREATE ROLE IF NOT EXISTS 'patient_role';

-- Grant Privileges
GRANT ALL PRIVILEGES ON crownfielddb.* TO 'admin_role';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.appointment TO 'receptionist_role';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.diagnosis TO 'doctor_role';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.prescription TO 'doctor_role';
GRANT SELECT ON crownfielddb.appointment TO 'patient_role';
