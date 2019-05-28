<%-- 
    Document   : modificarProducto
    Created on : 30-abr-2019, 18:10:51
    Author     : Manu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Productos</title>
        <jsp:include page="style.jsp" />
    </head>
    <body>
         <jsp:include page="nav.jsp" />
        <div class="contenido">
           <h1>Modificar Productos</h1>
        <form:form modelAttribute="productos" action="modificarProducto" method="POST">

            Nombre
            <form:input path="nombre_producto"/> <br/>
            Descripción
            <form:input path="descripcion_producto"/> <br/>
            Cantidad
            <form:input path="cantidad_producto"/> <br/>
            Precio
            <form:input path="precio_producto"/> <br/>
            Foto
            <form:input path="foto_producto"/> <br/>
            Número de referencia
            <form:input path="referencia_producto"/> <br/>
            
            Categoria
		<form:select path="id_subcategoria">
                     <c:forEach var="cat" items="${listaCategoria}">
			<form:option value="${cat.id_subcategoria}" label="${cat.nombre_categoria} - ${cat.nombre_subcategoria}"/>
			</c:forEach>
                </form:select><br>
                <form:hidden path="id_producto"/><br>
            <input type="submit" value="Modificar" class="btn btn-primary" id="boton"/>
        </form:form>
             
            <a href="verProductosAll" class="btn btn-secondary active" role="button" aria-pressed="true">Volver</a>
             </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
