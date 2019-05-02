<%-- 
    Document   : modificarProducto
    Created on : 30-abr-2019, 18:10:51
    Author     : Manu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <h1>Modificar Productos</h1>
        <form:form modelAttribute="productos" action="modificarProducto" method="POST">

            Nombre:
            <form:input path="nombre_producto"/> <br/>
            Descripción:
            <form:input path="descripcion_producto"/> <br/>
            Cantidad:
            <form:input path="cantidad_producto"/> <br/>
            Precio:
            <form:input path="precio_producto"/> <br/>
            Foto:
            <form:input path="foto_producto"/> <br/>
            Numero de referencia:
            <form:input path="referencia_producto"/> <br/>
            
            <form:hidden path="id_producto"/>
            <input type="submit" value="Modificar" class="btn btn-success" id="boton"/>
        </form:form>
            <a href="verProductos"><h5>Volver</h5></a>
    </body>
</html>
