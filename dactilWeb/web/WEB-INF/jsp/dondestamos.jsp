<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .mapa{
                text-align: center;
            }
           
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¿Donde estamos?</title>
        <jsp:include page="style.jsp" />
    </head>
    
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
        <h1>¿Donde estamos?</h1>
        
        <div class="mapa">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2994.381078081919!2d2.134057149293529!3d41.365804619019755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a49899fc893b5b%3A0x3f86b2319c881063!2sCarrer+de+Parcerisa%2C+41%2C+08014+Barcelona!5e0!3m2!1sca!2ses!4v1558024608048!5m2!1sca!2ses" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                <h3>Puede encontrarnos en la calle Parcerisas de Barcelona</h3>
        </div>
        <div class="horario">
        <h2>Horario</h2>
        <h3>Lunes-Sabado</h3>
        <h4>08:00-23:00</h4>
        </div>
        </div>
        <jsp:include page="footer.jsp" />

    </body>
</html>
