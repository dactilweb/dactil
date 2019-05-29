<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<% String titulo = (String) request.getAttribute("titulo"); %>
<% String subtitulo = (String) request.getAttribute("subtitulo");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/uikit.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)">
        <title><%=titulo%></title>
        <jsp:include page="style.jsp" />
    </head>

    <body>
        <jsp:include page="nav.jsp" />

        <div class="contenido">
            <%
                if (titulo.equals("Interior")) {
            %>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <li <% out.println((subtitulo.equals("interior")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="interior">Todos los Articulos</a>
                        </li>

                        <li <% out.println((subtitulo.equals("bombillas")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="interiorBomb">Bombillas LED</a>
                        </li>
                        <li <% out.println((subtitulo.equals("lamparas")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="interiorLamp">Lámparas</a>
                        </li>
                        <li <% out.println((subtitulo.equals("tirasled")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="interiorTLed">Tiras LED</a>
                        </li>

                    </div>
                </div>
            </nav>
            <%
                }

                if (titulo.equals("Inicio")) {
            %>
            <br> <h5>Todos los productos disponibles serán mostrados aquí</h5>
            <%
                }
                if (titulo.equals("Piscinas")) {
            %>
            <br> <h5>Todos los productos disponibles serán mostrados aquí</h5>
            <%
                }
                if (titulo.equals("Exterior")) {
            %>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <li <% out.println((subtitulo.equals("exterior")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="exterior">Todos los Articulos</a>
                        </li>

                        <li <% out.println((subtitulo.equals("extLed")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="exteriorLed">Tiras LED</a>
                        </li>
                        <li <% out.println((subtitulo.equals("extFocoLed")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="exteriorFocos">Focos LED</a>
                        </li>
                        <li <% out.println((subtitulo.equals("extApliques")) ? "class='nav-item active'" : ""); %>>
                            <a class="nav-link" href="exteriorApliques">Apliques</a>
                        </li>


                    </div>
                </div>
            </nav>
            <%
                }
            %>
           
            
<div class="row">
 <c:forEach var="prod" items="${listaProductos}">
<div class="col-md-3">
	<figure class="card card-product">
            <div class="img-wrap" id="imagenProductos"> <img src="imgProductos/${prod.foto_producto}" width="200px">
			
		</div>
		<figcaption class="info-wrap">
                    <h5>${prod.nombre_producto}</h5><br>
                    <p>${prod.cantidad_producto} Articulos disponibles</p>
                    <a class="" href="verProducto?id=${prod.id_producto}"><i class="fas fa-info-circle"></i> Ver más</a>
			<div class="action-wrap">
                           
				<div class="price-wrap h5">
                                    <br><span class="price-new">${prod.precio_producto}€</span>
				</div> <!-- price-wrap.// -->
                                    <c:choose>
                                        <c:when test="${prod.cantidad_producto<=0}">
                                           <a href="" class="btn btn-primary btn-sm float-right disabled"> <i class="fas fa-shopping-cart"></i> Añadir al carrito </a><br>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="addCarrito?id=${prod.id_producto}" class="btn btn-primary btn-sm float-right"> <i class="fas fa-shopping-cart"></i> Añadir al carrito </a><br>
                                        </c:otherwise>
                                    </c:choose>
                                
			</div> <!-- action-wrap -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
 </c:forEach>
</div> <!-- row.// -->

        </div>


        <jsp:include page="footer.jsp" />

    </body>
</html>
