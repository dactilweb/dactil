
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<% String titulo = (String) request.getAttribute("titulo"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="style.jsp" />
        <title>${productos.getNombre_producto()}</title>
    </head>
    <body>
       <jsp:include page="nav.jsp" />
       
       <div class="contenidoProducto">
           <div class="container">
  <div class="row">
    <div class="col-sm">
     <img class="verProducto" src="imgProductos/${productos.getFoto_producto()}" alt="Card image cap">
    </div>
    <div class="col-sm">
        <h1>${productos.getNombre_producto()}</h1>
        <p class="referencia">${productos.getReferencia_producto()} - ${productos.getCantidad_producto()} disponible/s<p>
        <p>${productos.getDescripcion_producto()}</p>
            <i class="fas fa-undo"></i> ¡15 días para cualquier devolución!<br>
            <i class="fas fa-truck"></i> Haz tu pedido ahora y saldrá hoy<br>
            <i class="fas fa-check-circle"></i> Garantía de 2 años
    </div>
    <div class="col-sm">
        <div class="anadirCarrito">
            <h1>${productos.getPrecio_producto()}€</h1>
            <p class="referencia">IVA INCLUIDO</p>
            
            <form:form modelAttribute="lineaFactura" action="carrito" method="POST">
            Cantidad:
            <form:input path="cantidad_compra" id="cantidad_compra" type="number" max="${productos.getCantidad_producto()}" min="1"/>  <br>
            <span id="error_nombre"></span>
            <form:hidden path="id_producto"/>
            <input type="submit" value="Añadir" class="btn btn-success" id="boton"/> 
        </form:form> 
            
        </div>
    </div>
  </div>
</div>
            <h2>Productos Similares</h2>
           <div class="row">
  
     <c:forEach var="prod" items="${listaSimilares}">
     <div class="col-sm-3">
    <div class="card">
        
        <img class="card-img-top" src="imgProductos/${prod.getFoto_producto()}" alt="Card image cap">
      <div class="card-body">
         
        <h5 class="card-title">${prod.nombre_producto}</h5>
        <p class="card-text">${prod.cantidad_producto} Articulos disponibles</p>
        <p class="card-text">${prod.precio_producto}€ / Coste unidad</p><br><br>
        <div class="">
            <a class="btn btn-primary" href="añadirCarrito?id=${prod.id_producto}" role="button"> <i class="fas fa-shopping-cart"></i> Añadir al carrito</a><br>
    <a href="verProducto?id=${prod.id_producto}" class="card-link"><i class="fas fa-info-circle"></i> Ver más</a>
 
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
