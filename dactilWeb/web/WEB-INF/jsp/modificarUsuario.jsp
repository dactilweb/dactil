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
     <c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if>   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuarios</title>
          <jsp:include page="style.jsp" />
           <script type="text/javascript">
    $(document).ready(function () {
        $("#botonmod").click(function () {
            var pasar = true
            if ($("#nombre_cliente").val() === "") {
                alert("nombre");
                $("#error_nombre3").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombre3").html("");
            }

            if ($("#apellido_cliente").val() === "") {
                alert("apellido");
                $("#error_apellido3").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un apellido<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_apellido").html("");
            }

            if ($("#direccion_cliente").val() === "") {
                alert("direccion");
                $("#error_direccion3").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una dirección<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_direccion3").html("");
            }

            if ($("#telefono_cliente").val() === "") {
                alert("telefono");
                $("#error_telefono3").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un telefono<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_telefono3").html("");
            }

            var email = $("#email_cliente2").val();
            var expre = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/i;
            if (email === "" || !expre.test(email)) {
                alert("email");
                $("#error_email3").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un email<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");

                pasar = false;
            } else {
                $("#error_email3").html("");
            }
            return pasar;
        });
    });
</script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="contenido">
        <h1>Modificar Usuarios</h1>
        <form:form modelAttribute="usuarios" action="modificarUsuario" method="POST">
            <div class="col-md-6">
            Nombre
            <form:input path="nombre_cliente"/> <br/>
            <span id="error_nombre3"></span>
            </div>
             <div class="col-md-6">
            Apellido
            <form:input path="apellido_cliente"/> <br/>
            <span id="error_apellido3"></span>
             </div>
            
            Apellido 2
            <form:input path="apellido2_cliente"/> <br/>
            <div class="col-md-6">
            Dirección:
            <form:input path="direccion_cliente"/> <br/>
            <span id="error_direccion3"></span>
            </div>
            Dirección 2
            <form:input path="direccion2_cliente"/> <br/>
            <div class="col-md-6">
            Teléfono
            <form:input path="telefono_cliente"/> <br/>
            <span id="error_telefono3"></span>
            </div>
            <div class="col-md-6">
            Email
            <form:input path="email_cliente" id="email_cliente2"/> <br/>
            <span id="error_email3"></span>
            </div>
            Tipo de usuario
            <form:select path="nivel">
                <form:option value="1" label="Administrador"/>
                <form:option value="2" label="Usuario"/>
            </form:select><br>
          
        
            <form:hidden path="id_cliente"/>
            <input type="submit" value="Modificar" class="btn btn-primary" id="botonmod"/>
      </form:form> 
            <a href="verUsers" class="btn btn-secondary active" role="button" aria-pressed="true"><i class="fas fa-undo-alt"></i> Volver</a>
            </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
