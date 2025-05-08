<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Processing</title>
    <link rel="stylesheet" href="../CSS/loan_processing.css">
</head>
<body>

<header class="header">
<center> <h2>Loan Processing</h2></center>
</header>

<center>

<div id="responseMessage" ></div>
   
    <form id="apply-loan-form">
        <h3>Apply for Loan</h3>
        <input type="number" name="customer_id" placeholder="Customer ID" >
        <input type="number" name="loan_amount" placeholder="Loan Amount" >
        <input type="text" name="loan_term" placeholder="Loan Term" >
        <select name="loan_type" >
            <option value="Personal">Personal</option>
            <option value="Home">Home</option>
            <option value="Car">Car</option>
        </select>
        <button type="submit">Apply for Loan</button>
    </form>

    <hr>

   
    <form id="approve-loan-form">
        <h3>Approve Loan</h3>
        <input type="number" name="loan_id" placeholder="Loan ID" >
        <input type="hidden" name="approve_loan" value="1"> 
        <button type="submit">Approve Loan</button>
    </form>

    <hr>

   
    <form id="reject-loan-form">
        <h3>Reject Loan</h3>
        <input type="number" name="loan_id" placeholder="Loan ID" >
        <input type="hidden" name="reject_loan" value="1"> 
        <button type="submit">Reject Loan</button>
    </form>
    

    <br>
    <a href="employee_dashboard.php" class="back-btn">Back to Dashboard</a>
</center>

<?php include 'footer.php'; ?>
<script src="../js/loan_processing.js"></script>
</body>
</html>
