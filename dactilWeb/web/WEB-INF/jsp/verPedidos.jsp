
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dactil: Pedidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <jsp:include page="style.jsp" />
    </head>

    <body>
        <jsp:include page="nav.jsp" />
        <div class="contenido">
            <table class="table table-hover">
                <thead>

                    <tr align="center">
                        <th scope="col">Numero Factura</th>
                        <th scope="col">Nombre Cliente</th>
                        <th scope="col">Fecha Factura</th>
                        <th scope="col">Nombre Producto</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Cantidad Compra</th> 
                        <th scope="col">Estado</th> 
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fact" items="${listaFactura}">

                        <tr align="center">
                            <td>${fact.id_factura}</td>
                            <td>${fact.nombre_cliente} ${fact.apellido_cliente}</td>
                            <td>${fact.fecha_factura}</td>
                            <td>${fact.nombre_producto}</td>
                            <td>${fact.precio_producto}</td>
                            <td>${fact.cantidad_compra}</td>
                            <td>${fact.estado_factura}</td>

                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${fact.id_factura}">
                                    Modificar
                                </button>
                            </td>

                        </tr>

                    <div class="modal fade" id="exampleModalCenter${fact.id_factura}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form:form modelAttribute="factura" action="modificarFact" method="POST">
                                        Estado:
                                        <form:select path="estado_factura">
                                            <form:option value="en proceso" label="en proceso"/>
                                            <form:option value="completado y enviado" label="completado y enviado"/>
                                        </form:select>
                                        <form:hidden path="id_factura" value="${fact.id_factura}"/>

                                   
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                     </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </tbody>
            </table>
            <a href="panelcontrol"><h5>Volver</h5></a>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
