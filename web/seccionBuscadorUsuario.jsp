<%--
    Document   : seccionBuscadorUsuario
    Created on : 03-abr-2011, 0:57:04
    Author     : Sony Vaio
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


</html>




	   <center>
           
            <form action="/ProyectoWI/classes/ControladorUsuario" >
            <input type="text" name="correo" id="url"  value="Correo Electronico" onfocus="if(this.value=='Correo Electronico')this.value=''" />
           <input type="hidden" name="accion" value="busquedaAvanzadaUsuario" size = "15" class = "formularioAlta">
            &nbsp;&nbsp;
            <input type="submit" value="Buscar">

            </form>
              </center>

	  


        </html>