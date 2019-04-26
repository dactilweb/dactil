<%-- 
    Document   : crearUsuario
    Created on : 26-abr-2019, 16:12:59
    Author     : Manu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ADD USER TEST</h1>
           <form:form modelAttribute="usuarios" action="nuevoUsuario" method="POST">
            Nombre:
            <form:input path="nombre_cliente" id="nom_user" type="text"/>  
             Apellido
            <form:input path="apellido_cliente" id="cognom_user" type="text"/> 
             Apellido2
            <form:input path="apellido2_cliente" id="cognom2_user" type="text"/> 
             Direccion
            <form:input path="direccion_cliente" id="direccio_user" type="text"/> 
             Direccion2
            <form:input path="direccion2_cliente" id="direccio2_user" type="text"/> 
            Telefono 
            <form:input path="telefono_cliente" id="telefono_user" type="text"/> 
             Email
            <form:input path="email_cliente" id="email_user" type="text"/>  
            Contraseña:
            <form:input path="contrasena_cliente" id="passwd_user" type="password"/>        
            <input type="submit" value="Crear" class="btn btn-success" id="boton"/>
        </form:form> 
    </body>
</html>
