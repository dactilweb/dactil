<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    </body>
</html>
