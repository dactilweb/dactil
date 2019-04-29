<%-- 
    Document   : verUsers
    Created on : 29-abr-2019, 19:12:57
    Author     : Manu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                        <td>
                            <a href="eliminar?id=${users.id_cliente}"><button type="button" class="btn btn-danger">Eliminar</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
