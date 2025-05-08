document.addEventListener("DOMContentLoaded", function () {
    function sendLoanRequest(formData) {
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "../control/loan_processing_control.php", true);
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                try {
                    let response = JSON.parse(xhr.responseText);
                    document.getElementById("responseMessage").innerHTML = response.message;
                } catch (e) {
                    console.error("Invalid JSON response", xhr.responseText);
                }
            }
        };
        xhr.send(formData);
    }

    document.querySelector("form#apply-loan-form").addEventListener("submit", function (e) {
        e.preventDefault();
        let formData = new FormData(this);
        sendLoanRequest(formData);
    });

    document.querySelector("form#approve-loan-form").addEventListener("submit", function (e) {
        e.preventDefault();
        let formData = new FormData(this);
        sendLoanRequest(formData);
    });

    document.querySelector("form#reject-loan-form").addEventListener("submit", function (e) {
        e.preventDefault();
        let formData = new FormData(this);
        sendLoanRequest(formData);
    });
});
