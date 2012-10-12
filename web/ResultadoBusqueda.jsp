
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
      <jsp:useBean id="tabla" class="classes.vo.ShoppingCart" scope="session"/>


        
  <c:if test="${fn:contains(id, variable)}">

      <a href="/ProyectoWI/classes/Controlador?accion=login">Administrador</a>

  </c:if>





      <table align="center" border="0">
	<tr>
	  <th><IMG SRC="" ALIGN="CENTER"></th>

	  <th> <img  src="/ProyectoWI/imagenes/dibujoMusica.jpg"><font face="Times New Roman,Times" size="+3">Música para DAA</font></th>

	  <th><IMG SRC="" ALIGN="CENTER"></th>
	</tr>
      </table>
      <hr>
	<p>
	  <center>
	   <center>
            <p>
            <h4> Buscar Avanzada </h4>
            </p>
            <form action="/ProyectoWI/classes/ControladorCompra" >


            <input type="text" name="titulo" id="url"  value="Titulo" onfocus="if(this.value=='Titulo')this.value=''" />

            <input type="text" name="autor" id="url"  value="Autor" onfocus="if(this.value=='Autor')this.value=''" />


            <select name="precioMáximo">
                <option> - precio Máximo - </option>
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="40">40</option>
		<option value="50">50</option>
		<option value="60">60</option>
		<option value="70">70</option>
		<option value="80">80</option>
		<option value="90">90</option>
		<option value="100">100</option>
	      </select>€

                <select name="anho">
                <option> - AÑO - </option>
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

            <br>
            <input type="hidden" name="accion" value="busquedaAvanzada" size = "15" class = "formularioAlta">
             <center>
            <input type="submit" value="Selecciona Producto">
             </center>
            </p>
            </div>
            </form>
              </center>

	  </center>

<hr>


	
      
        <div id="menuv">
        <ul>
                <li>Categorias</li>
                <li><a href="#menuv">Pop-Rock Español</a></li>
                <li><a href="#menuv">Pop-Rock Internacional</a></li>
                <li><a href="#menuv">Clásico</a></li>
                <li><a href="#menuv">Dance</a></li>
                <li><a href="#menuv">Rap/Hip-Hop</a></li>
                <li><a href="#menuv">Chill Out</a></li>
                <li><a href="#menuv">Bandas Sonoras</a></li>
                <li><a href="#menuv">Jazz-Blues</a></li>
                <li><a href="#menuv">Flamenco y Cancion Española</a></li>
                <li><a href="#menuv">Músicas del Mundo</a></li>
                <li><a href="#menuv">Regional</a></li>
                <li><a href="#menuv">Infantil</a></li>

        </ul>


</div>
<div id="ResultadoBusqueda">
 <TABLE BORDER="1" class="sample"  >
                  
                     <!--Recorremos el carrito de la compra para imprimir cada uno de los elementos-->
                     <c:forEach var="entry" items="${tabla.elementos}">

                        <TR>
                        <TH>
                        <p class="alinear">
                        <img  src=${entry.urlImagen}>
                        <p class="texto">
                        
                            ${entry.titulo}
                            <br>
                        
                            ${entry.cantidad}
                        
                            <br>
                            ${entry.precio}
                        </TH>
                        </TR>
                     </c:forEach>

                    </TR>
                    
                    
                    
        </TABLE>
  </div>

    </body>
</html>
