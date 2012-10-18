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
      <script type="text/javascript" src="/ProyectoWI/funciones.js"></script>
      <title>Musica para DAA</title>
      <link rel="stylesheet" href="/ProyectoWI/estilo.css" type="text/css"/>
    </head>
    <body bgcolor="#FDF5E6">
        <c:set var="variable" value="A" />
      <jsp:useBean id="id" class="java.lang.String" scope="session"/>
      <jsp:useBean id="articulo" class="classes.vo.DiscoVO" scope="session"/>



 



      <%@include file="/seccionTitulo.jsp"%>

     <%@include file="/seccionBuscador.jsp"%>

<hr>

<div class="centro">
	<%@include file="/seccionMenuArticulo.jsp"%>
      
   <%@include file="/seccionLogin.jsp"%>
    <div class="catalog">
   <center><table style="width:550px;">
       <tr>
       <td class="head" align="center">Detalles de CD</td>

       </tr>
       <tr>
       <td class="dato" align="center">
        

           <c:set var="Nuevo" value="Nuevo" />
           <c:set var="ERROR" value="errorDuplicado"/>
           <c:set var="admin" value="admin"/>

       




           <c:if test="${fn:contains(id, variable)}">
               <c:choose>
                    <c:when test="${fn:contains(param.tipo, ERROR)}"   >
                    
                       <form action="/ProyectoWI/classes/ControladorArticulo" onSubmit="return valCamposArticulo(this);" >
                     <br>
                     <p class="Precio">CD duplicado introduzca otro titulo</p>
                    <br>Titulo:<br>
                    <input type="text" name="titulo" value="${articulo.titulo}" id="url" size="50"  />

                    <br> Autor:<br>
                    <input type="text" value="${articulo.autor}"name="autor" id="url"  />
                    <br>Año:<br>
                     <select name="anho">
                    <option value="${articulo.anho}">${articulo.anho}</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                    <option value="2009">2009</option>
                    <option value="2008">2008</option>
                    <option value="2007">2007</option>
                    <option value="2006">2006</option>
                    <option value="2005">2005</option>
                    <option value="2004">2004</option>
                    <option value="2003">2003</option>
                    <option value="2002">2002</option>
                    <option value="2001">2001</option>
                    <option value="2000">2000</option>
                    <option value="1999">1999</option>
                    <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
                    <option value="1994">1994</option>
                    <option value="1993">1993</option>
                    <option value="1992">1992</option>
                    <option value="1991">1991</option>
                    <option value="1990">1990</option>

                    </select>
                    <br>Cantidad:<br>
                    <input type="text" value="${articulo.cantidad}"name="cantidad" id="url"   />
                    <br>Precio:<br>
                    <input type="text" name="precio" value="${articulo.precio}"id="url"  />
                    <br>Categoría:<br>
                    <select name="categoria">
                            <option value="${articulo.anho}">${articulo.anho}</option>
                            <option value="Pop-Rock Español">Pop-Rock Español</option>
                            <option value="Pop-Rock Internacional">Pop-Rock Internacional</option>
                            <option value="Clásico">Clásico</option>
                            <option value=" Rap/Hip-Hop"> Rap/Hip-Hop</option>
                            <option value="Chill Out">Chill Out</option>
                            <option value="Bandas Sonoras">Bandas Sonoras</option>
                            <option value="Jazz-Blues">Jazz-Blues</option>
                            <option value="Flamenco y Cancion Española">Flamenco y Cancion Española</option>
                            <option value=" Músicas del Mundo"> Músicas del Mundo</option>
                            <option value="Regional">Regional</option>
                            <option value="Infantil">Infantil</option>
                          </select>

                     <br> URL:<br>
                     <input type="text" name="urlImagen" value="${articulo.urlImagen}" id="url"  value="${articulo.urlImagen}" />

                     <input type="hidden" name="accion" value="CDNuevo">
                       <br>
                       <br>
                     <input type="submit" value="Anhadir Articulo"><br>
                     </form>
                     <br>
                     <form action="/ProyectoWI/classes/ControladorArticulo" >
                         <input type="hidden" name="accion" value="VolverACatalogo" >

                      <input type="submit" value="Salir sin guardar"><br>

                   </c:when>
                   <c:when test="${fn:contains(articulo.autor, Nuevo)}"   >
                       
                       <form action="/ProyectoWI/classes/ControladorArticulo" onSubmit="return valCamposArticulo(this);" >
                     <h2 class="titulo">Insertar CD Nuevo</h2>

                    <br>Titulo:<br>
                    <input type="text" name="titulo" id="url" size="50"  />

                    <br> Autor:<br>
                    <input type="text" name="autor" id="url"  />
                    <br>Año:<br>
                     <select name="anho">
                    
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                    <option value="2009">2009</option>
                    <option value="2008">2008</option>
                    <option value="2007">2007</option>
                    <option value="2006">2006</option>
                    <option value="2005">2005</option>
                    <option value="2004">2004</option>
                    <option value="2003">2003</option>
                    <option value="2002">2002</option>
                    <option value="2001">2001</option>
                    <option value="2000">2000</option>
                    <option value="1999">1999</option>
                    <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
                    <option value="1994">1994</option>
                    <option value="1993">1993</option>
                    <option value="1992">1992</option>
                    <option value="1991">1991</option>
                    <option value="1990">1990</option>

                    </select>
                    <br>Cantidad:<br>
                    <input type="text" name="cantidad" id="url"   />
                    <br>Precio:<br>
                    <input type="text" name="precio" id="url"  />
                    <br>Categoría:<br>
                    <select name="categoria">
                            <option value="Pop-Rock Español">Pop-Rock Español</option>
                            <option value="Pop-Rock Internacional">Pop-Rock Internacional</option>
                            <option value="Clásico">Clásico</option>
                            <option value=" Rap/Hip-Hop"> Rap/Hip-Hop</option>
                            <option value="Chill Out">Chill Out</option>
                            <option value="Bandas Sonoras">Bandas Sonoras</option>
                            <option value="Jazz-Blues">Jazz-Blues</option>
                            <option value="Flamenco y Cancion Española">Flamenco y Cancion Española</option>
                            <option value=" Músicas del Mundo"> Músicas del Mundo</option>
                            <option value="Regional">Regional</option>
                            <option value="Infantil">Infantil</option>
                          </select>

                     <br> URL:<br>
                     <input type="text" name="urlImagen" id="url"  value="${articulo.urlImagen}" />

                     <input type="hidden" name="accion" value="CDNuevo">
                       <br>
                       <br>
                     <input type="submit" value="Anhadir Articulo"><br>
                     </form>
                     <br>
                     <form action="/ProyectoWI/classes/ControladorArticulo" >
                         <input type="hidden" name="accion" value="VolverACatalogo" >

                      <input type="submit" value="Salir sin guardar"><br>
      
                   </c:when>
                    
                   <c:otherwise>

                     <form action="/ProyectoWI/classes/ControladorArticulo" onSubmit="return valCamposArticulo(this);">
                     
                    <br> ID:<br>
                    <input type="text" disabled readonly name="idArticulo" id="url"  value="${articulo.idArticulo}" />

                    <br>Titulo:<br>
                    <input type="text" name="titulo" id="url" size="50"  value="${articulo.titulo}" />

                    <br> Autor:<br>
                    <input type="text" name="autor" id="url"  value="${articulo.autor}" />
                    <br>Año:<br>
                     <select name="anho">
                    <option value="${articulo.anho}">-- ${articulo.anho} --</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                    <option value="2009">2009</option>
                    <option value="2008">2008</option>
                    <option value="2007">2007</option>
                    <option value="2006">2006</option>
                    <option value="2005">2005</option>
                    <option value="2004">2004</option>
                    <option value="2003">2003</option>
                    <option value="2002">2002</option>
                    <option value="2001">2001</option>
                    <option value="2000">2000</option>
                    <option value="1999">1999</option>
                    <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
                    <option value="1994">1994</option>
                    <option value="1993">1993</option>
                    <option value="1992">1992</option>
                    <option value="1991">1991</option>
                    <option value="1990">1990</option>

                    </select>
                    <br>Cantidad:<br>
                    <input type="text" name="cantidad" id="url"  value="${articulo.cantidad}" />
                    <br>Precio:<br>
                    <input type="text" name="precio" id="url"  value="${articulo.precio}" />
                    <br>Categoría:<br>
                    <select name="categoria">
                        <option value="${articulo.categoria}"> - ${articulo.categoria} - </option>
                            <option value="Pop-Rock Español">Pop-Rock Español</option>
                            <option value="Pop-Rock Internacional">Pop-Rock Internacional</option>
                            <option value="Clásico">Clásico</option>
                            <option value=" Rap/Hip-Hop"> Rap/Hip-Hop</option>
                            <option value="Chill Out">Chill Out</option>
                            <option value="Bandas Sonoras">Bandas Sonoras</option>
                            <option value="Jazz-Blues">Jazz-Blues</option>
                            <option value="Flamenco y Cancion Española">Flamenco y Cancion Española</option>
                            <option value=" Músicas del Mundo"> Músicas del Mundo</option>
                            <option value="Regional">Regional</option>
                            <option value="Infantil">Infantil</option>
                          </select>

                     <br> URL:<br>
                     <input type="text" name="urlImagen" id="url"  value="${articulo.urlImagen}" />
                     <input type="hidden" name="borrar" value="no">
                     <input type="hidden" name="accion" value="GuardarDatosArticulo">
                       <br>
                       <br>
                     <input type="submit" value="Modificar Articulo">
                     </form>
                     
                     <br>
                     <form action="/ProyectoWI/classes/ControladorArticulo" >

                         <input type="hidden" name="accion" value="GuardarDatosArticulo" >
                         <input type="hidden" name="borrar" value="si">
                      <input type="submit" value="Borrar"><br><br>
                     </form>
                      <form action="/ProyectoWI/classes/ControladorArticulo" >
                         <input type="hidden" name="accion" value="VolverACatalogo" >
                      
                      <input type="submit" value="Salir sin guardar"><br>
                      </form>
</c:otherwise>
</c:choose>
</c:if>
</td></tr></TABLE>



         
  </div>

</div>
    </body>
</html>
