function validateLoginForm() {
    
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("passwordError").innerHTML = "";

    
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var isValid = true;

    
    if (email == "") {
        document.getElementById("emailError").innerHTML = "Email is required.";
        isValid = false;
    } else if (!validateEmail(email)) {
        document.getElementById("emailError").innerHTML = "Invalid email format.";
        isValid = false;
    }

    
    if (password == "") {
        document.getElementById("passwordError").innerHTML = "Password is required.";
        isValid = false;
    } else if (password.length < 6) {
        document.getElementById("passwordError").innerHTML = "Password must be at least 6 characters.";
        isValid = false;
    }

   
    return isValid;
}


function validateEmail(email) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return emailPattern.test(email);
}
