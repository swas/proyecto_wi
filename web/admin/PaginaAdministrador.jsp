
<%--
    Document   : index
    Created on : 19-feb-2011, 20:03:17
    Author     : Antonio David Fornís Méndez
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <title>Musica para DAA</title>
      <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
    </head>
    <body bgcolor="#FDF5E6">
        <c:set var="variable" value="A" />
      <jsp:useBean id="id" class="java.lang.String" scope="session"/>
      <jsp:useBean id="catalogo" class="classes.vo.busquedaArticuloVO" scope="session"/>
      <%@include file="/comun/seccionTitulo.jsp"%>

<hr>

<div class="centro">

	<%@include file="/admin/seccionMenuArticulo.jsp"%>
    
        <%@include file="/comun/seccionLogin.jsp"%>
        
<div class="catalog">
   <center><table style="width:550px;">
       <tr>
       <th class="head"></th>
       <th class="head">CODIGO CD</th>
       <th class="head">TITULO</th>
       <th class="head">AUTOR</th>
       <th class="head">IMPORTE</th>
       </tr>
                  
                     <!--Recorremos el carrito de la compra para imprimir cada uno de los elementos-->
                     <c:forEach var="entry" items="${catalogo.elementos}">

                        <tr>
                        <td class="dato" align="center"><img  src=${entry.urlImagen}></td>
                        <td class="dato" align="center"><c:out value="${entry.idArticulo}" /></td>
                        <td class="dato" align="center"><a  href="/ProyectoWI/classes/ControladorArticulo?accion=DetalleArticulo&id=${entry.idArticulo}">${entry.titulo}</a></td>
                        <td class="dato" align="center"><c:out value="${entry.autor}" /></td>
                        <td class="dato" align="center"><c:out value="${entry.precio}" /></td>
                        </tr>

                       
                     </c:forEach>                        
                    
                    
        </table>
  </div>
</div>
    </body>
</html>
