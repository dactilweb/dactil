<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index");%>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <title>Panel de Control</title>
        <jsp:include page="style.jsp" />
    </head>

    <body>
         <jsp:include page="nav.jsp" />
         <div class="contenido">
             <div class="contenido2">
        <a href="verPedidos"><h5>Ver Pedidos</h5></a>
        <a href="verUsers"><h5>Ver Usuarios</h5></a>
        <a href="verProductosAll"><h5>Ver Productos</h5></a>
         </div>
         </div>
          <jsp:include page="footer.jsp" />
    </body>
</html>
