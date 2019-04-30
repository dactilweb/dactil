<%-- 
    Document   : verUsers
    Created on : 29-abr-2019, 19:12:57
    Author     : Manu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dactil: Productos</title>
    </head>
    <body>
        <h1>Productos</h1>
        <table>
            <thead>
                
                <tr align="center">
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Referencia</th>
                    <th>Disponibilidad</th>
                   
                    
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
                            <a href="modificarProd?id=${prod.id_producto}"><button type="button" class="btn btn-info">Modificar</button></a>
                        
                        </td>
                        <td>
                            <a href="eliminarProd?id=${prod.id_producto}"><button type="button" class="btn btn-danger">Eliminar</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="panelcontrol"><h5>Volver</h5></a>
    </body>
</html>
