<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .mapa{
                text-align: center;
            }
           
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¿Donde estamos?</title>
        <jsp:include page="style.jsp" />
    </head>
    
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
           <form:form modelAttribute="usuarios" action="modificarUsuario" method="POST">
            <div class="row">
                <div class="col-md-6">
                     
            Nombre:
            <form:input path="nombre_cliente"/> <br/>                    
                </div>
                <div class="col-md-6">
                     Apellido:
            <form:input path="apellido_cliente"/> <br/>
                </div>
                <div class="col-md-6">
                     Apellido 2:
            <form:input path="apellido2_cliente"/> <br/>
                </div>
                <div class="col-md-6">
                     Direccion:
            <form:input path="direccion_cliente"/> <br/>
                </div>
                <div class="col-md-6">
            Direccion 2:
            <form:input path="direccion2_cliente"/> <br/>
                </div>
                <div class="col-md-6">
                     Telefono:
            <form:input path="telefono_cliente"/> <br/>
                </div>
                <div class="col-md-6">
                     Email:
            <form:input path="email_cliente"/> <br/>
            <form:hidden path="id_cliente"/>
                </div>
                <div class="col-md-12">
                     <input type="submit" value="Modificar" class="btn btn-primary" id="boton"/>
      </form:form> 
                </div>
                
            </div>
        </div>
        <jsp:include page="footer.jsp" />

    </body>
</html>
