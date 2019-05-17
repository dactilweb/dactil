<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¿Quienes somos?</title>
     
            <jsp:include page="style.jsp" />
            <style>
                .test{
                  height: 400px;
                  text-align: center;
                  width: 100%;
                }
                
            </style>
    </head>
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
        <h1>Funcionamiento del envío</h1>
        
        <p>Todos nuestros productos se envian a la puerta del cliente
            en menos de cinco dias laborables en
           la peninsula iberica. Las compañias de reparto con las que repartimos nuestros 
            pedidos son Seur, GLS y ASM unas grandes compañias muy profesionales que haran que
            tu pedido llegue en el tiempo especificado en perfectas condiciones.
        </p>
        <div class="imagen">
          <img src="https://www.lacasadelalampara.com/wp-content/uploads/2016/09/pasos-de-compra-facil-ventajas-en-la-casa-de-la-lampara-nueva-1024x486.jpg"class="test"/>
        </div>
          <br>
        <h2>¡Con un metodo de envio como este todo son ventajas!</h2>
        </div>
        
        <jsp:include page="footer.jsp" />

    </body>
</html>
