<?php
session_start();
require '../model/db.php'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $errors = [];

   
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format.";
    }

    
    if (strlen($password) < 6) {
        $errors[] = "Password must be at least 6 characters.";
    }

    if (empty($errors)) {
        
        $db = new myDB();
        $connection = $db->openCon();

        
        $stmt = $connection->prepare("SELECT * FROM employee WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        
        if ($result && $result->num_rows === 1) {
            $user = $result->fetch_assoc();

         
            if (password_verify($password, $user['Password'])) {
                
                $_SESSION['employee_logged_in'] = true;
                $_SESSION['employee'] = [
                    'id' => $user['employee_id'], 
                    'email' => $user['email'],
                ];
                
                header("Location: ../view/Employee_Dashboard.php");
                exit();
            } else {
                $errors[] = "Invalid email or password.";
            }
        } else {
            $errors[] = "Invalid email or password.";
        }

        $stmt->close();
        $db->closeCon($connection);
    }

   
    if (!empty($errors)) {
        foreach ($errors as $error) {
            echo "<p>$error</p>";
        }
    }
} else {
  
    header("Location: ../view/login.php");
    exit();
}

?>
