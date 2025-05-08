<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/mystyle.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login</title>
    <link rel="stylesheet" href="../CSS/mystyle.css"> 
    <script src="../JS/login_validation.js"></script>
  
</head>
<body>
<?php include 'header.php'; ?>



<center>
    <h2>Employee Login</h2>


    <form action="../control/login_control.php" method="POST" onsubmit="return validateLoginForm()">
        <fieldset>
            <center>
                <legend><strong>Login Information</strong></legend>
            </center>
            <br>
            <table class="m">
                <tr>
                    <td class="black"><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="email" placeholder="Your email"></td>
                </tr>
                <tr>
                    <td><span id="emailError" ></span></td>
                </tr>
                <tr>
                    <td class="black"><label for="password">Password:</label></td>
                    <td><input type="password" id="password" name="password" placeholder="Your password"></td>
                </tr>
                <tr>
                    <td><span id="passwordError" ></span></td>
                </tr>
            </table>
            
            <button type="submit"><strong>Login</strong></button>
        </fieldset>
    </form>
    <p class="black">Forgot password? <a href="forgot_password.php">Click here!</a></p>
    <p class="black">Don't have an account? <a href="Employee_signup.php">Sign up here</a></p>
</center>

<?php include 'footer.php'; ?>

</body>
</html>
