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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript"> 
               $(document).ready(function(){
                    $("#boton").click(function(){
                    //alert("hola");
                    var pasar=true
                    if( $("#nom_user").val() === ""){
                        $("#error_nombre").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_nombre").html("");                        
                    }
                    
                    if( $("#cognom_user").val() === ""){
                        $("#error_cognom").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un apellido para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_cognom").html("");                        
                    }
                    
                     if( $("#direccio_user").val() === ""){
                        $("#error_direccion").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una dirección para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_direccion").html("");                        
                    }
                    
                      if( $("#telefono_user").val() === ""){
                        $("#error_telefono").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un telefono<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_telefono").html("");                        
                    }
                    
                    var email = $("#email_user").val();
                    var expre = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/i;
                    if( email === "" || !expre.test(email)){
                        $("#error_email").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un email para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");

                        pasar=false;
                    }else{
                        $("#error_email").html("");                        
                    }
                    
                    
                    if( $("#passwd_user").val() === "" ){
                        $("#error_passwd").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una contraseña para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br>");

                     
                        pasar=false;
                    }else{
                        $("#error_passwd").html("");                        
                    }
                    return pasar;
                });
            });
         </script>
    </head>
    <body>
        <h1>ADD USER TEST</h1>
           <form:form modelAttribute="usuarios" action="nuevoUsuario" method="POST">
            Nombre:
            <form:input path="nombre_cliente" id="nom_user" type="text"/>  
            <span id="error_nombre"></span>
            <form:errors path="nombre_cliente"/><br/>
             Apellido
            <form:input path="apellido_cliente" id="cognom_user" type="text"/> 
            <span id="error_cognom"></span>
            <form:errors path="apellido_cliente"/><br/>
             Apellido2
            <form:input path="apellido2_cliente" id="cognom2_user" type="text"/> 
             Direccion
            <form:input path="direccion_cliente" id="direccio_user" type="text"/> 
            <span id="error_direccion"></span>
            <form:errors path="direccion_cliente"/><br/>
             Direccion2
            <form:input path="direccion2_cliente" id="direccio2_user" type="text"/> 
            Telefono 
            <form:input path="telefono_cliente" id="telefono_user" type="text"/> 
            <span id="error_telefono"></span>
            <form:errors path="telefono_cliente"/><br/>
             Email
            <form:input path="email_cliente" id="email_user" type="text"/> 
            <span id="error_email"></span>
            <form:errors path="email_cliente"/><br/>
            Contraseña:
            <form:input path="contrasena_cliente" id="passwd_user" type="password"/>     
            <form:errors path="contrasena_cliente"/>
             <span id="error_passwd" ></span><br/>
            <input type="submit" value="Crear" class="btn btn-success" id="boton"/>
        </form:form> 
    </body>
</html>
