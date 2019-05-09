
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
     <img class="verProducto" src="imagenes/lede27.jpg" alt="Card image cap">
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
        </div>
    </div>
  </div>
</div>
           
           
       </div>
   
    <jsp:include page="footer.jsp" />
    <jsp:include page="modales.jsp" />
    </body>
</html>
