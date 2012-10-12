function email(elem){
	
var mail= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	if(mail.test(elem))
		return true;
	else
		return false;	
}

function dni(elem){
	
var nif= /^[0-9]{8}[A-Z]{1}$/

	if(nif.test(elem))
		return true;
	else
		return false;	
}

function tarjeta(elem){

var nume= /^[0-9]{16}$/

	if(nume.test(elem))
		return true;
	else
		return false;
}
function telefono(elem){

var num= /^[0-9]{9}$/

	if(num.test(elem))
		return true;
	else
		return false;
}

function validar(){

	if (document.datos.nombre.value == ""){ 
		alert("Debe introducir su nombre.");
		return false;
	}
	if (email(document.datos.correo.value) == false){
		alert("El e-mail introducido no es correcto.");
		return false;
	}
	if (dni(document.datos.dni.value) == false){
		alert("El DNI introducido no es correcto.");
		return false;
	}	
	if (telefono(document.datos.telefono.value) == false){
		alert("Debe introducir un telefono.");
		return false;
	}
	if (tarjeta(document.datos.tarjeta.value) == false){
		alert("Debe introducir un numero de tarjeta valido.");
		return false;
	}
	if (document.datos.apellidos.value == ""){
		alert("Debe introducir dos apellidos.");
		return false;
	}
	if (document.datos.direccion.value == ""){
		alert("Debe introducir su domicilio.");
		return false;
	}
	if (document.datos.pass.value == ""){ 
		alert("Debe introducir una contraseña.");
		return false;
	}
	if (document.datos.pass1.value == ""){
		alert("Por favor repita la contraseña introducida.");
		return false;
	}
	if (document.datos.pass.value != document.datos.pass1.value){
		alert("Las contraseñas introducidas deben ser iguales.");
		return false;
	}
	
	if (!document.datos.acepto.checked){
		alert("Por favor acepte los terminos y condiciones.");
		return false;
	}
	
		return true;
}
