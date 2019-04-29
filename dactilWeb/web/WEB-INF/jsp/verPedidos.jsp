<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <title>Dactil: Pedidos</title>
    </head>

    <body>
        <h1>Pedidos realizados</h1>
       
         <table>
            <thead>
                
                <tr align="center">
                    <th>Nº Factura</th>
                    <th>Nombre Cliente</th>
                    <th>Fecha Pedido</th>
                    <th>Estado</th>
                    <th>Precio Total</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="prod" items="${listaFactura}">
                    <tr align="center">
                        <td>${prod.prod_nom}</td>
                        <td>${prod.prod_serie}</td>
                        <td>${prod.prod_categoria}</td>
                        <td>${prod.prod_descripcio}</td>
                        <td>${prod.prod_ubicacion}</td>
                        <td>${prod.prod_stock}</td>
                        <td>${prod.prod_preu}€</td>
                        <td>${prod.prod_descompte}%</td>
                        <td>${prod.prod_preu_final}€</td>
<!--                        <td><a href="eliminar/${prod.prod_id}">Eliminar</a></td> Para rutas amigables-->
                        
                        <td>
                            <a href="modificar?id=${prod.prod_id}"><button type="button" class="btn btn-info">Modificar</button></a>
                        
                        </td>
                        <td>
                            <a href="eliminar?id=${prod.prod_id}"><button type="button" class="btn btn-danger">Eliminar</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
