<%-- 
    Document   : modificarProducto
    Created on : 30-abr-2019, 15:10:53
    Author     : Manu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuarios</title>
          <jsp:include page="style.jsp" />
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="contenido">
        <h1>Modificar Usuarios</h1>
        <form:form modelAttribute="usuarios" action="modificarUsuario" method="POST">

            Nombre
            <form:input path="nombre_cliente"/> <br/>
            Apellido
            <form:input path="apellido_cliente"/> <br/>
            Apellido 2
            <form:input path="apellido2_cliente"/> <br/>
            Dirección:
            <form:input path="direccion_cliente"/> <br/>
            Dirección 2
            <form:input path="direccion2_cliente"/> <br/>
            Teléfono
            <form:input path="telefono_cliente"/> <br/>
            Email
            <form:input path="email_cliente"/> <br/>
            Tipo de usuario
            <form:select path="nivel">
                <form:option value="1" label="Administrador"/>
                <form:option value="2" label="Usuario"/>
            </form:select><br>
          
        
            <form:hidden path="id_cliente"/>
            <input type="submit" value="Modificar" class="btn btn-primary" id="boton"/>
      </form:form> 
            <a href="verUsers" class="btn btn-secondary active" role="button" aria-pressed="true"><i class="fas fa-undo-alt"></i> Volver</a>
            </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
