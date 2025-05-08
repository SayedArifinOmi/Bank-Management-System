<?php 

include '../model/db.php';

$errors = [];


if (isset($_POST['schedule_appointment'])) {
   
    $customer_id = $_POST['customer_id'];
    $employee_id = $_POST['employee_id'];
    $appointment_date = $_POST['appointment_date'];
    $appointment_time = $_POST['appointment_time'];
    $service_type = $_POST['service_type'];

    
    if (empty($customer_id) || !is_numeric($customer_id) || $customer_id <= 0) {
        $errors[] = "Customer ID must be a valid positive number.";
    }

    
    if (empty($employee_id) || !is_numeric($employee_id) || $employee_id <= 0) {
        $errors[] = "Employee ID must be a valid positive number.";
    }

 
    if (empty($appointment_date)) {
        $errors[] = "Appointment date is required.";
    } elseif (strtotime($appointment_date) < time()) {
        $errors[] = "Appointment date must be in the future.";
    }

    
    if (empty($appointment_time)) {
        $errors[] = "Appointment time is required.";
    }

  
    if (empty($service_type)) {
        $errors[] = "Please select a service type.";
    }

    
    if (!empty($errors)) {
        echo "<ul>";
        foreach ($errors as $error) {
            echo "<li>" . $error . "</li>";
        }
        echo "</ul>";
        exit;
    }

   
    $db = new myDB();
    $connection = $db->openCon();

   
    $result = $db->scheduleAppointment($customer_id, $employee_id, $appointment_date, $appointment_time, $service_type, $connection);

   
    if ($result) {
       
        echo "<p>Appointment scheduled successfully!</p>";
        echo "<a href='../view/employee_dashboard.php'>Back to Dashboard</a>";
    } else {
       
        echo "<p>Failed to schedule appointment. Please try again later.</p>";
        echo "<a href='../view/schedule_appointment.php'>Try Again</a>";
    }

  
    $db->closeCon($connection);
}
?>

