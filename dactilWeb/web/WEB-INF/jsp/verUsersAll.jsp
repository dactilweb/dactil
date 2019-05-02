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
        <title>Dactil: Usuarios Deshabilitados</title>
    </head>
    <body>
        <h1>Usuarios Deshabilitados</h1>
        <table>
            <thead>
                
                <tr align="center">
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Segundo Apellido</th>
                    <th>Direccion cliente</th>
                    <th>Direccion cliente 2</th>
                    <th>Email cliente</th>
                    <th>Telefono cliente</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="users" items="${listaUsuarios}">
                    <tr align="center">
                        <td>${users.nombre_cliente}</td>
                        <td>${users.apellido_cliente}</td>
                        <td>${users.apellido2_cliente}</td>
                        <td>${users.direccion_cliente}</td>
                        <td>${users.direccion2_cliente}</td>
                        <td>${users.email_cliente}</td>
                        <td>${users.telefono_cliente}</td>
                        
                        <td>
                            <a href="modificar?id=${users.id_cliente}"><button type="button" class="btn btn-info">Modificar</button></a>
                        
                        </td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="verUsers"><h5>Volver</h5></a>
    </body>
</html>
