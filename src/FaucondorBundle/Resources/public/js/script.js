$( document ).ready(function() {
    $('.message').fadeIn();
    $('.message').fadeOut(3000);

    $('.datatable').DataTable({
        "bInfo": false,
        "bPaginate": false,
        "oLanguage": { "sSearch": "" }
    });

    $(".datepicker").datepicker({
        dateFormat: 'dd/mm/yy'
    });
    $('select').select2();
});

function validateAddEvent(){
	console.log("Entering validateAddEvent");
	var err = 0;
	
	//Check nom
	var nom = $("#nom");
	if (nom.val() == ""){
		nom.css("background-color", "red");
		err++;
	}else nom.css("background-color", "white");
	
	//Check date
	var date = $("#date");
	if (date.val() == ""){
		date.css("background-color", "red");
		err++;
	}else date.css("background-color", "white");
	
	//Check Type
	var type = $("#type");
	if (type.val() == "") err++;

	return (err > 0) ? false : true;
}

function validateAddMember(){
	console.log("Entering validateAddMember");
	var err = 0;
	
	//Check section
	var section = $("#section");
	if (section.val() == ""){
		err++;
	}
	
	//Check Poste
	var poste = $("#poste");
	var autreposte = $("#autre_poste");
	if (poste.val() == "") {
		if (autreposte.val() == "" || autreposte.val() == "Autre poste"){
			autreposte.css("background-color", "red");
			err++;
		}
	}else {
		poste.css("background-color", "white");
		autre_poste.css("background-color", "white");
	}
	
	//Check Prénom
	var prenom = $("#prenom");
	if (prenom.val() == "") {
		prenom.css("background-color", "red");
		err++;
	}else prenom.css("background-color", "white");

	
	//Check Nom
	var nom = $("#nom");
	if (nom.val() == "") {
		nom.css("background-color", "red");
		err++;
	}else nom.css("background-color", "white");

	//Check Nom
	var tel = $("#tel");
	if (tel.val() == ""){ 
		tel.css("background-color", "red");
		err++;
	}else tel.css("background-color", "white");
	
	//Check Email
	var email = $("#email");
	if (email.val() == ""){
		email.css("background-color", "red");
		err++;
	}else email.css("background-color", "white");
	
	return (err > 0) ? false : true;
}

function addFile(){
	console.log("AddFile");
}