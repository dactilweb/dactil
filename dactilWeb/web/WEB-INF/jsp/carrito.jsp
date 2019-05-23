<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="style.jsp" />
        <style>
            .paypalboton{
                margin-left: 80%;
               
            }
        </style>
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    </head>
    <body>
       
        <jsp:include page="nav.jsp" />


        <div class="contenido">
            <div class="contenido2">
             <c:choose>
    <c:when test="${totalprecio==0}">
      
      <div class="alert alert-warning" role="alert">
  <h4 class="alert-heading">Tu carrito está vacío!</h4>
  <p>¿Aún no sabes lo que quieres? :(</p>
  <hr>
  <p class="mb-0">Puedes añadir productos desde nuestra <a href="index">tienda</a>.</p>
</div>
        <br />
    </c:when>    
    <c:otherwise>
       <table class="table table-hover">
                    <thead>
                        <tr>
                            <th  scope="col">Producto</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="linea" items="${listaCarrito}">
                            <tr>
                                <td><img height="80" width="80" src="imgProductos/${linea.foto_producto}" alt="500" /> </td>
                                <td>${linea.nombre_producto}<br><span style="color:grey;">${linea.referencia_producto}</span></td>
                                <td>${linea.cantidad_compra}</td>
                                <td>${linea.precio_producto}€</td>
                                <td> <a href="eliminarCarrito?id=${linea.id_lineafactura}"> <i class="fas fa-trash"></i></a></td>
                            </tr>
                        </c:forEach>  
                             <tr>
                                 <td></td>
                                <td></td>
                                <td></td>
                                <td>Total:</td>
                                <td>${totalprecio}€</td>
                                <td> </td>
                                
                            </tr>
                    </tbody>
                </table>
                                <div class="paypalboton">
                               <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST" target="_top">
    <input type="hidden" name="business" value="10000189.joan23@fje.edu"/>
    <input type="hidden" name="return" value="${initParam['urlretorno']}"/>
<input type="hidden" name="cmd" value="_cart"/>
<input type="hidden" name="upload" value="1"/>
<input type="hidden" name="currency_code" value="EUR">
<input type="hidden" name="lc" value="ES">
<input type="hidden" name="country" value="ES">
<c:forEach items="${listaCarrito}" var="linea">
    <c:set var="c" value="${c+1}"/>
    <input type="hidden" name="item_name_${c}" value="${linea.nombre_producto}" />
    <input type="hidden" name="item_number_${c}" value="${linea.id_producto}" />
    <input type="hidden" name="amount_${c}" value="${linea.precio_producto}" />
    <input type="hidden" name="quantity_${c}" value="${linea.cantidad_compra}" />
</c:forEach>

    <input type="image" src="imagenes/pagarahora.png" border="0" name="submit" alt="PayPal, la forma rápida y segura de pagar en Internet." height="38px" class="img-fluid" alt="Responsive image">
<img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
</form>



                                </div>
    </c:otherwise>
</c:choose>
                
            </div>
                            
        </div>


        <jsp:include page="footer.jsp" />
    </body>
</html>
