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
            <%@include file="/comun/seccionTitulo.jsp"%>
	</tr>
      </table>  

      <hr>


        <!--Obtenemos el contenido de la sesion-->
      <jsp:useBean id="cart" class="classes.vo.ShoppingCart" scope="session"/>

<div class="centro">

    <%@include file="/comun/seccionMenuPrincipal.jsp"%>
        
    <%@include file="/comun/seccionLogin.jsp"%>
          
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