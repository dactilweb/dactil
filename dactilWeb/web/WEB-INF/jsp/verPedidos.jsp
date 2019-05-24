
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <title>Dactil: Pedidos</title>
    </head>

    <body>
        <h1>Pedidos realizados</h1>
       <table>
            <thead>
                
                <tr align="center">
                    <th>Numero Factura</th>
                    <th>Nombre Cliente</th>
                    <th>Fecha Factura</th>
                    <th>Nombre Producto</th>
                    <th>Precio</th>
                    <th>Cantidad Compra</th> 
                    <th>Estado</th> 
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
    </body>
</html>
