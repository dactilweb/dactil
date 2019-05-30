<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<html>
    <head>
        <style>
            .mapa{
                text-align: center;
            }
           
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
        <jsp:include page="style.jsp" />
        <script type="text/javascript">
    $(document).ready(function () {
        $("#botoneditar").click(function () {
            var pasar = true
            if ($("#nombre_cliente").val() === "") {
                alert("nombre");
                $("#error_nombre5").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombre5").html("");
            }

            if ($("#apellido_cliente").val() === "") {
                alert("apellido");
                $("#error_cognom5").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un apellido<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_cognom5").html("");
            }

            if ($("#direccion_cliente").val() === "") {
                alert("direccion");
                $("#error_direccion5").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una dirección<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_direccion5").html("");
            }

            if ($("#telefono_cliente").val() === "") {
                alert("telefono");
                $("#error_telefono5").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un telefono<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_telefono5").html("");
            }

            var email = $("#email_cliente2").val();
            var expre = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/i;
            if (email === "" || !expre.test(email)) {
                alert("email");
                $("#error_email5").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un email<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");

                pasar = false;
            } else {
                $("#error_email5").html("");
            }
            return pasar;
        });
    });
</script>
    </head>
    
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
            <div class="contenido2">
           <form:form modelAttribute="usuarios" action="modificarUsuario" method="POST">
            <div class="row">
                <div class="col-md-6">
                     
            Nombre:
            <form:input path="nombre_cliente"/> <br/>  
            <span id="error_nombre5"></span>
                </div>
                <div class="col-md-6">
                     Apellido:
            <form:input path="apellido_cliente"/> <br/>
             <span id="error_cognom5"></span>
                </div>
                <div class="col-md-6">
                     Apellido 2:
            <form:input path="apellido2_cliente"/> <br/>
                </div>
                <div class="col-md-6">
                     Direccion:
            <form:input path="direccion_cliente"/> <br/>
             <span id="error_direccion5"></span>
                </div>
                <div class="col-md-6">
            Direccion 2:
            <form:input path="direccion2_cliente"/> <br/>
                </div>
                <div class="col-md-6">
                     Telefono:
            <form:input path="telefono_cliente"/> <br/>
             <span id="error_telefono5"></span>
                </div>
                <div class="col-md-6">
                     Email:
            <form:input path="email_cliente" id="email_cliente2"/> <br/>
            <span id="error_email5"></span>
                </div>
            <form:hidden path="id_cliente"/>
                </div>
                <div class="col-md-12">
                     <input type="submit" value="Modificar" class="btn btn-primary" id="botoneditar"/>
      </form:form> 
                </div>
                
            </div>
        </div>
        </div>
        <jsp:include page="footer.jsp" />

    </body>
</html>
