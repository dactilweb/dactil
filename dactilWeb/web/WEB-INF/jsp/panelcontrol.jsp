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
                 <div class="center-block">
                 <a href="verPedidos" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"><i class="fas fa-box-open"></i> Ver Pedidos</a>
                  <a href="verUsers" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"><i class="fas fa-users"></i> Ver Usuarios</a>
                   <a href="verProductosAll" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"><i class="far fa-newspaper"></i> Ver Productos</a>
                 </div>
         </div>
         </div>
          <jsp:include page="footer.jsp" />
    </body>
</html>
