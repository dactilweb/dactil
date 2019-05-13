
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.us != null}">
    <% response.sendRedirect("index");%>
</c:if>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="style.jsp" />
    </head>
    <style>
        .col-sm-10{
            margin-top:4%;
        }
    </style>  
    <body>
        <div class="col-sm-10" align="center">
        <h1>Iniciar Sesión</h1>
        <div class="form-group">
       <form:form modelAttribute="usuarios" action="login" method="POST">
         <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <form:input path="email_cliente" id="email_cliente" type="text"/> <br/>
          <label for="inputPassword3" class="col-sm-2 col-form-label">Contraseña</label>
            <form:input path="contrasena_cliente" id="contrasena_cliente" type="password"/> <br/>
            <div class="col-sm-2 col-form-label" align="left">
            <input type="submit" value="Acceder" class="btn btn-success"/>
            <a class="btn btn-primary" href="index" role="button"> Volver a la página web</a>
            </div>
        </form:form> 
            
        </div>
        </div>
    </body>
</html>
