<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insertar Libro</title>
</head>

<body>
	<%
		//1.Lee la información que proviene de index.html usando el objeto request de JSP.
		String isbn = request.getParameter("isbn");
		String titulo = request.getParameter("titulo");
		String categoria = request.getParameter("categoria");
		Connection conexion = null;
		Statement sentencia = null;		
		int filas=0;
		
		try {			
			//2. Crea un objeto de tipo Connection(conexión) y un objeto de tipo Statement (sentencia)
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection("jdbc:mysql://localhost/libreria", "root", "clasesql");
			sentencia = conexion.createStatement();
		
			//3. Crea una consulta SQL de inserción con los datos del libro
			String consultaSQL = "insert into libros (isbn,titulo,categoria) values ";
			consultaSQL += "('" + isbn + "','" + titulo + "','" + categoria + "')";
		
			//4. Ejecuta la sentencia con su SQL
			filas = sentencia.executeUpdate(consultaSQL);
			//jsp: Este método se utiliza para reenviar la petición a otra url o servlet.
			response.sendRedirect("MostrarLibros.jsp"); 
		} catch (ClassNotFoundException e) {
			System.out.println("Error en la carga del driver"+ e.getMessage());
		} catch (SQLException e) {
			System.out.println("Error accediendo a la base de datos"+ e.getMessage());
		} finally {
			
		//5. Cierra los recursos (conexión, sentencia, etc)
		if (sentencia != null) {
			try {
				sentencia.close();
			}catch (SQLException e){
				System.out.println("Error cerrando la sentencia" +e.getMessage());}
			}
		
		if (conexion != null) {
			try {
				conexion.close();
			}catch (SQLException e){
				System.out.println("Error cerrando la conexion" +e.getMessage());}
			}
		}
	%>
</body>
</html>