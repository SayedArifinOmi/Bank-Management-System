<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/mystyle.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="../CSS/mystyle.css"> 
     
</head>
<body>
<script src="../JS/forgot_password.js"></script>
    
    <?php include 'header.php'; ?>
        
        <form action="../control/forgot_password_control.php" method="POST" onsubmit="return validateForgotPasswordForm()">
        <center><h1>Forgot Password</h1></center>
    <fieldset>
        <center>

            <table class="m">
                <tr>
                    <td class="black"><label for="email">Enter your email:</label></td>
                    <td><input type="text" id="email" name="email" placeholder="Enter your registered email"></td>
                </tr>
                <tr>
                    <td><span id="email_error" ></span></td>
                </tr>
                </table>
            <button type="submit" class="btn">Submit</button>
        </form>
    </fieldset>
        </center>
        
        <center><p> Remembered your password? <a href="login.php">Back to Login</a></p></center>

    <?php include 'footer.php'; ?>
</body>
</html>
