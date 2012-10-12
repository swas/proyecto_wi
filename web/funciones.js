function valCamposArticulo(form) {
        
	var a = true;
	
	
	if(form.titulo.value=="") {
		alert('Introduzca un titulo valido.');
		return false;
	}
        if(form.autor.value=="") {
		alert('Introduzca un autor valido.');
		return false;
	}

        var er_precio = /^[0-9]+[.][0-9]+$/;
	if(!er_precio.test(form.precio.value)) {
		alert('Introduzca un precio valida format(XX.YY)');
		return false;
	}
	
	var er_cantidad = /^[0-9]+$/;
	if(!er_cantidad.test(form.cantidad.value)) {
		alert('Introduzca una canitdad valida');
		return false;
	}
	
	

	return a;
}







	