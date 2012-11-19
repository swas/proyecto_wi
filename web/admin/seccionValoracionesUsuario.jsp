<%-- 
    Document   : seccionValoracionesUsuario
    Created on : 19-nov-2012, 11:27:18
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

                      <center><table style="width:550px;">
                        <tr>
                        <th class="head" colspan="3">Usuarios Registrados</th>
                        <tr>


                        <tr>
                       <th class="head">IdUsuario</th>
                       <th class="head">Correo Electronico</th>
                       <th class="head"></th>
                       </tr>

                        <c:if test="${empty usuarios}">

                        <tr>
                        <th class="dato" colspan="3">No se ha encontrado resultados</th>
                        </tr>


                      </c:if>

                     <!--Recorremos el hashmap de usuarios para imprimir cada uno de los elementos-->
                     <c:forEach var="entry" items="${usuarios.elementos}">

                        <tr>
                        <th class="dato">


                          <a href="/ProyectoWI/classes/ControladorUsuario?accion=DetalleRegistrado&idUsuario=${entry.idUsuario}"> ${entry.idUsuario}</a>


                        </th>
                        <th class="dato">

                           ${entry.correoElectronico} 

                        </th>
                        <th class="dato">
                        <form action="/ProyectoWI/classes/ControladorUsuario" >
                        <input type="hidden" name="accion" value="VerValoracionesUs" size = "15" >
                        <input type="hidden" name="idUsuario" value="${entry.idUsuario}" size = "15" >
                         <center>
                        <input type="submit" value="Ver Valoraciones">
                        </form>
                        </th>
                        </tr>
                     </c:forEach>
                   </table>
                  </div>
        
        <%@include file="/comun/seccionLogin.jsp"%>
        </div>
    </body>
</html>
