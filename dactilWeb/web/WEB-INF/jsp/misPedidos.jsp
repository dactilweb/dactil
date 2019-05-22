<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="style.jsp" />
    </head>
    <body>
        <jsp:include page="nav.jsp" />


        <div class="contenido">
            <div class="contenido2">
               <table class="table table-hover">
                    <thead>
                        <tr>
                            <th  scope="col">NºFactura</th>
                            <th scope="col">Estado Factura</th>
                            <th scope="col">Fecha de Compra</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pedidos" items="${listaPedidos}">
                            <tr>
                                <td>${pedidos.id_factura}</span></td>
                                <td>${pedidos.estado_factura}</td>
                                <td>${pedidos.fecha_factura}</td>
                               
                        </c:forEach>  
                            
                    </tbody>
                </table>

            </div>
        </div>


        <jsp:include page="footer.jsp" />
    </body>
</html>
