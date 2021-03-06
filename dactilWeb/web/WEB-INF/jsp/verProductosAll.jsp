<%-- 
    Document   : verUsers
    Created on : 29-abr-2019, 19:12:57
    Author     : Manu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       <c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos los productos</title>
        <jsp:include page="style.jsp" />
         <script type="text/javascript">
    $(document).ready(function () {
        $("#crearbtn").click(function () {
        
            var pasar = true
            if ($("#nombre_producto").val() === "") {
                
                $("#error_nombreproductillo").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre para el producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombreproductillo").html("");
            }

            if ($("#descripcion_producto").val() === "") {
                $("#error_descripcion").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una descripción para el producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_descripcion").html("");
            }

            if ($("#cantidad_producto").val() === "") {
                $("#error_cantidad").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una cantidad para el producto<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_cantidad").html("");
            }

            if ($("#precio_producto").val() === "") {
                $("#error_precio").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un precio<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_precio").html("");
            }
            
            if ($("#referencia_producto").val() === "") {
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
        <h1>Todos los productos</h1>
        <table class="table table-hover">
            <thead>
                
                <tr align="center">
                    <th th scope="col">Nombre</th>
                    <th th scope="col">Descripción</th>
                    <th th scope="col">Cantidad</th>
                    <th th scope="col">Precio</th>
                    <th th scope="col">Referencia</th>
                    <th th scope="col">Disponibilidad</th>
                    <th th scope="col"></th>
                    <th th scope="col"></th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="prod" items="${listaProductos}">
                    <tr align="center">
                        <td>${prod.nombre_producto}</td>
                        <td>${prod.descripcion_producto}</td>
                        <td>${prod.cantidad_producto}</td>
                        <td>${prod.precio_producto}</td>
                        <td>${prod.referencia_producto}</td>
                        <td>${prod.disp_prod}</td>
                       
                        <td>
                            <a href="modificarProd?id=${prod.id_producto}"><button type="button" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button></a>
                        
                        </td>
                        <td>
                            <a href="eliminarProdDef?id=${prod.id_producto}"><button type="button" class="btn btn-danger"><i class="fas fa-minus-circle"></i> Eliminar</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#crearProducto">
                                    <i class="fas fa-plus-circle"></i> Nuevo Producto
                                </button>
        <a href="panelcontrol" class="btn btn-secondary active" role="button" aria-pressed="true"><i class="fas fa-undo-alt"></i> Volver</a>
       
        <div class="modal fade bd-example-modal-lg" id="crearProducto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Nuevo Producto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
       <form:form modelAttribute="productos" action="nuevoProducto" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
           <div class="form-row">
           <div class="col-md-6">
            Nombre:
            <form:input path="nombre_producto" id="nombre_producto" class="form-control" type="text"/>  <br>
            <span id="error_nombreproductillo"></span>
            </div>
            <div class="col-md-6">
            Cantidad:
            <form:input path="cantidad_producto" id="cantidad_producto" class="form-control" type="text"/> <br>
            <span id="error_cantidad"></span>
             </div>
            <div class="col-md-12">
            Descripción:
            <form:input path="descripcion_producto" id="descripcion_producto" class="form-control"  type="text"/> <br>
            <span id="error_descripcion"></span>
            </div>
             
             <div class="col-md-6">
            Precio:
            <form:input path="precio_producto" id="precio_producto" class="form-control" type="text"/> <br>
            <span id="error_precio"></span>
             </div>
            <div class="col-md-6">
            Referencia:
            <form:input path="referencia_producto" id="referencia_producto" class="form-control" type="text"/> <br>
            <span id="error_referencia"></span>
              </div>
             <div class="col">
            Foto:
            <form:input type="file" name="file" size="50" path="fichero" class="form-control" id="fichero" required="true"></form:input><br>
             </div>
              
             <div class="col">
            Categoria:
		<form:select path="id_subcategoria" class="form-control">
                     <c:forEach var="cat" items="${listaCategoria}">
			<form:option value="${cat.id_subcategoria}" label="${cat.nombre_categoria} - ${cat.nombre_subcategoria}"/>
			</c:forEach>
                </div>
                </form:select><br>
           </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="crearbtn" class="btn btn-primary">Crear Producto</button>
        </form:form> 
      </div>
    </div>
  </div>
</div>
        </div>
    </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
