<%-- 
    Document   : detallesCD
    Created on : 05-abr-2011, 0:18:54
    Author     : Pablo
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <title>Detalles</title>
      <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
      <link rel="stylesheet" href="/ProyectoWI/rateit/rateit.css" type="text/css"/>
      <script src="/ProyectoWI/rateit/jquery.js" type="text/javascript" charset="utf-8"></script>
      <script src="/ProyectoWI/rateit/jquery.rateit.min.js" type="text/javascript" charset="utf-8"></script>
    </head>
    <body bgcolor="#FDF5E6">

      <table align="center" border="0">
          <tr valign="middle">
            <th><img  src="/ProyectoWI/imagenes/dibujoMusica.jpg"></th>
            <th> <font face="Times New Roman,Times" size="+3">Detalles del CD</font></th>
	</tr>
      </table>

      <hr>


        <!--Obtenemos el contenido de la sesion-->

      <div class="centro">

        <div id="menuv">
        <ul>
                <li>Categorias</li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Español">Pop-Rock Español</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Internacional">Pop-Rock Internacional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Clasico">Clásico</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Dance">Dance</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Rap/Hip-Hop">Rap/Hip-Hop</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Chill Out">Chill Out</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Bandas Sonoras">Bandas Sonoras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Jazz-Blues">Jazz-Blues</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Flamenco y Cancion">Flamenco y Cancion Española</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Musicas del Mundo">Músicas del Mundo</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Regional">Regional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Infantil">Infantil</a></li>

        </ul>
        </div>

      <div class="login">

          <c:set var="var" value="C" />
          <c:choose>
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

    <div class="catalog">
        
        <form action="/ProyectoWI/classes/ControladorArticulo">

           <c:set var="art" value="${requestScope['articulo']}" />
           <p><img src="${art.urlImagen}"></p>
           <p>${art.titulo}</p>
           <p>${art.autor}</p>
           <p>${art.categoria} &nbsp;&nbsp; ${art.anho}</p>
           <p>Precio: ${art.precio} &euro; </p>
           <input type="hidden" name="id" value="${art.idArticulo}">
           <input type="hidden" name="accion" value="Comprar">
           <c:choose>
               <c:when test="${art.cantidad==0}">
                    <p style="color: red;">El producto esta agotado. Disculpe las molestias.</p>
               </c:when>
               <c:when test="${!empty id}">
                    <p><select name="cantidad" size="1"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select><input type="submit" value="Comprar"></p>
               </c:when>
               <c:otherwise>
                    <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=registro">Registrese</a> o inicie sesi&oacute;n para comprar</p>
               </c:otherwise>
           </c:choose>
           </form>

           <c:choose>
               <c:when test="${requestScope['come']==1}">
                   <form action="/ProyectoWI/classes/ControladorArticulo">
                       <p><textarea cols="30" rows="5" name="comenta" style="resize: none;"></textarea></p>
                       <p><input type="submit" value="Enviar"></p>
                       <input type="hidden" name="idA" value="${art.idArticulo}">
                       <input type="hidden" name="accion" value="Comentar">
                   </form>
               </c:when>
               <c:otherwise>
                   <p style="color: red;">Necesita comprar este producto para poder valorarlo.</p>
               </c:otherwise>
           </c:choose>


           <c:forEach var="comenting" items="${art.comentarios}" varStatus="row">
               <c:choose>
                   <c:when test="${row.count % 2 != 0}">
                        <p><c:out value="${comenting}"></c:out>:
                   </c:when>
                   <c:otherwise>
                        <c:out value="${comenting}"></c:out></p>
                   </c:otherwise>
               </c:choose>
           </c:forEach>
        
    </div>

    </div>

    </body>
</html>