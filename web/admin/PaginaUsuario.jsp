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
      <jsp:useBean id="usuarios" class="classes.vo.busquedaUsuarioVO" scope="session"/>
      
<%@include file="/comun/seccionTitulo.jsp"%>

<%@include file="/admin/seccionBuscadorUsuario.jsp"%>

<hr>
                  
<div class="centro">
	<%@include file="/admin/seccionMenuUsuarios.jsp"%>
        <%@include file="/comun/seccionLogin.jsp"%>



       <!--Establecemos las variables que vamos a utilizar para diferencia una vista de otra-->
     <c:set var="Registrado" value="Registrado" />
     <c:set var="noRegistrado" value="noRegistrado" />
     <c:set var="Baja" value="Baja"/>
     <c:set var="Busqueda" value="Busqueda"/>
      <c:if test="${fn:contains(id, variable)}">
                  <!--Si el usuario ha selccionado ver los usuarios Registrados-->
               <c:choose>
                   
                   
                    <c:when test="${fn:contains(param.tipo, Busqueda)}"   >


                       <div class="catalog">

                      <center><table style="width:650px;">
                        <tr>
                        <th class="head" colspan="3">Resultado de Busqueda</th>
                        <tr>


                        <tr>
                       <th class="head">IdUsuario</th>
                       <th class="head">Correo Electronico</th>
                       
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



                            <a href="/ProyectoWI/classes/ControladorUsuario?idUsuario=${entry.idUsuario}&accion=DetalleBuscador&tipo=${entry.estado}"> ${entry.idUsuario}</a>



                        </th>
                        <th class="dato">



                            ${entry.correoElectronico}



                        </th>
                        
                        </tr>
                     </c:forEach>





                   </table>
                  </div>


                   </c:when>
                   
                   <c:when test="${fn:contains(param.tipo, noRegistrado)}"   >


                       <div class="catalog">

                      <center><table style="width:550px;">
                        <tr>
                        <th class="head" colspan="3">Usuarios Pendiente de Activación</th>
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



                            <a href="/ProyectoWI/classes/ControladorUsuario?accion=DetalleNoRegistrado&idUsuario=${entry.idUsuario}"> ${entry.idUsuario}</a>

                            

                        </th>
                        <th class="dato">



                            ${entry.correoElectronico} 

                            

                        </th>
                        <th class="dato">
                        <form action="/ProyectoWI/classes/ControladorUsuario" >
                        <input type="hidden" name="accion" value="ModificarNoRegistradoBoton" size = "15" >
                        <input type="hidden" name="idUsuario" value="${entry.idUsuario}" size = "15" >
                        <input type="hidden" name="correoElectronico" value="${entry.correoElectronico}" size = "15" >
                         <center>
                        <input type="submit" value="Activar">
                        </form>
                        </th>
                        </tr>
                     </c:forEach>

                    



                   </table>
                  </div>

                       
                   </c:when>





                   <c:when test="${fn:contains(param.tipo, Registrado)}"   >


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
                        <input type="hidden" name="accion" value="ModificarRegistradoBoton" size = "15" >
                        <input type="hidden" name="idUsuario" value="${entry.idUsuario}" size = "15" >
                         <center>
                        <input type="submit" value="Dar de Baja">
                        </form>
                        </th>
                        </tr>
                     </c:forEach>

                    



                   </table>
                  </div>

                   </c:when>







                    <c:when test="${fn:contains(param.tipo, Baja)}"   >


                       <div class="catalog">

                      <center><table style="width:550px;">
                        <tr>
                        <th class="head" colspan="3">Usuarios dado de baja</th>
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
                        </table>
                        

                      </c:if>
                     <!--Recorremos el hashmap de usuarios para imprimir cada uno de los elementos-->
                     <c:forEach var="entry" items="${usuarios.elementos}">

                        <tr >
                        <th class="dato">



                          <a href="/ProyectoWI/classes/ControladorUsuario?accion=DetalleBaja&idUsuario=${entry.idUsuario}"> ${entry.idUsuario}</a>



                        </th>
                        <th class="dato">



                            ${entry.correoElectronico}



                        </th>
                         <th class="dato">
                        <form action="/ProyectoWI/classes/ControladorUsuario" >
                        <input type="hidden" name="accion" value="ModificarBajaBoton" size = "15" >
                        <input type="hidden" name="idUsuario" value="${entry.idUsuario}" size = "15" >
                        
                         <center>
                        <input type="submit" value="Activar">
                        </form>
                        </th>
                        </tr>
                     </c:forEach>

                    



                   </table>
                  </div>

                   </c:when>

                   
                   <c:otherwise>

                        <div class="catalog">

                      <center><table style="width:550px;">
                        <tr>
                        <th class="head" colspan="3">Usuarios Registrados</th>
                        <tr>
                        <th class="dato">
                            <br>
                        <p class="Precio">- Número de Clientes pendientes de activación:${param.numUsuariosPendientes}</p>
                        <br>
                        <br>
                        <p class="Precio">- Número de Clientes Registrados:${param.numUsuariosRegistrados}</p>
                        <br>
                        <br>
                        <br>
                        
                        

                        </th>
                        </tr>
                         </table>
                     </div>
                        </c:otherwise>
                        </c:choose>
                        </c:if>
        </div>


  

    </body>
</html>
