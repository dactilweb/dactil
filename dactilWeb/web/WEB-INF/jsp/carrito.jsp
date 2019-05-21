<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="style.jsp" />
    </head>
    <body>
        <jsp:include page="nav.jsp" />


        <div class="contenido">
            <div class="contenido2">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th  scope="col">Producto</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="linea" items="${listaCarrito}">
                            <tr>
                                <td><img height="80" width="80" src="imgProductos/${linea.foto_producto}" alt="500" /> </td>
                                <td>${linea.nombre_producto}<br><span style="color:grey;">${linea.referencia_producto}</span></td>
                                <td>${linea.cantidad_compra}</td>
                                <td>${linea.precio_producto}€</td>
                                <td> <a href="eliminarCarrito?id=${linea.id_lineafactura}"> <i class="fas fa-trash"></i></a></td>
                            </tr>
                        </c:forEach>  
                             <tr>
                                 <td></td>
                                <td></td>
                                <td></td>
                                <td>Total:</td>
                                <td>${totalprecio}€</td>
                            </tr>
                    </tbody>
                </table>

            </div>
        </div>

<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmar eliminacion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Estás segur@ de que deseas eliminar el producto del carrito?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Confirmar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
