function submitForm() {
    
    var formData = new FormData(document.getElementById('merchantForm'));

    
    var xhr = new XMLHttpRequest();

    xhr.open('POST', '../control/merchant_add_control.php', true);

   
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);

            
            if (response.success) {
                alert('Merchant added successfully!');
                window.location.href = 'welcome.php'; // Redirect to welcome page
            } else {
                alert('Error adding merchant: ' + response.error);
            }
        }
    };

   
    xhr.send(formData);
}
