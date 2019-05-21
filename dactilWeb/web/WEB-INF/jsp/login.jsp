
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<c:if test="${sessionScope.us != null}">
    <% response.sendRedirect("index");%>
</c:if>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="css/loginstyle.css">
    <script type="text/javascript"> 
               $(document).ready(function(){
                    $("#boton").click(function(){
                    //alert("hola");
                    var pasar=true
                    if( $("#inputEmail").val() === ""){
                        $("#error_nombre").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una direccion de correo de usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                        pasar=false;
                    }else{
                        $("#error_nombre").html("");                        
                    }               
                    if( $("#inputPassword").val() === "" ){
                        $("#error_passwd").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una contraseña correcta<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br>");

                     
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
   <div id="logreg-forms">
       <form:form modelAttribute="usuarios" action="login" method="POST">
           
       
        <form class="form-signin">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Iniciar Sesión</h1>
           <form:input path="email_cliente" id="inputEmail" type="text" class="form-control" placeholder="Dirección de correo electrónico"/> <br/>
           <span id="error_nombre"></span>
           <form:errors path="nombre_cliente"/><br/>
            <form:input path="contrasena_cliente" id="inputPassword" type="password" class="form-control" placeholder="Contraseña"/> <br/>
            <form:errors path="contrasena_cliente"/>
            <span id="error_passwd" ></span><br/>
            <button class="btn btn-success btn-block" id="boton" type="submit"><i class="fas fa-sign-in-alt"></i> Acceder</button>
            <hr>
            <!-- <p>Don't have an account!</p>  -->
            <a href="index"><button class="btn btn-primary btn-block" type="button"><i class="fas fa-undo-alt"></i> Volver a página web</button></a>
            </form>
           
           
           </form:form>
            <br>
            
    </div>
    <p style="text-align:center">
        <a href="http://bit.ly/2RjWFMfunction toggleResetPswd(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle() // display:block or none
    $('#logreg-forms .form-reset').toggle() // display:block or none
}

function toggleSignUp(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle(); // display:block or none
    $('#logreg-forms .form-signup').toggle(); // display:block or none
}

$(()=>{
    // Login Register Form
    $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    $('#logreg-forms #btn-signup').click(toggleSignUp);
    $('#logreg-forms #cancel_signup').click(toggleSignUp);
})g" target="_blank" style="color:black"></a>
    </p>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/login.js"></script>
    </body>
</html>
