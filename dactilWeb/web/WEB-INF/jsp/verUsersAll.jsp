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
        <c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios Deshabilitados</title>
         <jsp:include page="style.jsp" />
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div class="contenido">
        <h1>Usuarios Deshabilitados</h1>
        <table class="table table-hover">
            <thead>
                
                <tr align="center">
                    <th th scope="col">Nombre</th>
                    <th th scope="col">Apellido</th>
                    <th th scope="col">Segundo Apellido</th>
                    <th th scope="col">Dirección cliente</th>
                    <th th scope="col">Email cliente</th>
                    <th th scope="col">Teléfono cliente</th>
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
                        <td>${users.direccion2_cliente}</td>
                        <td>${users.email_cliente}</td>
                        <td>${users.telefono_cliente}</td>
                        
                        <td>
                            <a href="modificar?id=${users.id_cliente}"><button type="button" class="btn btn-primary"><i class="fas fa-user-edit"></i> Modificar</button></a>
                        
                        </td>
                        <td>
                            <a href="habilitar?id=${users.id_cliente}"><button type="button" class="btn btn-warning"><i class="far fa-check-circle"></i> Habilitar</button></a>
                        
                        </td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="verUsers" class="btn btn-secondary active" role="button" aria-pressed="true"><i class="fas fa-undo-alt"></i> Volver</a>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
