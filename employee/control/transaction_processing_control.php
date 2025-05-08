<?php
session_start();
include '../Model/db.php';


if (!isset($_SESSION['employee_logged_in'])) {
    header("Location: login.php");
    exit();
}

$db = new myDB();
$conn = $db->openCon();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    if (isset($_POST['deposit'])) {
        $account_id = $_POST['account_id'];
        $deposit_amount = $_POST['deposit_amount'];

       
        if ($deposit_amount > 0) {
           
            $sql = "UPDATE accounts SET balance = balance + ? WHERE account_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("di", $deposit_amount, $account_id);

            if ($stmt->execute()) {
                echo "<p>Deposit successful!</p>";
            } else {
                echo "<p>Error depositing money: " . $conn->error . "</p>";
            }
            $stmt->close();
        } else {
            echo "<p>Invalid deposit amount.</p>";
        }
    }

  
    if (isset($_POST['withdraw'])) {
        $account_id = $_POST['account_id'];
        $withdraw_amount = $_POST['withdraw_amount'];

        
        $sql = "SELECT balance FROM accounts WHERE account_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $account_id);
        $stmt->execute();
        $stmt->bind_result($current_balance);
        $stmt->fetch();
        $stmt->close();

        if ($withdraw_amount > 0 && $withdraw_amount <= $current_balance) {
        
            $sql = "UPDATE accounts SET balance = balance - ? WHERE account_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("di", $withdraw_amount, $account_id);

            if ($stmt->execute()) {
                echo "<p>Withdrawal successful!</p>";
            } else {
                echo "<p>Error withdrawing money: " . $conn->error . "</p>";
            }
            $stmt->close();
        } else {
            echo "<p>Invalid withdrawal amount or insufficient balance.</p>";
        }
    }

    
    if (isset($_POST['transfer'])) {
        $sender_account_id = $_POST['sender_account_id'];
        $receiver_account_id = $_POST['receiver_account_id'];
        $transfer_amount = $_POST['transfer_amount'];

        
        if ($transfer_amount > 0) {
         
            $sql = "SELECT balance FROM accounts WHERE account_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $sender_account_id);
            $stmt->execute();
            $stmt->bind_result($sender_balance);
            $stmt->fetch();
            $stmt->close();

           
            if ($transfer_amount <= $sender_balance) {
               
                $sql = "UPDATE accounts SET balance = balance - ? WHERE account_id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("di", $transfer_amount, $sender_account_id);
                $stmt->execute();
                $stmt->close();

             
                $sql = "UPDATE accounts SET balance = balance + ? WHERE account_id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("di", $transfer_amount, $receiver_account_id);
                $stmt->execute();
                $stmt->close();

                echo "<p>Transfer successful!</p>";
            } else {
                echo "<p>Insufficient balance in sender's account.</p>";
            }
        } else {
            echo "<p>Invalid transfer amount.</p>";
        }
    }
}

$db->closeCon($conn);
?>
