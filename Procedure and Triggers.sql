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
    
