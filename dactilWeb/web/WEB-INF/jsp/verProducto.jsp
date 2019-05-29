
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <form:input path="cantidad_compra" id="cantidad_compra" type="number" max="${productos.getCantidad_producto()}" min="1" value="1"/>  <br>
            <span id="error_nombre"></span>
            <form:hidden path="id_producto"/>
            <input type="submit" value="Añadir" class="btn btn-primary" id="boton"/> 
        </form:form> 
            
        </div>
    </div>
  </div>
</div>
           
            <c:choose>
                <c:when test="${fn:length(listaSimilares)>0}">
                     <h2>Productos Similares</h2>
                </c:when>
            </c:choose>
                      <c:forEach var="prod" items="${listaSimilares}">
         <article class="card card-product">
	<div class="card-body">
	<div class="row">
		<aside class="col-sm-3">
                    <div class="img-wrap"><img src="imgProductos/${prod.getFoto_producto()}" height="250px"></div>
		</aside> <!-- col.// -->
		<article class="col-sm-6">
			
				<h4 class="title">${prod.nombre_producto}  </h4>
				
				<p> ${prod.descripcion_producto}</p>
				<dl class="dlist-align">
				  <dt>Disponibilidad</dt>
				  <dd>${prod.cantidad_producto} disponibles</dd>
				</dl>  <!-- item-property-hor .// -->
				<dl class="dlist-align">
				  <dt>Entrega</dt>
				  <dd>Entre 3-5 días</dd>
				</dl>  <!-- item-property-hor .// -->
				<dl class="dlist-align">
				  <dt>Envío</dt>
				  <dd>Europa, USA y China</dd>
				</dl>  <!-- item-property-hor .// -->
			
		</article> <!-- col.// -->
		<aside class="col-sm-3 border-left">
			<div class="action-wrap">
				<div class="price-wrap h4">
					<span class="price"> ${prod.precio_producto} €</span>	
					
				</div> <!-- info-price-detail // -->
				<p class="text-success">Envío Gratis</p>
				<br>
				<p>
                                    <a href="addCarrito?id=${prod.id_producto}" class="btn btn-primary"><i class="fas fa-cart-plus"></i> Añadir al Carrito </a><br><br>
					<a href="verProducto?id=${prod.id_producto}" class="btn btn-secondary"><i class="fas fa-info-circle"></i> Ver más  </a>
				</p>
				
			</div> <!-- action-wrap.// -->
		</aside> <!-- col.// -->
	</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</article> <!-- product-list.// -->            
            </c:forEach>          
                     
                     
                     
                     
       </div>
   
    <jsp:include page="footer.jsp" />
    </body>
</html>
