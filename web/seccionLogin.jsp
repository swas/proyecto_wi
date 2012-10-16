<%--
    Document   : seccionLogin
    Created on : 03-abr-2011, 0:57:04
    Author     : Sony Vaio
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <div class="login" style="float:top;">

          <c:set var="variable" value="A" />
          <c:set var="var" value="C" />
          <c:choose>
          <c:when test="${fn:contains(id, variable)}">
                <p style="color: white">Administrador</p>
              <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=LogOut"><button style="width:160;height:24; background-color:#FDF5E6; ">Salir</button></a></p>


          </c:when>
          <c:when test="${fn:contains(id, var)}">

            <p style="color: white">Bienvenido</p>
            <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=Micuenta"><button style="width:160;height:24; background-color:#FDF5E6; ">Mi Cuenta</button></a></p>
            <p><a href="/ProyectoWI/classes/ControladorArticulo?accion=Carrito"><button style="width:160;height:24; background-color:#FDF5E6; ">Carrito</button></a></p>
            <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=LogOut"><button style="width:160;height:24; background-color:#FDF5E6; ">Salir</button></a></p>

          </c:when>
          <c:otherwise>
              <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=login"><button style="width:160;height:24; background-color:#FDF5E6; ">Login</button></a></p>
              <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=registro"><button style="width:160;height:24; background-color:#FDF5E6; ">Registrarse</button></a></p>
          </c:otherwise>
          </c:choose>

      </div>
</html>
