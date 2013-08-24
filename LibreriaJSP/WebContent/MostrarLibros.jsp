<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Lista de Libros</title>
</head>

<body>
	<%
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			//1. Crea un objeto conexión y un objeto sentencia.
			conexion = DriverManager.getConnection("jdbc:mysql://localhost/libreria", "root", "clasesql");
			sentencia = conexion.createStatement();
			
			//2. Crea una consulta SQL de selección para todos los libros de la tabla.
			String consultaSQL = "select isbn,titulo,categoria from Libros";
			
			//3. Ejecuta la sentencia con su SQL.
			//4. Devuelve un ResultSet con todos los registros.
			rs = sentencia.executeQuery(consultaSQL);
			
			//5. Recorre el ResultSet y lo imprime en html.
			while (rs.next()) {
	%>
				<%=rs.getString("isbn")%>
				<%=rs.getString("titulo")%>
				<%=rs.getString("categoria")%>
				<br />
	<%
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("Error en la carga del driver"+ e.getMessage());
		} catch (SQLException e) {
			System.out.println("Error accediendo a la base de datos"+ e.getMessage());
		} finally {
			//6. Cierra los recursos (conexión, sentencia, etc).
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("Error cerrando el resultset"+ e.getMessage());
				}
			}
			
			if (sentencia != null) {
				try {
					sentencia.close();
				} catch (SQLException e) {
					System.out.println("Error cerrando la sentencia"+ e.getMessage());
				}
			}
			if (conexion != null) {
				try {
					conexion.close();
				} catch (SQLException e) {
					System.out.println("Error cerrando la conexion"	+ e.getMessage());
				}
			}
		}
	%>
	<a href="index.jsp">Insertar Libro</a>
</body>
</html>