<%-- 
    Document   : CrearProducto
    Created on : 30-abr-2019, 16:34:30
    Author     : Manu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insertar Producto</h1>
             <form:form modelAttribute="productos" action="nuevoProducto" method="POST">
            Nombre:
            <form:input path="nombre_producto" id="nombre_producto" type="text"/>  <br>
            Descripcion:
            <form:input path="descripcion_producto" id="descripcion_producto" type="text"/> <br>
            Cantidad:
            <form:input path="cantidad_producto" id="cantidad_producto" type="text"/> <br>
            Precio:
            <form:input path="precio_producto" id="precio_producto" type="text"/> <br>
            Foto:
            <form:input path="foto_producto" id="foto_producto" type="text"/> <br>
            Referencia:
            <form:input path="referencia_producto" id="referencia_producto" type="text"/> <br>
            <input type="submit" value="Crear" class="btn btn-success" id="boton"/>
        </form:form> 
            <a href="verProductos"><h5>Volver</h5></a>
    </body>
</html>
