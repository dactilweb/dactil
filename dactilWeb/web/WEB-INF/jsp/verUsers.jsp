<%-- 
    Document   : verUsers
    Created on : 29-abr-2019, 19:12:57
    Author     : Manu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
<!DOCTYPE html>
<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Usuarios</title>
         <jsp:include page="style.jsp" />
         <script type="text/javascript">
    $(document).ready(function () {
        $("#btncreacion").click(function () {
           
            var pasar = true
            if ($("#nom_user").val() === "") {
                
                $("#error_nombre4").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombre4").html("");
            }

            if ($("#cognom_user").val() === "") {
               
                $("#error_cognom4").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un apellido para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_cognom4").html("");
            }

            if ($("#direccio_user2").val() === "") {
                
                $("#error_direccion4").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una dirección para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_direccion4").html("");
            }

            if ($("#telefono_user2").val() === "") {
               
                $("#error_telefono4").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un telefono<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_telefono4").html("");
            }

            var email = $("#email_user").val();
            var expre = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/i;
            if (email === "" || !expre.test(email)) {
               
                $("#error_email4").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un email para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");

                pasar = false;
            } else {
                $("#error_email4").html("");
            }


            if ($("#passwd_user").val() === "") {
               
                $("#error_passwd4").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una contraseña para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br>");


                pasar = false;
            } else {
                $("#error_passwd4").html("");
            }
            return pasar;
        });
    });
</script>
    </head>
    <body>
        
        <jsp:include page="nav.jsp" />
        <div class="contenido">
        <table class="table table-hover">
            <thead>
                
                <tr align="center">
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    
                    <th scope="col">Dirección cliente</th>
                    <th scope="col">Email cliente</th>
                    <th scope="col">Teléfono cliente</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="users" items="${listaUsuarios}">
                    <tr align="center">
                        <td>${users.nombre_cliente}</td>
                        <td>${users.apellido_cliente} ${users.apellido2_cliente}</td>
                        
                        <td>${users.direccion_cliente}</td>
                        <td>${users.email_cliente}</td>
                        <td>${users.telefono_cliente}</td>
                        
                        <td>
                            <a href="modificar?id=${users.id_cliente}"><button type="button" class="btn btn-primary"><i class="fas fa-user-edit"></i> Modificar</button></a>
                        
                        </td>
                        <td>
                            <a href="eliminar?id=${users.id_cliente}"><button type="button" class="btn btn-danger"><i class="far fa-times-circle"></i> Deshabilitar</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#crearUsuario">
                                    <i class="fas fa-user-plus"></i> Crear Usuario
                                </button>
        <a href="verUsersAll" class="btn btn-warning active" role="button" aria-pressed="true"><i class="far fa-times-circle"></i> Ver usuarios deshabilitados</a>
        <a href="panelcontrol" class="btn btn-secondary active" role="button" aria-pressed="true"><i class="fas fa-undo-alt"></i> Volver</a>
        
        <div class="modal fade bd-example-modal-lg" id="crearUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Crear Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form:form modelAttribute="usuarios" action="crearUsuarioAd" method="POST">
           <div class="form-row">
               <div class="col-md-6">
            Nombre
            <form:input path="nombre_cliente" id="nom_user" type="text" class="form-control"/>  
            <span id="error_nombre4"></span>
            </div>    
            <div class="col-md-6">
             Apellido
            <form:input path="apellido_cliente" id="cognom_user2" type="text" class="form-control"/> 
            <span id="error_cognom4"></span>
            </div>    
            <div class="col-md-6">
            Segundo Apellido
            <form:input path="apellido2_cliente" id="cognom2_user" type="text" class="form-control"/> <br/>
            </div>    
            <div class="col-md-6">
                
             Dirección
            <form:input path="direccion_cliente" id="direccio_user2" type="text" class="form-control"/> <br/>
            <span id="error_direccion4"></span>
            </div>    
            <div class="col-md-6">
             Dirección 2
            <form:input path="direccion2_cliente" id="direccio2_user" type="text" class="form-control"/> <br/>
            </div>    
            <div class="col-md-6">   
            Teléfono 
            <form:input path="telefono_cliente" id="telefono_user2" type="text" class="form-control"/> 
            <span id="error_telefono4"></span>
            </div>    
            <div class="col-md-6">
             Email
            <form:input path="email_cliente" id="email_user" type="text" class="form-control"/> 
            <span id="error_email4"></span>
            </div>    
            <div class="col-md-6">        
            Contraseña:
            <form:input path="contrasena_cliente" id="passwd_user" type="password" class="form-control"/>     
             <span id="error_passwd4" ></span><br/>
             </div>    
      </div>
             </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="btncreacion" class="btn btn-primary">Crear Usuario</button>
        </form:form> 
      </div>
    </div>
  </div>
</div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
