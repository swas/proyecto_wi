<%-- 
    Document   : Registro
    Created on : 02-abr-2011, 20:46:27
    Author     : Pablo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
        <script language="javascript" src="/ProyectoWI/scripts/datos.js"></script>
        <title>Registro</title>
    </head>
    <body bgcolor="#FDF5E6">
    <center>
      <table border="0">
	<tr>            
            <th valign="bottom"><font margin-left="30px" face="Times New Roman,Times" size="+2">Registro</font></th>
	</tr>
      </table>
    </center>
      <hr>
           <c:if test="${empty param.tipo}">
	  
          <form action="/ProyectoWI/classes/ControladorUsuario" onSubmit="return validar()" name="datos">
          <div class="registro">

            <h4 style="text-align: center"> Nota: Los campos con * son obligatorios </h4>

            <p>
            Nombre*:  <input type=text name="nombre" size="48" >
            </p>
            <p>
            Apellidos*:  <input type=text name="apellidos" size="47" >
            </p>
            <p>
            E-mail*:    <input type=text name="correo" size="50" >
            </p>
            <p>
            DNI*:    <input type=text name="dni" size="9">
            </p>
            <p>
            Domicilio*:    <input type=text name="direccion" size="47" >
            </p>
            <p>
            Telefono*:    <input type=text name="telefono" size="48" >
            </p>
            <p>
            Nº Tarjeta*:    <input type=text name="tarjeta" size="46" >
            </p>
            <p>
            Contraseña*:    <input type=password name="pass" size="45">
            </p>
            <p>
            Repita contraseña*:    <input type=password name="pass1" size="39">
            </p>
            <p><input type="checkbox" name="acepto">
            Al hacer clic en la casilla, aceptas los t&eacute;rminos de uso y las condiciones de la Tienda,
            as&iacute; como la pol&iacute;tica de privacidad.
            </p>
            
            </div>

            <hr>

          <center>

            <input type="hidden" name="accion" value="GuardarRegistro">

            <p>
            <input type="submit" value="Finalizar">
            &nbsp;&nbsp;
            <input type="reset" value="Borrar">
            </p>
           
            
          </center>
          </form>
               </c:if>

      <c:if test="${!empty param.tipo}">

          <form action="/ProyectoWI/classes/ControladorUsuario" onSubmit="return validar()" name="datos">
          <div class="registro">

            <h4 style="text-align: center"> Nota: Los campos con * son obligatorios </h4>
            <p class="Precio">ERROR! El Correo Electronico ya existe en la base de datos</p>
            <p>
            Nombre*:  <input type=text name="nombre" size="48" >
            </p>
            <p>
            Apellidos*:  <input type=text name="apellidos" size="47" >
            </p>
            <p>
            E-mail*:    <input type=text name="correo" size="50" >
            </p>
            <p>
            DNI*:    <input type=text name="dni" size="9">
            </p>
            <p>
            Domicilio*:    <input type=text name="direccion" size="47" >
            </p>
            <p>
            Telefono*:    <input type=text name="telefono" size="48" >
            </p>
            <p>
            Nº Tarjeta*:    <input type=text name="tarjeta" size="46" >
            </p>
            <p>
            Contraseña*:    <input type=password name="pass" size="45">
            </p>
            <p>
            Repita contraseña*:    <input type=password name="pass1" size="39">
            </p>
            <p><input type="checkbox" name="acepto">
            Al hacer clic en la casilla, aceptas los t&eacute;rminos de uso de la Tienda,
            las condiciones del servicio de Tienda y la pol&iacute;tica de privacidad.
            </p>

            </div>

            <hr>

          <center>

            <input type="hidden" name="accion" value="GuardarRegistro">

            <p>
            <input type="submit" value="Finalizar">
            &nbsp;&nbsp;
            <input type="reset" value="Borrar">
            </p>


          </center>
          </form>
               </c:if>
          <center>
            <p>
                <a href="/ProyectoWI/index.jsp"><button>Atr&aacute;s</button></a>
            </p>
          </center>
</html>

