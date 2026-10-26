SELECT 
c.name AS clinic_Name, COUNT(a.appointment_id) As total_appointments
FROM clinic c
JOIN  appointment a ON c.clinic_id = a.clinic_id
GROUP BY c.clinic_id, c.name
HAVING COUNT(a.appointment_id) > 1;


SELECT 
p.firstname AS patient_first,
p.lastname AS patient_last,
c.firstname AS clinician_first,
c.lastname AS clinician_last,
a.date,
a.time
FROM appointment a 
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN clinician c ON a.clinician_id = c.clinician_id;

SELECT
p.patient_id,
p.firstname,
p.lastname,
f.priority,
f.notes,
f.notes
FROM patient p
LEFT JOIN appointment a ON p.patient_id = a.patient_id
LEFT JOIN follow_up f ON a.appointment_id = f.appointment_id;

SELECT firstname, lastname
FROM clinician
WHERE clinician_id IN (
	SELECT clinician_id 
    FROM appointment
    WHERE appointment_id IN (
		SELECT appointment_id 
        FROM follow_up
        WHERE priority = "Urgent"
        )
);

DROP PROCEDURE IF EXISTS `6_query_my`.GetPatientPrescreptions;
DELIMITER //
CREATE PROCEDURE GetPatientPrescriptions (IN input_patient_id VARCHAR(45))
BEGIN
	SELECT p.patient_id, m.name, m.dose, m.frequency, m.route
    FROM patient p
    JOIN appointment a ON p.patient_id = a.patient_id
    JOIN prescription pr ON a.appointment_id = pr.appointment_id
    JOIN medicines m ON pr.prescreption_id = m.prescription_id
    WHERE p.patient_id = input_patient_id;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER check_followup_priority
BEFORE INSERT ON follow_up
FOR EACH ROW
BEGIN
	IF NEW.priority IS NULL OR NEW.priority =" " THEN
		SET NEW.priority = "Routine" ;
        END IF;
END //
DELIMITER ;
    


