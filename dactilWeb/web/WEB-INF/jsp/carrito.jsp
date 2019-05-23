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
                    
                   

                <div class="card">
                    <table class="table table-hover shopping-cart-wrap">
                        <thead class="text-muted">
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col" width="120">Cantidad</th>
                                <th scope="col" width="120">Precio</th>
                                <th scope="col" width="200" class="text-right">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="linea" items="${listaCarrito}">
                                <tr>
                                    <td>
                                        <figure class="media">
                                            <div class="img-wrap"><img src="imgProductos/${linea.foto_producto}" class="img-sm" height="110px"></div>
                                            <figcaption class="media-body">
                                                <h6 class="title text-truncate">${linea.nombre_producto}</h6>
                                                <dl class="dlist-inline small">
                                                    <dt>Referencia: </dt>
                                                    <dd>${linea.referencia_producto}</dd>
                                                </dl>

                                            </figcaption>
                                        </figure> 
                                    </td>
                                    <td> 
                                        <p>${linea.cantidad_compra}</p>
                                    </td>
                                    <td> 
                                        <div class="price-wrap"> 
                                            <var class="price">${linea.precio_producto} €</var> 

                                        </div> <!-- price-wrap .// -->
                                    </td>
                                    <td class="text-right"> 
                                        <a href="eliminarCarrito?id=${linea.id_lineafactura}" class="btn btn-outline-danger btn-round"> × Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td>
                                    <figure class="media">
                                        <div class="img-wrap"><img src="" class="img-sm" height="110px"></div>
                                        <figcaption class="media-body">
                                            <h6 class="title text-truncate"></h6>
                                            <dl class="dlist-inline small">
                                                <dt></dt>
                                                <dd></dd>
                                            </dl>

                                        </figcaption>
                                    </figure> 
                                </td>
                                 <td> 
                                        <p>Total</p>
                                    </td>
                                    <td> 
                                        <div class="price-wrap"> 
                                            <var class="price">${totalprecio} €</var> 

                                        </div> <!-- price-wrap .// -->
                                    </td>
                                    <td class="text-right"> 
                                        
                                    </td>
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
                </div> <!-- card.// -->
 </c:otherwise>
                </c:choose>
            </div>

        </div>


        <jsp:include page="footer.jsp" />
    </body>
</html>
