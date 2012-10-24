function email(elem){
	
var mail= /^[a-z0-9\-\.]+@[a-z0-9\-\.]+\.[a-z]{2,}$/i

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
        
		return true;
}
