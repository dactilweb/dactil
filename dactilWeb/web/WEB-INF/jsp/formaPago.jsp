<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>forma pago</title>
          <style>
                .imagenenvio{
                  height: 260px;
                  text-align: center;
                  width: 60%;
                  margin-left: 20%;
                }
                
            </style>
     
            <jsp:include page="style.jsp" />
       
    </head>
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
        <h1>¿Cuáles son las formas de pago para pedidos Online?</h1>
        <br><br>
        <p>
            
            <b>Puedes pagar tu compra online con:</b><br><br>

            Tu tarjeta de crédito o débito (VISA, Mastercard, American Express, Discover Network, etc.).<br><br>
    A través de tu cuenta PayPal. Con PayPal, puedes pagar de forma segura todas tus compras en IKEA.es sin costes adicionales.
        </p>
        <img src="imagenes/formaspago.png"class="imagenenvio"/>
        </div>
         
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
