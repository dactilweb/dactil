<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¿Quienes somos?</title>
     
            <jsp:include page="style.jsp" />
       
    </head>
    <body>
                <jsp:include page="nav.jsp" />
        <div class="contenido">
        <h1>¿Quienes somos?</h1>
        
        <p>Somos una empresa de iluminación. Fundada 
            en la ciudad de Barcelona en el año 1990 por Tomas Dactil 
            cuando a sus 26 años dejo su empleo en una pescadería para formar su propia
            empresa de venta de iluminación gracias a el apoyo de su familia y de un crédito
            bancario para jóvenes emprendedores. Al principio empezó a vender bombillas en un
            local pero a partir de 2005 decidio crearse una pagina web y desde entonces
            tambien se dedico a vender productos de forma online.
        </p>
        </div>
        
        <jsp:include page="footer.jsp" />

    </body>
</html>
