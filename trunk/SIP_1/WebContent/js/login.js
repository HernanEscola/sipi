function validate() {
	
	var user;
	var pass;
	user = $.trim($("#user").val());
	pass = $.trim($("#password").val());
	if ((user == "") || (pass == ""))
    {
        jAlert("Ingrese el Nombre de Usuario y Password", "Error");
		return false; 
	}
    if (  (!validateUser(user,pass) )) {
        jAlert("Usuario o Password Incorrecto", "Error");
        return false;
    } else {
        return true;
    }
	
}

function validateUser(user,pass){

if ((user == "SIPI" || user == "sipi") && (pass == "sipi" || pass == "SIPI")) {
	return true;
}
else {
	return false;
}

}

$(document).ready(function() {
    $("#btnLog").click(function(e) {
        if (validate()) {//si valida
            //setCookie("login", hotelDTO.user, 1000*60*60*24);
            window.location = "crud_page.html";
        }
    });
	/*$("#password").keypress(function(e){
		
		if(e.keyCode == '13'){
			if (validate()) {//si valida
				setCookie("login", hotelDTO.user, 1000*60*60*24);
				window.location = "crud_page.html"
			}
		}		
	});
	$("#user").focus(); */
});

