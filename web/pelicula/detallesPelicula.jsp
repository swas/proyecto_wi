<%-- 
    Document   : detallesPelicula
    Created on : 24-oct-2012, 1:54:26
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
            <%@include file="/comun/seccionTitulo.jsp"%>
	</tr>
      </table> 

      <hr>


        <!--Obtenemos el contenido de la sesion-->

      <div class="centro">

        <%@include file="/comun/seccionMenuPrincipal.jsp"%>
        
        <%@include file="/comun/seccionLogin.jsp"%>

    <div class="catalog">
        
        <form action="/ProyectoWI/classes/ControladorArticulo">

           <c:set var="art" value="${requestScope['articulo']}" />
           <p><img src="${art.urlImagen}"></p>
           <p>${art.titulo}</p>
           <p>${art.titulospain}</p>
           <p>${art.directores}</p>
           <p>${art.actores}</p>
           <p>${art.pais}</p>
           <p>${art.anho}</p>
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


           <div class="star-box giga-star"> 

               <div class="titlePageSprite star-box-giga-star">9.3</div>
               <div class="rating-box">
                   Tu puntuación: <div id="rateit" class="rateit" data-productid="${art.idArticulo}" data-rateit-step="1" data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="10"></div>                   
               </div> 
                <div class="star-box-details">
                Puntuaciones: <strong><span itemprop="ratingValue">9.3</span></strong><span class="mellow">/<span itemprop="bestRating">10</span></span> de <a onclick="(new Image()).src='/rg/title-gigastar/votes/images/b.gif?link=ratings';" href="ratings" title="840,695 IMDb users have given an average vote of 9.3/10"><span itemprop="ratingCount">840,695</span> usuarios</a>
                <br>Reviews: <a onclick="(new Image()).src='/rg/title-gigastar/user-reviews/images/b.gif?link=reviews';" href="reviews" title="2495 IMDb user reviews"><span itemprop="reviewCount">2,495</span> user</a> <span class="ghost">|</span> 
                <a onclick="(new Image()).src='/rg/title-gigastar/external-reviews/images/b.gif?link=externalreviews';" href="externalreviews" title="155 external critic reviews"><span itemprop="reviewCount">155</span> critic</a> <span class="ghost">|</span> 
                <a onclick="(new Image()).src='/rg/title-gigastar/critics-reviews/images/b.gif?link=criticreviews';" href="criticreviews" title="19 review excerpts provided by Metacritic.com">19</a> from <a onclick="(new Image()).src='/rg/title-gigastar/metacritic-link/images/b.gif?link=http%3A%2F%2Fwww.metacritic.com';" href="http://www.metacritic.com" target="_blank">Metacritic.com</a>
                </div>               
               <div class="clear"></div>
           </div>           
           
          
           
           

  <script type ="text/javascript">
     //we bind only to the rateit controls within the products div
     $('#rateit').bind('rated reset', function (e) {
         var ri = $(this);
         

         //if the use pressed reset, it will get value: 0 (to be compatible with the HTML range control), we could check if e.type == 'reset', and then set the value to  null .
         var value = ri.rateit('value');
         var productID = ri.data('productid'); // if the product id was in some hidden field: ri.closest('li').find('input[name="productid"]').val()
 

         $.ajax({
             url: '/ProyectoWI/classes/ControladorArticulo',
             data: { id: productID, puntuacion: value, accion: 'puntuar' },
             type: 'GET',
             success: function (data) {
                 console.log(data);
             },
             error: function (jxhr, msg, err) {
                 console.log(msg, err);
             }
         });
     });
     
    var tooltipvalues = ['Muy mala', 'Mala', 'Floja', 'Regular', 'Pasable', 'Interesante', 'Buena', 'Notable', 'Muy Buena', 'Excelente'];
    $("#rateit").bind('over', function (event, value) { 
        $(this).attr('title', tooltipvalues[value-1]); 
    });     
 
 
 </script>      
           
           
           
           
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
