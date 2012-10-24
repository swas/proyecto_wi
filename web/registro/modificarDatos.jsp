<%--
    Document   : Registro
    Created on : 02-abr-2011, 20:46:27
    Author     : Pablo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
        <script language="javascript" src="/ProyectoWI/scripts/datos1.js"></script>
        <title>Datos del Usuario</title>
    </head>
    <body bgcolor="#FDF5E6">

    <center>
      <table border="0">
	<tr>            
            <th valign="bottom"><font margin-left="30px" face="Times New Roman,Times" size="+3">Datos del Usuario</font></th>
	</tr>
      </table>
    </center>
      <hr>

      <c:set var="user" value="${requestScope['user']}" />

          <form action="/ProyectoWI/classes/ControladorUsuario" onSubmit="return validar()" name="datos">
          <div class="registro">            

            <p>
            Nombre:  <input type=text name="nombre" size="48" value="${user.nombre}">
            </p>
            <p>
            Apellidos:  <input type=text name="apellidos" size="47" value="${user.apellidos}">
            </p>
            <p>
            E-mail:    <input type=text name="correo" size="50" value="${user.correoElectronico}">
            </p>
            <p>
            DNI:    <input type=text name="dni" size="9" value="${user.dni}">
            </p>
            <p>
            Domicilio:    <input type=text name="direccion" size="47" value="${user.direccion}">
            </p>
            <p>
            Telefono:    <input type=text name="telefono" size="48" value="${user.telefono}">
            </p>
            <p>
            Nº Tarjeta:    <input type=text name="tarjeta" size="46" value="${user.numTarjeta}">
            </p>
            <p>
            Contraseña:    <input type=password name="pass" size="45" value="${user.pass}">
            </p>

            </div>

            <hr>

          <center>

               <input type="hidden" name="accion" value="ActualizarRegistro">

            <p>
                <input type="submit" value="Modificar">
            </p>
          </center>
          </form>

          <center>
            <p>
                <a href="/ProyectoWI/index.jsp"><button>Atr&aacute;s</button></a>
            </p>
          </center>

          

</html>

