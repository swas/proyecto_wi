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
      <link rel="stylesheet" href="/ProyectoWI/scripts/rateit/rateit.css" type="text/css"/>
      <link rel="stylesheet" href="/ProyectoWI/scripts/colorbox/colorbox.css" type="text/css"/>
      <script src="/ProyectoWI/scripts/jquery.js" type="text/javascript" charset="utf-8"></script>
      <script src="/ProyectoWI/scripts/rateit/jquery.rateit.min.js" type="text/javascript" charset="utf-8"></script>
      <script src="/ProyectoWI/scripts/colorbox/jquery.colorbox-min.js" type="text/javascript" charset="utf-8"></script>
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

    <div class="catalog">
        
        <form action="/ProyectoWI/classes/ControladorArticulo">

           <c:set var="art" value="${requestScope['articulo']}" />
           <p><img src="${art.urlImagen}"></p>
           <p>${art.titulo}</p>
           <p>Director: ${art.autor}</p>
           <p>Actores: 
            <c:forEach items="${art.actores}" var="act">
                <c:out value="${act}. "/> 
            </c:forEach> </p>
           <p>Categorías: 
            <c:forEach items="${art.categorias}" var="cat">
                <c:out value="${cat}. "/> 
            </c:forEach> </p>
           <p>Año:${art.anho}</p>
           <p>Precio: ${art.precio} &euro; </p>
           <input type="hidden" name="id" value="${art.idArticulo}">
           <input type="hidden" name="accion" value="Comprar2">
           <c:choose>
               <c:when test="${art.cantidad==0}">
                    <p style="color: red;">El producto esta agotado. Disculpe las molestias.</p>
               </c:when>
               <c:when test="${!empty id}">
                    <p><select name="cantidad" size="1"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select><input type="submit" value="Comprar"></p>
               </c:when>
               <c:otherwise>
                    <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=registro">Registrese</a> o <a href="/ProyectoWI/classes/ControladorUsuario?accion=login">inicie sesi&oacute;n</a> para comprar</p>
               </c:otherwise>
           </c:choose>
           </form>


           <div class="star-box giga-star"> 

               <div class="starRat titlePageSprite star-box-giga-star">${art.puntuacion}</div>
               <div class="rating-box">
                   Tu puntuación: <div id="rateit" class="rateit" data-rateit-resetable="false" data-rateit-value="${puntuacion_user}" data-productid="${art.idArticulo}" data-rateit-step="1" data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="10"></div>                   
               </div> 
                <div class="star-box-details">
                Puntuaciones: <strong><span itemprop="ratingValue" class="starRat">${art.puntuacion}</span></strong><span class="mellow">/<span itemprop="bestRating">10</span></span> de <span itemprop="ratingCount" id="rat_users">${art.n_puntaciones}</span> usuarios
                </div>               
               <div class="clear"></div>
           </div>           
           
          
           
           

  <script type ="text/javascript">
     //we bind only to the rateit controls within the products div
     $('#rateit').bind('rated reset', function (e) {
         var ri = $(this);
         var uid = '${id}';
         
         if (!uid) {
             $.colorbox({inline:true, href:"#inline_content", width:"50%",open:true});
             ri.rateit('value',0);
             return false;
         }
         
         

         //if the use pressed reset, it will get value: 0 (to be compatible with the HTML range control), we could check if e.type == 'reset', and then set the value to  null .
         var value = ri.rateit('value');
         var productID = ri.data('productid'); // if the product id was in some hidden field: ri.closest('li').find('input[name="productid"]').val()
 

         $.ajax({
             url: '/ProyectoWI/classes/ControladorArticulo',
             data: { id: productID, puntuacion: value, accion: 'puntuar' ,uid: uid },
             dataType: 'json',
             type: 'GET',
             success: function (data) {
                 $('.starRat').text(data.puntuacion );
                 $('#rat_users').text(data.n_puntuaciones );
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
<%@include file="/comun/seccionLogin.jsp"%>
    </div>
         
		<div style='display:none'>
			<div id='inline_content' style='padding:10px; background:#fff;'>
                            <p><a href="/ProyectoWI/classes/ControladorUsuario?accion=registro">Registrese</a> o <a href="/ProyectoWI/classes/ControladorUsuario?accion=login">inicie sesi&oacute;n</a> para puntuar</p>
			</div>
		</div>        
         

    </body>
</html>
