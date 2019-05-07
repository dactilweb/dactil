<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dactil</title>
  <jsp:include page="style.jsp" />
    </head>

    <body>
<jsp:include page="nav.jsp" />
    
    <div class="contenido">
        <ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>
</ul>
 <div class="row">
  
     <c:forEach var="prod" items="${listaProductos}">
     <div class="col-sm-3">
    <div class="card">
        <img class="card-img-top" src="imagenes/lede27.jpg" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">${prod.nombre_producto}</h5>
        <p class="card-text">${prod.cantidad_producto} Articulos disponibles</p>
        <p class="card-text">${prod.precio_producto}€ / Coste unidad</p>
        <div class="card-body">
            <a href="añadirCarrito?id=${prod.id_producto}" class="card-link">Añadir al carrito</a><br>
    <a href="verProd?id=${prod.id_producto}" class="card-link">Ver más</a>
  </div>
      </div>
    </div>
  </div>
     </c:forEach>
          
     
     
     
</div>
        </div>
    
        
<jsp:include page="footer.jsp" />

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Iniciar Sesión</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form:form modelAttribute="usuarios" action="login" method="POST">
         <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <form:input path="email_cliente" id="email_cliente" type="text"/> <br/>
          <label for="inputPassword3" class="col-sm-2 col-form-label">Contraseña</label>
            <form:input path="contrasena_cliente" id="contrasena_cliente" type="password"/> <br/>
            <div class="col-sm-2 col-form-label" align="left">
            
            <input type="submit" value="Acceder" class="btn btn-success"/>
            </div>
        </form:form>       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">
                Registrarse 
            </button>
      </div>
    </div>
  </div>
</div>
    <!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
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
            <form:input path="apellido2_cliente" id="cognom2_user" type="text"/> <br/>
             Direccion
            <form:input path="direccion_cliente" id="direccio_user" type="text"/> <br/>
            <span id="error_direccion"></span>
            <form:errors path="direccion_cliente"/>
             Direccion2
            <form:input path="direccion2_cliente" id="direccio2_user" type="text"/> <br/>
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
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
    </body>
</html>
