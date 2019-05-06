<%-- 
    Document   : CrearProducto
    Created on : 30-abr-2019, 16:34:30
    Author     : Manu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript"> 
               $(document).ready(function(){
                    $("#boton").click(function(){
                    //alert("hola");
                    var pasar=true
                    if( $("#nombre_producto").val() === ""){
                        $("#error_nombre").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre para el nuevo producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_nombre").html("");                        
                    }
                    
                    if( $("#descripcion_producto").val() === ""){
                        $("#error_descripcion").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una descripcion para el nuevo producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_descripcion").html("");                        
                    }
                    
                    if( $("#referencia_producto").val() === "" ){
                        $("#error_referencia").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una referencia para el nuevo producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br>");                   
                        pasar=false;
                    }else{
                        $("#error_referencia").html("");                        
                    }
                    return pasar;
                });
            });
         </script>
    </head>
    <body>
        <h1>Insertar Producto</h1>
             <form:form modelAttribute="productos" action="nuevoProducto" method="POST">
            Nombre:
            <form:input path="nombre_producto" id="nombre_producto" type="text"/>  <br>
            <span id="error_nombre"></span>
            Descripcion:
            <form:input path="descripcion_producto" id="descripcion_producto" type="text"/> <br>
            <span id="error_descripcion"></span>
            Cantidad:
            <form:input path="cantidad_producto" id="cantidad_producto" type="text"/> <br>
            <span id="error_cantidad"></span>
            Precio:
            <form:input path="precio_producto" id="precio_producto" type="text"/> <br>
            <span id="error_precio"></span>
            Foto:
            <form:input path="foto_producto" id="foto_producto" type="text"/> <br>
            Referencia:
            <form:input path="referencia_producto" id="referencia_producto" type="text"/> <br>
            <span id="error_referencia"></span>
            Categoria:
		<form:select path="id_subcategoria">
                     <c:forEach var="cat" items="${listaCategoria}">
			<form:option value="${cat.id_subcategoria}" label="${cat.nombre_categoria} - ${cat.nombre_subcategoria}"/>
			</c:forEach>
                </form:select><br>
            <input type="submit" value="Crear" class="btn btn-success" id="boton"/>
        </form:form> 
            <a href="verProductos"><h5>Volver</h5></a>
    </body>
</html>
