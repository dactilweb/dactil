<%-- 
    Document   : CrearProducto
    Created on : 30-abr-2019, 16:34:30
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
             <form:form modelAttribute="productos" action="nuevoProducto" method="POST">
            Nombre:
            <form:input path="nombre_producto" id="nombre_producto" type="text"/>  
             Apellido
            <form:input path="descripcion_producto" id="descripcion_producto" type="text"/> 
             Apellido2
            <form:input path="cantidad_producto" id="cantidad_producto" type="text"/> 
             Direccion
            <form:input path="precio_producto" id="precio_producto" type="text"/> 
             Direccion2
            <form:input path="foto_producto" id="foto_producto" type="text"/> 
            
            <input type="submit" value="Crear" class="btn btn-success" id="boton"/>
        </form:form> 
    </body>
</html>
