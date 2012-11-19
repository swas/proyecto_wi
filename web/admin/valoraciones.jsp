<%-- 
    Document   : valoraciones
    Created on : 19-nov-2012, 11:58:06
    Author     : Javi
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
      <jsp:useBean id="usuarios" class="classes.vo.busquedaUsuarioVO" scope="session"/>
      
<%@include file="/comun/seccionTitulo.jsp"%>

<%@include file="/admin/seccionBuscadorUsuario.jsp"%>

<hr>
                  
<div class="centro">
	<%@include file="/admin/seccionMenuUsuarios.jsp"%>     
        <div class="catalog">
        
        <jsp:useBean id="ValUsu" class="java.util.ArrayList" scope="session"/>
        <table>
        <c:forEach items="${ValUsu}" var="val">
            <tr>
                <td> <c:out value="${val}. "/>  </td>
            </tr>
        </c:forEach> </p>
        </table>
        </div>
        
        <%@include file="/comun/seccionLogin.jsp"%>

</div>
    </body>
</html>

