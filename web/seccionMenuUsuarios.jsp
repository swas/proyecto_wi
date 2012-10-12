<%--
    Document   : seccionMenuUsuarios
    Created on : 03-abr-2011, 0:57:04
    Author     : Sony Vaio
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
  <div id="menuv">
        <ul>
                <c:set var="variable" value="A" />





                <c:if test="${fn:contains(id, variable)}">

                <li><p>Opciones</p></li>
                
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=IrAArticulos" id="opcion">Catalogo Articulos</a></li>
                <li><a href="/ProyectoWI/classes/ControladorUsuario?accion=IrAUsuarios">Clientes</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=AnhadirArticulo">Añadir Articulo</a></li>
                <li><a href="/ProyectoWI/classes/ControladorUsuario?accion=PerfilAdmin">Editar Perfil</a></li>

                   </c:if>
                <li><p>Categorias</p></li>
                <li><a href="/ProyectoWI/classes/ControladorUsuario?accion=UsuariosRegistrados">Clientes Registrados</a></li>
                <li><a href="/ProyectoWI/classes/ControladorUsuario?accion=UsuariosNoRegistrados">Clientes Pendientes</a></li>
                <li><a href="/ProyectoWI/classes/ControladorUsuario?accion=UsuariosDadosDeBaja">Clientes Dados de Baja</a></li>



        </ul>


</div>
</html>