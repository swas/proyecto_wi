<%--
    Document   : Registro
    Created on : 02-abr-2011, 20:46:27
    Author     : Pablo
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <title>Factura</title>
      <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
    </head>
    <body bgcolor="#FDF5E6">

      <table align="center" border="0">
          <tr valign="middle">
            <th><img  src="/ProyectoWI/imagenes/dibujoMusica.jpg"></th>
            <th> <font face="Times New Roman,Times" size="+3">Factura</font></th>
	</tr>
      </table>

        <!--Obtenemos el contenido de la sesion-->
      <jsp:useBean id="cart" class="classes.vo.ShoppingCart" scope="session"/>

      <hr>

      <c:choose>
          <c:when test="${requestScope['vip'] == 1}">
            <center><p style="color: red;">Es usted un Usuario VIP. Le aplicaremos un 20% de descuento.</p></center>
            <c:set var="cantidad" value="${cart.totalVIP}" />
          </c:when>
          <c:otherwise>
            <c:set var="cantidad" value="${cart.total}" />
          </c:otherwise>
      </c:choose>

             <center><table>
             <tr><th class="head">IMPORTE TOTAL</th></tr>
             <tr><td class="dato" align="center"><fmt:formatNumber maxFractionDigits="2" value="${cantidad}" /></td></tr>
            </table></center>
      <hr>
      <center>
       <p>
           <a href="/ProyectoWI/classes/ControladorArticulo?accion=Pago&cantidad=${cantidad}" style=" text-decoration:none;"><button>Pagar</button></a>
           &nbsp;&nbsp;
           <a href="/ProyectoWI/classes/ControladorArticulo?accion=Carrito" style=" text-decoration:none;"><button>Atr&aacute;s</button></a>
       </p>
       </center>

    </body>
</html>