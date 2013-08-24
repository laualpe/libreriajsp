function validacion() {
	var isbn = document.getElementById("isbn");
	var miFormulario = document.getElementById("miFormulario");

	if (isbn.value == "") {
		alert("datos no validos");
		return false;
	} else {
		miFormulario.submit();
		return true;
	}
}