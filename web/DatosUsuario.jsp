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
      <jsp:useBean id="usuario" class="classes.vo.Usuario" scope="session"/>



      

     <%@include file="/seccionTitulo.jsp"%>

     <%@include file="/seccionBuscadorUsuario.jsp"%>
      <hr>

     <div class="centro">
     <%@include file="/seccionMenuUsuarios.jsp"%>

     

      

     <c:set var="Registrado" value="Registrado" />
     <c:set var="noRegistrado" value="noRegistrado" />
     <c:set var="Baja" value="Baja"/>
     <c:set var="admin" value="admin"/>

     
     <!--Si es administrador-->
      <c:if test="${fn:contains(id, variable)}">
                  <!--Si el usuario ha selccionado ver los usuarios Registrados-->
               <c:choose>
               <c:when test="${fn:contains(param.tipo, admin)}"   >

                    <div class="catalog">
                   <center><table style="width:550px;">
                       <tr>
                       <td class="head" align="center">Datos  del Aministrador</td>

                       </tr>
                       <tr>
                       <td class="dato" align="center">
                            <form action="/ProyectoWI/classes/ControladorUsuario" >
                                 

                                <br> Correo Electronico <br>
                                <input type="text"  name="correoElectronico" value="${usuario.correoElectronico}" id="url" />

                                 
                                <br> Contraseña Nueva:<br>
                                <input type="password"  name="pass" id="url"/>

                               
                                


                                 <input type="hidden" name="accion" value="ModificarAdmin">
                                   <br>
                                   <br>
                                 <input type="submit" value="Modificar Usuario"><br>
                                 </form>
                                 <br>
                                 <form action="/ProyectoWI/classes/ControladorArticulo" >
                                     <input type="hidden" name="accion" value="VolverACatalogo" >
                                  <input type="submit" value="Volver"><br>
                                  </form>

                        </td>
                    </tr>
                    </table>

                    </c:when>
               <c:when test="${fn:contains(param.tipo, noRegistrado)}"   >

                    <div class="catalog">
                   <center><table style="width:550px;">
                       <tr>
                       <td class="head" align="center">Datos Usuario no Activado</td>

                       </tr>
                       <tr>
                       <td class="dato" align="center">
                            <form action="/ProyectoWI/classes/ControladorUsuario" >
                                 

                                
                                <br> ID:<br>
                                <input type="text" disabled readonly name="idUsuario" id="url"  value="${usuario.idUsuario}" />

                                <br> Nombre:<br>
                                <input type="text" disabled readonly name="Nombre" id="url"  value="${usuario.nombre}" />

                                <br> Apellidos:<br>
                                <input type="text" disabled readonly name="Apellidos" id="url"  value="${usuario.apellidos}" />

                                <br> CorreoElectronico:<br>
                                <input type="text" disabled readonly name="correoElectronico" id="url"  value="${usuario.correoElectronico}" />

                                <br> Direccion:<br>
                                <input type="text" disabled readonly name="direccion" id="url"  value="${usuario.direccion}" />

                                <br> DNI:<br>
                                <input type="text" disabled readonly name="dni" id="url"  value="${usuario.dni}" />

                                <br> Numero de Tarjeta:<br>
                                <input type="text" disabled readonly name="numTarjeta" id="url"  value="${usuario.numTarjeta}" />

                                <hr>

                                
                                  <br> Estado<br>
                                <select name="estado">
                                    <option value="2"> - Pendiente de Activación - </option>
                                    <option value="1"> - Activar -</option>
                                </select>
                                 

                                 <input type="hidden" name="accion" value="ModificarNoRegistrado">
                                   <br>
                                   <br>
                                 <input type="submit" value="Modificar Usuario"><br>
                                 </form>
                                 <br>
                                 <form action="/ProyectoWI/classes/ControladorUsuario" >
                                     <input type="hidden" name="accion" value="VolverUsuariosNoRegistrados" >
                                  <input type="submit" value="Salir sin guardar"><br>
                                  </form>

                        </td>
                    </tr>
                    </table>

                    </c:when>


                   <c:when test="${fn:contains(param.tipo, Registrado)}"   >
                       
                        <div class="catalog">
                   <center><table style="width:550px;">
                       <tr>
                       <td class="head" align="center">Datos  de Usuario Registrado</td>

                       </tr>
                       <tr>
                       <td class="dato" align="center">
                                <form action="/ProyectoWI/classes/ControladorUsuario" >
                                     
                                    <br> ID:<br>
                                    <input type="text" disabled readonly name="idUsuario" id="url"  value="${usuario.idUsuario}" />

                                    <br> Nombre:<br>
                                    <input type="text" disabled readonly name="Nombre" id="url"  value="${usuario.nombre}" />

                                    <br> Apellidos:<br>
                                    <input type="text" disabled readonly name="Apellidos" id="url"  value="${usuario.apellidos}" />

                                    <br> CorreoElectronico:<br>
                                    <input type="text" disabled readonly name="correoElectronico" id="url"  value="${usuario.correoElectronico}" />

                                    <br> Direccion:<br>
                                    <input type="text" disabled readonly name="direccion" id="url"  value="${usuario.direccion}" />

                                    <br> DNI:<br>
                                    <input type="text" disabled readonly name="dni" id="url"  value="${usuario.dni}" />

                                    <br> Numero de Tarjeta:<br>
                                    <input type="text" disabled readonly name="numTarjeta" id="url"  value="${usuario.numTarjeta}" />

                                    <hr>

                                    <br> Contraseña Nueva:<br>
                                    <input type="text"  name="pass" id="url" />
                                     <br> Estado<br>
                                    <select name="estado">
                                        <option value="1"> - Activado - </option>
                                        <option value="3"> - Dar de Baja -</option>
                                    </select>


                                    <input type="hidden" name="accion" value="ModificarRegistrado">
                                       <br>
                                       <br>
                                     <input type="submit" value="Modificar Usuario"><br>
                                     </form>
                                     <br>
                                     <form action="/ProyectoWI/classes/ControladorUsuario" >
                                         <input type="hidden" name="accion" value="VolverUsuariosRegistrados" >
                                      <input type="submit" value="Salir sin guardar"><br>
                                      </form>

                            </td>
                        </tr>
                        </table>

                        </c:when>




                       <c:when test="${fn:contains(param.tipo, Baja)}"   >

                        <div class="catalog">
                   <center><table style="width:550px;">
                       <tr>
                       <td class="head" align="center">Datos  de Usuario Dado de baja</td>

                       </tr>
                       <tr>
                       <td class="dato" align="center">
                                <form action="/ProyectoWI/classes/ControladorUsuario" >
                                     
                                    <br> ID:<br>
                                    <input type="text" disabled readonly name="idUsuario" id="url"  value="${usuario.idUsuario}" />

                                    <br> Nombre:<br>
                                    <input type="text" disabled readonly name="Nombre" id="url"  value="${usuario.nombre}" />

                                    <br> Apellidos:<br>
                                    <input type="text" disabled readonly name="Apellidos" id="url"  value="${usuario.apellidos}" />

                                    <br> CorreoElectronico:<br>
                                    <input type="text" disabled readonly name="correoElectronico" id="url"  value="${usuario.correoElectronico}" />

                                    <br> Direccion:<br>
                                    <input type="text" disabled readonly name="direccion" id="url"  value="${usuario.direccion}" />

                                    <br> DNI:<br>
                                    <input type="text" disabled readonly name="dni" id="url"  value="${usuario.dni}" />

                                    <br> Numero de Tarjeta:<br>
                                    <input type="text" disabled readonly name="numTarjeta" id="url"  value="${usuario.numTarjeta}" />


                                     <hr>

                                     <br> Estado<br>
                                    <select name="estado">
                                        <option value="3"> - Dado de Baja - </option>
                                        <option value="1"> - Activar - </option>
                                    </select>
                                     
                                     <input type="hidden" name="accion" value="ModificarBaja">
                                       <br>
                                       <br>
                                     <input type="submit" value="Modificar Usuario"><br>
                                     </form>
                                     <br>
                                     <form action="/ProyectoWI/classes/ControladorUsuario" >
                                         <input type="hidden" name="accion" value="VolverUsuariosBaja" >
                                      <input type="submit" value="Salir sin guardar"><br>
                                      </form>

                            </td>
                        </tr>
                        </table>

                        </c:when>
        <c:otherwise>
            </c:otherwise>
                    </c:choose>
                    </c:if>

</div>
   <%@include file="/seccionLogin.jsp"%>
</div>

        
    </body>
</html>
