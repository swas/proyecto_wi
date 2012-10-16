<%--
    Document   : carrito
    Created on : 19-feb-2011, 23:11:18
    Author     : Antonio David Fornís Méndez
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <title>Carro de la Compra</title>
      <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
    </head>
    <body bgcolor="#FDF5E6">

      <table align="center" border="0">
          <tr valign="middle">
            <th><img  src="/ProyectoWI/imagenes/dibujoMusica.jpg"></th>
            <th> <font face="Times New Roman,Times" size="+3">Carrito</font></th>
	</tr>
      </table>

      <hr>


        <!--Obtenemos el contenido de la sesion-->
      <jsp:useBean id="cart" class="classes.vo.ShoppingCart" scope="session"/>

      <div class="centro">

        <div id="menuv">
        <ul>
                <li>Categorias</li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Español">Pop-Rock Español</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Internacional">Pop-Rock Internacional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Clasico">Clásico</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Dance">Dance</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Rap/Hip-Hop">Rap/Hip-Hop</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Chill Out">Chill Out</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Bandas Sonoras">Bandas Sonoras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Jazz-Blues">Jazz-Blues</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Flamenco y Cancion">Flamenco y Cancion Española</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Musicas del Mundo">Músicas del Mundo</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Regional">Regional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Infantil">Infantil</a></li>

        </ul>
        </div>
    <div class="login">

          <c:set var="var" value="C" />
          <c:choose>
          <c:when test="${fn:contains(id, var)}">

            <p style="color: white">Bienvenido</p>
            <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=Micuenta"><button style="width:160;height:24; background-color:#FDF5E6; ">Mi Cuenta</button></a></p>
            <p><a href="/ProyectoWI/classes/ControladorArticulo?accion=Carrito"><button style="width:160;height:24; background-color:#FDF5E6; ">Carrito</button></a></p>
            <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=irAPagar"><button style="width:160;height:24; background-color:#FDF5E6; ">Pagar</button></a></p>
            <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=LogOut"><button style="width:160;height:24; background-color:#FDF5E6; ">Salir</button></a></p>

          </c:when>
          <c:otherwise>
              <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=login"><button style="width:160;height:24; background-color:#FDF5E6; ">Login</button></a></p>
              <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=registro"><button style="width:160;height:24; background-color:#FDF5E6; ">Registrarse</button></a></p>
          </c:otherwise>
          </c:choose>

      </div>
          
    <div class="catalog">


     <form action="/ProyectoWI/classes/ControladorArticulo">
        <input type="hidden" value="EliminarElemento" name="accion">

      <center>
          <table style="width:550px;">
              <tr>
       <th width="160px" class="head">Carátula</th>
       <th width="180px" class="head">Título</th>
       <th td width="35px" align="center" class="head">Cantidad</th>
       <th width="20px" class="head">Precio</th>
       <th width="20px" class="head" align="center">Eliminar</th>
      </tr>
      <c:forEach var="entry" items="${cart.elementos}">
       <tr>
       <td width="160px" class="dato" align="center"><img  src="${entry.urlImagen}" /></td>
       <td width="180px" class="dato" align="center"><c:out value="${entry.titulo}" /></td>
       <td width="35px" class="dato" align="center"><c:out value="${entry.cantidad}" /></td>
       <td width="20px" class="dato" align="center"><c:out value="${entry.precio}" /></td>
       <td width="20px" class="dato" align="center"> <input type="radio" name="eliminar" value="${entry.idArticulo}"> </td>
       </tr>
       </c:forEach>

     <tr>
     <td></td>
     <td></td>
     <td width="160px" class="dato" align="right">IMPORTE TOTAL:</td>
     <td width="160px" class="dato" align="center"><fmt:formatNumber maxFractionDigits="2" value="${cart.total}" /></td>
     <td class="dato" align="center"><input type="submit" value="Eliminar"></td>
     </tr>

      </table></center>
     </form>
    </div>
          
    </div>

    </body>
</html>