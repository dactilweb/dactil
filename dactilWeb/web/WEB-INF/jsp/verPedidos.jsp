
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dactil: Pedidos</title>
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
                            <a href="modificarFact?id=${fact.id_factura}"><button type="button" class="btn btn-info">Modificar</button></a>
                        
                        </td>
                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="panelcontrol"><h5>Volver</h5></a>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
