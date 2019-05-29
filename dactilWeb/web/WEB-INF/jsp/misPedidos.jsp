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
                            <th  scope="col">NºFactura</th>
                            <th scope="col">Estado Factura</th>
                            <th scope="col">Fecha de Compra</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pedidos" items="${listaPedidos}">
                            <tr>
                                <td>${pedidos.id_factura}</span></td>
                                <td>${pedidos.estado_factura}</td>
                                <td>${pedidos.fecha_factura}</td>
                                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal${pedidos.id_factura}">
                                        <i class="fas fa-plus"></i> Ver más
                                    </button></td>
                            </tr>   
                        <div class="modal fade bd-example-modal-lg" id="modal${pedidos.id_factura}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Pedido Nº${pedidos.id_factura}</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <c:forEach var="pedidosAnt" items="${lineasPedidos}">
                                            <c:choose>
                                                <c:when test="${pedidos.id_factura == pedidosAnt.id_factura}">
                                                    <div class="row">
                                                <div class="col-md-6"><img src="imgProductos/${pedidosAnt.foto_producto}" width="70px">${pedidosAnt.nombre_producto}</div>
                                                <div class="col-md-1">${pedidosAnt.cantidad_compra}</div>
                                                <div class="col-md-1">${pedidosAnt.precio_producto}€</div>
                                            </div>
                                                </c:when>
                                            </c:choose>
                                           
                                        </c:forEach>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>  

                    </tbody>
                </table>

            </div>
        </div>


        <jsp:include page="footer.jsp" />
    </body>
</html>
