<%--
    Document   : index
    Created on : 19-feb-2011, 20:03:17
    Author     : Antonio David Fornís Méndez
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="tag" uri="/WEB-INF/proyecto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<jsp:useBean id="id" class="java.lang.String" scope="session"/>
<c:set var="tit" value="${requestScope['tituloBUS']}" />
<c:set var="aut" value="${requestScope['autorBUS']}" />
<c:set var="anh" value="${requestScope['anhoBUS']}" />
<c:set var="prec" value="${requestScope['precioBUS']}"/>

<html>
    <head>
      <title>Tienda Musical</title>
      <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
    </head>
    <body>                
       
      <table align="center" border="0">
        <tr valign="middle">
            <%@include file="/comun/seccionTitulo.jsp"%>
	</tr>
      </table>  

    <hr>

    <div class="centro">
        
        <%@include file="/comun/seccionMenuPrincipal.jsp"%>
        
        <%@include file="/comun/seccionLogin.jsp"%>
        
    <div class="catalogo">
               
      <center>
      <table style="width:550px;">
      <c:set var="catalog" value="${requestScope['cata']}" />

      <c:choose>
      <c:when test="${empty catalog}">
         
            <jsp:forward page="/classes/ControladorArticulo?accion=Destacados"></jsp:forward>
          
      </c:when>
      <c:otherwise>     
       <tr>
       <th width="160" class="head">Carátula</th>
       <th width="35" class="head">Cod. CD</th>
       <th width="180" class="head">Título</th>
       <th width="120" class="head">Autor</th>
       <th width="20" class="head">Precio</th>
      </tr>
      <c:forEach var="entry" items="${catalog.elementos}">
       <tr>
       <td width="160" class="dato" align="center"><img src="${entry.urlImagen}" /></td>
       <td width="35" class="dato" align="center"><c:out value="${entry.idArticulo}" /></td>
       <td width="180" class="dato" align="center"><a href="/ProyectoWI/classes/ControladorArticulo?accion=Select&cd=${entry.titulo}"><c:out value="${entry.titulo}" /></a></td>
       <td width="120" class="dato" align="center"><c:out value="${entry.autor}" /></td>
       <td width="20" class="dato" align="center"><c:out value="${entry.precio}" /></td>
       </tr>
       </c:forEach>
      </c:otherwise>
      </c:choose>

      </table></center>
    </div>

    </div>

    </body>
</html>
