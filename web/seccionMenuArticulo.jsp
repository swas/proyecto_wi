<%-- 
    Document   : seccion2
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
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Español">Pop-Rock Español</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Internacional">Pop-Rock Internacional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Clásico">Clásico</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Dance">Dance</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Rap">Rap/Hip-Hop</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Chill">Chill Out</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Bandas">Bandas Sonoras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Jazz">Jazz-Blues</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Flamenco">Flamenco y Cancion Española</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Mundo">Músicas del Mundo</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Regional">Regional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=BusquedaCategoria&categoria=Infantil">Infantil</a></li>


        </ul>
</div>
</html>
