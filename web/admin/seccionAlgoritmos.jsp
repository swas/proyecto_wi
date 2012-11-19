<%-- 
    Document   : seccionAlgoritmos
    Created on : 18-nov-2012, 23:52:16
    Author     : Pablo
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
      <jsp:useBean id="catalogo" class="classes.vo.busquedaArticuloVO" scope="session"/>
      <%@include file="/comun/seccionTitulo.jsp"%>

<hr>

<div class="centro">

	<%@include file="/admin/seccionMenuArticulo.jsp"%>
            
        
<div class="catalog">
    
   <center>
       
       <form action="/ProyectoWI/classes/ControladorArticulo" >
           <p> 
                <select name="algoritmo">
                    <option value="filtrado">Filtrado por contenido</option>
                    <option value="user">User-based</option>
                    <option value="item">Item-based</option>
                    <option value="slop">Slop-one</option>           
                </select>
           </p>
           <p> 
                <select name="distanciaU">
                    <option value="loglikelihood">LogLikelihood</option>
                    <option value="pearson">Pearson</option>
                    <option value="tanimoto">Tanimoto</option>                             
                    <option value="spearman">Spearman</option> 
                </select>
           </p>
           <p> 
                <select name="distanciaI">
                    <option value="loglikelihood">LogLikelihood</option>
                    <option value="pearson">Pearson</option>
                    <option value="tanimoto">Tanimoto</option>                                                 
                </select>
           </p>
           
           <input type="hidden" name="accion" value="seleccionAlgoritmos">
           
           <p><input type="submit" value="Aceptar"></p>
           
        </form>
       
   </center>    
    
</div>
        
        <%@include file="/comun/seccionLogin.jsp"%>
        
</div>
    </body>
</html>

