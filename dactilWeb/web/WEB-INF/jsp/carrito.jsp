
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
                   hola
               <c:forEach var="linea" items="${listaCarrito}">
                   <p>${linea.getId_Producto()}</p><br>
                   <p>${linea.getNombre_Producto()}</p>
               </c:forEach>     
</div>
           </div>
      
   
    <jsp:include page="footer.jsp" />
    </body>
</html>
