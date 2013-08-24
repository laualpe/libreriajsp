<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Formulario Libro</title>

<link rel="stylesheet" type="text/css" href="css/formato.css" />
<script type="text/javascript" src="js/validacion.js"></script>
</head>

<body>
	<h1>Formulario alta Libro</h1>
	<form id="miFormulario" action="InsertarLibro.jsp"
		onsubmit="return validacion();">
		<fieldset>
			<legend>Formulario alta libro</legend>
			<!-- Si utilizamos la etiqueta label, y la asignamos a el campo que la acompaña, hacer click en el texto “isbn” es equivalente a hacer click en el campo de texto. 
					La relación entre el control y la etiqueta se establece cuando los atributos "id" (en el control) y "for" (en la etiqueta) coinciden.-->
			<p>
				<label for="isbn">isbn:</label> <input id="isbn" type="text"
					name="isbn" />
			</p>
			<p>
				<label for="titulo">Titulo:</label> <input id="titulo" type="text"
					name="titulo" />
			</p>
			<p>
				<label for="categoria">Categoria:</label> <input id="categoria"
					type="text" name="categoria" />
			</p>
			<p>
				<input type="submit" value="Insertar" />
			</p>
		</fieldset>
	</form>
</body>

</html>