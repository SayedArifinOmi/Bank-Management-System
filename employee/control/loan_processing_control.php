<?php
session_start();
include '../Model/db.php';


if (!isset($_SERVER['HTTP_X_REQUESTED_WITH']) || strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest') {
    die(json_encode(["message" => "Invalid request."]));
}


if (!isset($_SESSION['employee_logged_in'])) {
    echo json_encode(["message" => "Unauthorized access."]);
    exit();
}

$db = new myDB();
$conn = $db->openCon();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Apply for loan
    if (isset($_POST['customer_id']) && isset($_POST['loan_amount']) && isset($_POST['loan_term']) && isset($_POST['loan_type'])) {
        $customer_id = $_POST['customer_id'];
        $loan_amount = $_POST['loan_amount'];
        $loan_term = $_POST['loan_term'];
        $loan_type = $_POST['loan_type'];

        
        if (!is_numeric($customer_id) || $customer_id <= 0) {
            echo json_encode(["message" => "Invalid Customer ID."]);
        } elseif (!is_numeric($loan_amount) || $loan_amount <= 0) {
            echo json_encode(["message" => "Loan amount must be a positive number."]);
        } elseif (!is_numeric($loan_term) || $loan_term <= 0) {
            echo json_encode(["message" => "Loan term must be a positive number."]);
        } else {
            $message = $db->applyForLoan($customer_id, $loan_amount, $loan_term, $loan_type, $conn);
            echo json_encode(["message" => $message]);
        }
    }

    // Approve loan
    elseif (isset($_POST['loan_id']) && isset($_POST['approve_loan'])) {
        $loan_id = $_POST['loan_id'];

        if (!is_numeric($loan_id) || $loan_id <= 0) {
            echo json_encode(["message" => "Invalid Loan ID."]);
        } else {
            $message = $db->approveLoan($loan_id, $conn);
            echo json_encode(["message" => $message]);
        }
    }

    // Reject loan
    elseif (isset($_POST['loan_id']) && isset($_POST['reject_loan'])) {
        $loan_id = $_POST['loan_id'];

        if (!is_numeric($loan_id) || $loan_id <= 0) {
            echo json_encode(["message" => "Invalid Loan ID."]);
        } else {
            $message = $db->rejectLoan($loan_id, $conn);
            echo json_encode(["message" => $message]);
        }
    }
}

$db->closeCon($conn);
?>
