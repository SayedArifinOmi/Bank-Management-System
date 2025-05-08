<?php 
session_start();
include '../Model/db.php'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $errors = [];
    $formData = []; 

    
    if (isset($_POST['firstName'], $_POST['lastName']) && 
        preg_match("/^[a-zA-Z]+$/", $_POST['firstName']) && 
        preg_match("/^[a-zA-Z]+$/", $_POST['lastName'])) {
        $formData['firstName'] = $_POST['firstName'];
        $formData['lastName'] = $_POST['lastName'];
    } else {
        $errors[] = "Full Name must contain only letters.";
    }

   
    if (isset($_POST['dob']) && !empty($_POST['dob'])) {
        $dob = $_POST['dob'];
        if ($dob > date("Y-m-d")) {
            $errors[] = "Date of Birth cannot be in the future.";
        } else {
            $formData['dob'] = $dob;
        }
    } else {
        $errors[] = "Date of Birth is required.";
    }

    
    if (isset($_POST['email']) && filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) && str_ends_with($_POST['email'], ".com")) {
        $formData['email'] = $_POST['email'];
    } else {
        $errors[] = "Email must be valid and end with '.com'.";
    }

   
    if (isset($_POST['phone']) && preg_match("/^\d{10,12}$/", $_POST['phone'])) {
        $formData['phone'] = $_POST['phone'];
    } else {
        $errors[] = "Phone Number must be between 10 and 12 digits.";
    }

    
    if (isset($_POST['nid']) && preg_match("/^\d{6,20}$/", $_POST['nid'])) {
        $formData['nid'] = $_POST['nid'];
    } else {
        $errors[] = "NID must contain only numbers and be between 6 and 20 digits.";
    }

    
    if (isset($_POST['gender']) && ($_POST['gender'] == "male" || $_POST['gender'] == "female")) {
        $formData['gender'] = $_POST['gender'];
    } else {
        $errors[] = "Gender is required.";
    }

    
    if (isset($_POST['password']) && preg_match("/[0-9]/", $_POST['password'])) {
        $formData['password'] = $_POST['password']; 
    } else {
        $errors[] = "Password must contain at least one number.";
    }

    
    if (isset($_POST['confirmPassword']) && $_POST['confirmPassword'] === $_POST['password']) {
        $formData['confirmPassword'] = $_POST['confirmPassword'];
    } else {
        $errors[] = "Passwords do not match.";
    }

    
    if ($errors) {
        foreach ($errors as $error) {
            echo "<p>$error</p>";
        }
    } else {
        
        $db = new myDB();
        $connection = $db->openCon();

       
        $email = $formData['email'];
        $sql_check = "SELECT * FROM employee WHERE Email = ?";
        $stmt_check = $connection->prepare($sql_check);
        $stmt_check->bind_param("s", $email);
        $stmt_check->execute();
        $result_check = $stmt_check->get_result();

        
        if ($result_check->num_rows > 0) {
            echo "<p>Error: Email already exists. Please try another one.</p>";
            $stmt_check->close();
            $db->closeCon($connection);
        } else {
            
            $name = $formData['firstName'] . ' ' . $formData['lastName'];
            $dob = $formData['dob'];
            $phone = $formData['phone'];
            $nid = $formData['nid'];
            $gender = $formData['gender'];
            $password = password_hash($formData['password'], PASSWORD_DEFAULT); 

            
            $sql_insert = "INSERT INTO employee (Name, Email, Password, Gender, Phone, NID, DOB) 
                           VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt_insert = $connection->prepare($sql_insert);

            if ($stmt_insert) {
                $stmt_insert->bind_param("sssssss", $name, $email, $password, $gender, $phone, $nid, $dob);

                if ($stmt_insert->execute())
                 {
                
                    
                    $newUser = [
                        'firstName' => $formData['firstName'],
                        'lastName' => $formData['lastName'],
                        'dob' => $formData['dob'],
                        'email' => $formData['email'],
                        'phone' => $formData['phone'],
                        'nid' => $formData['nid'],
                        'gender' => $formData['gender']
                    ];

                   
                    $filePath = '../data/userdata.json';
                    if (file_exists($filePath)) {
                      
                        $currentData = json_decode(file_get_contents($filePath), true);
                    } else {
                        $currentData = [];
                    }

                   
                    $currentData[] = $newUser;

                    
                    file_put_contents($filePath, json_encode($currentData, JSON_PRETTY_PRINT));

                    
                    header("Location: ../view/login.php");
                    exit;
                } else {
                    echo "<p>Error: Unable to save user data. Please try again later.</p>";
                }

                $stmt_insert->close();
            } else {
                echo "<p>Error preparing statement: " . $connection->error . "</p>";
            }

            $db->closeCon($connection);
        }
    }
}
?>
