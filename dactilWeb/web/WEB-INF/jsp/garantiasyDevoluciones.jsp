<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
                .imagenenvio{
                  height: 310px;
                  text-align: center;
                  width: 100%;
                }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Garantías y devoluciones</title>
     
            <jsp:include page="style.jsp" />
       
    </head>
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
             <div class="contenido2">
        <h1>Garantias y devoluciones</h1>
        <br>
        <p>
            La Garantía total está incluida en nuestros productos sin costes extra. Podrás consultar la duración en la página del producto. El plazo empieza en el momento que se hace la factura de compra del producto.<br>
            Para poder solicitar la Garantía:<br>
            Usa los productos como se aconseja en nuestra web, en la caja y/o en el manual.<br>
            La temperatura ambiente no debe ser inferior a -20⁰C y no superior a +30⁰C en las bombillas LED.<br>
            La temperatura ambiente debe ser inferior a -30⁰C y no superior a +45⁰C para tubos LED y el resto de bombillas.<br>
            La humedad en el aire debe estar por debajo del 80%.<br>
            Debería haber al menos 10mm de espacio entre la bombilla y la luminaria.<br>
            El ciclo de encendido/apagado máximo del producto es de 50.000 ciclos.<br>
            El voltaje no debe variar más del 10% sobre 230V.<br>
            No reembolsamos ningún otro montante de dinero que no sea el coste de las actuales bombillas o luminarias, que se compraron con nosotros. Por ejemplo: Costes de instalación (horas de trabajo, mano de obra, etc) no están cubiertos.<br>
            Si tu producto está en Garantía enviaremos las nuevas lámparas para reemplazar aquellas con defecto.<br>
        </p>
        <img src="imagenes/garantia.png"class="imagenenvio"/>
        </div>
        </div>
        <jsp:include page="footer.jsp" />

    </body>
</html>

