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
            <%@include file="/seccionTitulo.jsp"%>
	</tr>
      </table>

	  <center>           
            
            <form action="/ProyectoWI/classes/ControladorArticulo" >

            
             <input type="text" name="tituloBUS" id="url"  value="${tit}" onfocus="if(this.value=='Titulo')this.value=''" />
            
            <input type="text" name="autorBUS" id="url"  value="${aut}" onfocus="if(this.value=='Autor')this.value=''" />
            
           
            <select name="precioBUS">
                <option value="${prec}">${prec}</option>
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="40">40</option>
		<option value="50">50</option>
		<option value="60">60</option>
		<option value="70">70</option>
		<option value="80">80</option>
		<option value="90">90</option>
		
	      </select>

                €&nbsp;&nbsp;
              
                <select name="anhoBUS">
                <option value="${anh}">${anh}</option>
                <option value="2011">2012</option>
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

            
            <input type="hidden" name="accion" value="busquedaAvanzada2" size = "15" class = "formularioAlta">
            &nbsp;&nbsp;
            <input type="submit" value="Buscar">

            </form>
      </center>	   

    <hr>

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
          
          <c:set var="variable" value="A" />
          <c:set var="var" value="C" />
          <c:choose>
          <c:when test="${fn:contains(id, variable)}">

              <p style="color: white">Admin</p>


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
        
         <div class="catalogo_head">
             <center>
                 <table style="float: left">
      <tr>
       <th width="160px" class="head">Carátula</th>
       <th width="35px" class="head">Cod. CD</th>
       <th width="180px" class="head">Título</th>
       <th width="120px" class="head">Autor</th>
       <th width="20px" class="head">Precio</th>
      </tr>
      </table>
        </center>  
         </div>
    <div class="catalogo">
      
          
      
      <center>
      <table style="width:550px;">
      <c:set var="catalog" value="${requestScope['cata']}" />

      <c:choose>
      <c:when test="${empty catalog}">
         
            <jsp:forward page="/classes/ControladorArticulo?accion=Destacados"></jsp:forward>
          
      </c:when>
      <c:otherwise>     
          
      <c:forEach var="entry" items="${catalog.elementos}">
       <tr>
       <td width="160px" class="dato" align="center"><img  src="${entry.urlImagen}" /></td>
       <td width="35px"class="dato" align="center"><c:out value="${entry.idArticulo}" /></td>
       <td width="180px" class="dato" align="center"><a href="/ProyectoWI/classes/ControladorArticulo?accion=Select&cd=${entry.titulo}"><c:out value="${entry.titulo}" /></a></td>
       <td width="120px" class="dato" align="center"><c:out value="${entry.autor}" /></td>
       <td width="20px"class="dato" align="center"><c:out value="${entry.precio}" /></td>
       </tr>
       </c:forEach>
      </c:otherwise>
      </c:choose>

      </table></center>
    </div>

    </div>

    </body>
</html>
