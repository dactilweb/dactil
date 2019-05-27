<%-- 
    Document   : verUsers
    Created on : 29-abr-2019, 19:12:57
    Author     : Manu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
<!DOCTYPE html>
<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dactil: Usuarios</title>
         <jsp:include page="style.jsp" />
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div class="contenido">
        <table class="table table-hover">
            <thead>
                
                <tr align="center">
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Segundo Apellido</th>
                    <th scope="col">Direccion cliente</th>
                    <th scope="col">Email cliente</th>
                    <th scope="col">Telefono cliente</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="users" items="${listaUsuarios}">
                    <tr align="center">
                        <td>${users.nombre_cliente}</td>
                        <td>${users.apellido_cliente}</td>
                        <td>${users.apellido2_cliente}</td>
                        <td>${users.direccion_cliente}</td>
                        <td>${users.email_cliente}</td>
                        <td>${users.telefono_cliente}</td>
                        
                        <td>
                            <a href="modificar?id=${users.id_cliente}"><button type="button" class="btn btn-info">Modificar</button></a>
                        
                        </td>
                        <td>
                            <a href="eliminar?id=${users.id_cliente}"><button type="button" class="btn btn-danger">Deshabilitar</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="verUsersAll"><h5>Ver usuarios deshabilitados</h5></a>
        <a href="crearUsuarioAdmin"><h5>Crear usuarios</h5></a>
        <a href="panelcontrol"><h5>Volver</h5></a>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
