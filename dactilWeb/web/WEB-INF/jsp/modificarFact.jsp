<%-- 
    Document   : modificarFact
    Created on : 24-may-2019, 16:27:02
    Author     : Manu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form:form modelAttribute="factura" action="modificarFact" method="POST">
            Estado:
		<form:select path="estado_factura">
                    <form:option value="en proceso" label="en proceso"/>
                    <form:option value="completado y enviado" label="completado y enviado"/>
                </form:select>
            <form:hidden path="id_factura"/>
            <input type="submit" value="Modificar" class="btn btn-primary" id="boton"/>
         </form:form>
    </body>
</html>
