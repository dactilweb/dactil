<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${us.getNivel() == 1}">
    <% response.sendRedirect("panelcontrol");%>
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <p>hola</p>
        <p>Daniel pelaro</p>
        <a href="login">login</a><br>
         <a href="logout">cerrar sesion</a>
         <img src="imagenes/arbret.png" style="max-width:100%;"/>
    </body>
</html>
