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
  <c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if>      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Productos</title>
        <jsp:include page="style.jsp" />
           <script type="text/javascript">
    $(document).ready(function () {
        $("#btncreacion").click(function () {
            //alert("hola");
            var pasar = true
            if ($("#nom_prod").val() === "") {
                $("#error_nombrecito").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre para el producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombrecito").html("");
            }

            if ($("#des_prod").val() === "") {
                $("#error_descripcion").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una descripción para el producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_descripcion").html("");
            }

            if ($("#can_producto").val() === "") {
                $("#error_cantidad").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una cantidad para el producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_cantidad").html("");
            }

            if ($("#pre_producto").val() === "") {
                $("#error_precio").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un precio<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_precio").html("");
            }
            
            if ($("#ref_producto").val() === "") {
                $("#error_referencia").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una referencia<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_referencia").html("");
            }
            
            
            return pasar;
        });
    });
</script>
    </head>
    <body>
         <jsp:include page="nav.jsp" />
        <div class="contenido">
           <h1>Modificar Productos</h1>
        <form:form modelAttribute="productos" action="modificarProducto" method="POST">
           <div class="col-md-6">
            Nombre
            <form:input path="nombre_producto" id="nom_prod"/> <br/>
            <span id="error_nombrecito"></span>
           </div>   
             <div class="col-md-6">
            Descripción
            <form:input path="descripcion_producto" id="des_prod"/> <br/>
             <span id="error_descripcion"></span>
             </div>
             <div class="col-md-6">
            Cantidad
            <form:input path="cantidad_producto" id="can_producto"/> <br/>
             <span id="error_cantidad"></span>
             </div>
             <div class="col-md-6">
            Precio
            <form:input path="precio_producto" id="pre_producto"/> <br/>
            <span id="error_precio"></span>
             </div>
            
            Foto
            <form:input path="foto_producto"/> <br/>
            Número de referencia
            <div class="col-md-6">
            <form:input path="referencia_producto" id="ref_producto"/> <br/>
            <span id="error_referencia"></span>
            </div>
            
            Categoria
		<form:select path="id_subcategoria">
                     <c:forEach var="cat" items="${listaCategoria}">
			<form:option value="${cat.id_subcategoria}" label="${cat.nombre_categoria} - ${cat.nombre_subcategoria}"/>
			</c:forEach>
                </form:select><br>
                <form:hidden path="id_producto"/><br>
            <input type="submit" value="Modificar" class="btn btn-primary" id="btncreacion"/>
        </form:form>
             
            <a href="verProductosAll" class="btn btn-secondary active" role="button" aria-pressed="true">Volver</a>
             </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
