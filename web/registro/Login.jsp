<%-- 
    Document   : LoginAdministrador
    Created on : 22-mar-2011, 18:42:16
    Author     : Sony Vaio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
        <title>Login</title>
    </head>
    <body bgcolor="#FDF5E6">
        
      <table align="center" border="0">
          <tr valign="middle">
            <th><img  src="/ProyectoWI/imagenes/dibujoMusica.jpg"></th>
            <th> <font face="Times New Roman,Times" size="+3">Logueate</font></th>
	</tr>
      </table>
      <hr>
	
	  <center>
            
            <h4> Nota: Los campos con * son obligatorios </h4>
            
            
            <form action="/ProyectoWI/classes/ControladorUsuario" >

            <p>
            Correo electr&oacute;nico  * <br>
            <input type="text" name="mail" size = "30" class = "formularioAlta">
            </p>
            <p>
            Password  *<br>
            <input type="password" name="pass" size = "15" class = "formularioAlta">
            </p>
            <p>
            <input type="hidden" name="accion" value="ComprobarLogin" size = "15" class = "formularioAlta">
            <input type="submit" value="Aceptar"/>
            </p>
            
            </form>
            
            <p>
                <a href="/ProyectoWI/index.jsp"><button>Atr&aacute;s</button></a>
            </p>

            
          </center>
</html>
