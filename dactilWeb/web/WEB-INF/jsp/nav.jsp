<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% String titulo = (String) request.getAttribute("titulo"); %>
<% String subtitulo = (String) request.getAttribute("subtitulo"); %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#boton").click(function () {
            //alert("hola");
            var pasar = true
            if ($("#nom_user2").val() === "") {
                $("#error_nombre2").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un nombre para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombre2").html("");
            }

            if ($("#cognom_user").val() === "") {
                $("#error_cognom").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un apellido para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_cognom").html("");
            }

            if ($("#direccio_user").val() === "") {
                $("#error_direccion").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una dirección para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_direccion").html("");
            }

            if ($("#telefono_user").val() === "") {
                $("#error_telefono").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un telefono<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_telefono").html("");
            }

            var email = $("#email_user2").val();
            var expre = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/i;
            if (email === "" || !expre.test(email)) {
                $("#error_email2").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa un email para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");

                pasar = false;
            } else {
                $("#error_email2").html("");
            }


            if ($("#passwd_user2").val() === "") {
                $("#error_passwd2").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una contraseña para el nuevo usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br>");


                pasar = false;
            } else {
                $("#error_passwd2").html("");
            }
            return pasar;
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#boton2").click(function () {
            //alert("hola");
            var pasar = true
            if ($("#email_cliente").val() === "") {
                $("#error_nombre").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una direccion de correo de usuario<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br><br>");
                pasar = false;
            } else {
                $("#error_nombre").html("");
            }
            if ($("#contrasena_cliente").val() === "") {
                $("#error_passwd").html("<div class='alert alert-danger alert-dismissible fade show' role='alert'>Ingresa una contraseña correcta<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><br>");


                pasar = false;
            } else {
                $("#error_passwd").html("");
            }
            return pasar;
        });
    });
</script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index">Dactil</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li <% out.println((titulo.equals("Inicio"))?"class='nav-item active'":""); %>>
                <a class="nav-link" href="index">Inicio</a>
            </li>
            <li <% out.println((titulo.equals("Interior"))?"class='nav-item active'":""); %>>
                <a class="nav-link" href="interior">Interior</a>
            </li>
            <li <% out.println((titulo.equals("Exterior"))?"class='nav-item active'":""); %>>
                <a class="nav-link" href="exterior">Exterior</a>
            </li>
            <li <% out.println((titulo.equals("Piscinas"))?"class='nav-item active'":""); %>>
                <a class="nav-link" href="piscinas">Iluminación Piscinas</a>
            </li>

            <c:choose>
                <c:when test="${us.getNivel() == 1}">
                    <li <% out.println((titulo.equals("Panel"))?"class='nav-item active'":""); %>>
                        <a class="nav-link" href="panelcontrol">Panel De Control</a>
                    </li>
                </c:when>
            </c:choose>


        </ul>
        <c:choose>
            <c:when test="${sessionScope.us == null}">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Acceder
                </button>
            </c:when>
        </c:choose>
        <c:choose>

            <c:when test="${sessionScope.us != null}">
         


                   
                    <article class="box">
	<div class="icontext">
		
		<div class="text-wrap dropdown">
			<small></small>
			<a href="#" class="b" data-toggle="dropdown" data-offset="20,10" aria-expanded="false"> 
                            <div class="" style="color:black;"><i class="fas fa-shopping-cart"></i><span class="badge">${numeroCarrito}</span><i class="fas fa-caret-down"></i></div>
			</a>
			<div class="dropdown-menu dropdown-menu-right" style="min-width: 250px; position: absolute; transform: translate3d(-87px, 42px, 0px); top: 0px; left: 0px; will-change: transform;" x-placement="bottom-end">
				<article class="p-2">			
                                    <h4>Carrito</h4>
                                    <c:forEach items="${listaCarrito}" var="linea">
					<hr>
					<figure class="media">
						<div class="img-wrap"><img height="50px" src="imgProductos/${linea.foto_producto}" class=""></div>
						<figcaption class="media-body">
							<a style="color:black;"href="verProducto?id=${linea.id_producto}">${linea.nombre_producto} </a>  <a href="eliminarCarrito?id=${linea.id_lineafactura}"> <i style="color:red;"class="fas fa-times"></i></a><br>
                                                        <span class="text-muted">Cantidad: ${linea.cantidad_compra}</span><br>
							<span class="text-muted">Precio: ${linea.precio_producto} €</span>
						</figcaption>
					</figure> <!-- media.// -->
                                    </c:forEach>
                                        <hr>
                                       <c:choose>
                <c:when test="${fn:length(listaCarrito)>0}">
                     <figure class="media">
						
						<figcaption class="media-body">
							<span class="text-muted">Total: ${totalprecio} €</span> <a class="btn btn-primary" href="carritover" role="button">Ver más</a><br>
						</figcaption>
					</figure> <!-- media.// -->
                            
                                        <hr>
					<figure class="media">
						
						<figcaption class="media-body">
                                                    
							<div class="paypalboton" style="margin-left: 5%;">
                            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST" target="_top">
                                <input type="hidden" name="business" value="10000189.joan23@fje.edu"/>
                                <input type="hidden" name="return" value="${initParam['urlretorno']}"/>
                                <input type="hidden" name="cmd" value="_cart"/>
                                <input type="hidden" name="upload" value="1"/>
                                <input type="hidden" name="currency_code" value="EUR">
                                <input type="hidden" name="lc" value="ES">
                                <input type="hidden" name="country" value="ES">
                                <c:forEach items="${listaCarrito}" var="linea">
                                    <c:set var="c" value="${c+1}"/>
                                    <input type="hidden" name="item_name_${c}" value="${linea.nombre_producto}" />
                                    <input type="hidden" name="item_number_${c}" value="${linea.id_producto}" />
                                    <input type="hidden" name="amount_${c}" value="${linea.precio_producto}" />
                                    <input type="hidden" name="quantity_${c}" value="${linea.cantidad_compra}" />
                                </c:forEach>

                                <input type="image" src="imagenes/pagarahora.png" border="0" name="submit" alt="PayPal, la forma rápida y segura de pagar en Internet." height="38px" class="img-fluid" alt="Responsive image">
                                <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
                            </form>



                        </div>
						</figcaption>
                                	</figure> <!-- media.// -->
                </c:when>
                <c:otherwise>
                    <p>Tu carrito está vacío, porfavor añade productos para continuar.</p>
                </c:otherwise>
            </c:choose>
					
				
				</article>
			</div> <!--  dropdown-menu .// -->
		</div> <!-- text-wrap.// -->
	</div> <!-- icontext.// -->
</article> <!-- box.// -->

                <div class="dropdown pmd-dropdown pmd-user-info ml-auto">
                    <a href="javascript:void(0);" class="btn-user dropdown-toggle media align-items-center" data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
                        <i class="fas fa-user"></i>

                        <div class="media-body"> ${us.getNombre_cliente()} &nbsp;</div>
                        <div class="media-body"> ${us.getApellido_cliente()}</div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <a class="dropdown-item" href="editarPerfil">Editar Perfil</a>
                        <a class="dropdown-item" href="misPedidos">Mis Pedidos</a>
                        <a class="dropdown-item" href="logout">Cerrar Sesion</a>
                    </ul>
                </div>
            </c:when>


        </c:choose>


    </div>
</nav>
<% 
  if(!titulo.equals("Detalle")){
        
%>  
<div class="contenidoBanner">
    <img class="banner" src="">
    <% 
    if(titulo.equals("Interior")){
        if(subtitulo.equals("bombillas")){
    %>
    <div class="img"><img src="imagenes/bombillas.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }if(subtitulo.equals("lamparas")){
        %>
    <div class="img"><img src="imagenes/lamparas.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }if(subtitulo.equals("tirasled")){
        %>
    <div class="img"><img src="imagenes/tled.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }if(subtitulo.equals("interior")){
        %> 
    <div class="img"><img src="imagenes/interior.png" class="img-fluid" alt="Responsive image"></div>
        <%
     }
 }
        %>
        <% 
     if(titulo.equals("Inicio")){
        %> 
    <div class="img"><img src="imagenes/inicio.png" class="img-fluid" alt="Responsive image"></div>
        <%
     }
        %>
        <% 
     if(titulo.equals("Exterior")){
         if(subtitulo.equals("extLed")){
        %>
    <div class="img"><img src="imagenes/extled.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
        if(subtitulo.equals("extFocoLed")){
        %>
    <div class="img"><img src="imagenes/extfoco.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
    if(subtitulo.equals("extApliques")){
        %>
    <div class="img"><img src="imagenes/apliques.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
        if(subtitulo.equals("exterior")){
        %> 
    <div class="img"><img src="imagenes/exterior.png" class="img-fluid" alt="Responsive image"></div>
        <%
            }
     }
        %>
        <% 
     if(titulo.equals("Piscinas")){
        %> 
    <div class="img"><img src="imagenes/piscinas.png" class="img-fluid" alt="Responsive image"></div>
        <%
     }
     if(titulo.equals("Carrito")){
        %>
    <div class="img"><img src="imagenes/carrito.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Quienes_somos")){
        %>
    <div class="img"><img src="imagenes/qsomos.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Donde_estamos")){
        %>
    <div class="img"><img src="imagenes/dondestamos.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Garantias_y_Devoluciones")){
        %>
    <div class="img"><img src="imagenes/garydev.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Forma_Entrega")){
        %>
    <div class="img"><img src="imagenes/fpago.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Funcionamiento_Envio")){
        %>
    <div class="img"><img src="imagenes/envios.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Panel")){
        %>
    <div class="img"><img src="imagenes/panelcontrol.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
if(titulo.equals("Editar_Perfil")){
        %>
    <div class="img"><img src="imagenes/editperf.png" class="img-fluid" alt="Responsive image"></div>
        <%
        }
}
        %>



</div>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Iniciar Sesión</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form:form modelAttribute="usuarios" action="login" method="POST">

                    <div class="form-group">
                        <label for="inputEmail3" >Email</label>
                        <form:input path="email_cliente" class="form-control" id="email_cliente" type="text"/> <br/>
                        <span id="error_nombre"></span>
                        <form:errors path="nombre_cliente"/><br/>
                        <label for="inputPassword3" class="">Contraseña</label>
                        <form:input path="contrasena_cliente" class="form-control" id="contrasena_cliente" type="password"/> <br/>
                        <span id="error_passwd" ></span><br/>
                        <form:errors path="contrasena_cliente"/>
                    </div>
                    <input type="submit" id="boton2" value="Acceder" class="btn btn-primary"/>

                </form:form>       
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Registrarse</button>

            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="bd-example-modal-lg">Registro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form:form modelAttribute="usuarios" action="nuevoUsuario" method="POST">
                    <div class="form-group">

                        <div class="row">
                            <div class="col-md-6">
                                Nombre:
                                <form:input path="nombre_cliente" id="nom_user2" type="text" class="form-control"/>  
                                <span id="error_nombre2"></span>
                                <form:errors path="nombre_cliente"/><br/>
                            </div>
                            <div class="col-md-6">
                                Apellido:
                                <form:input path="apellido_cliente" id="cognom_user" type="text" class="form-control"/> 
                                <span id="error_cognom"></span>
                                <form:errors path="apellido_cliente"/><br/>
                            </div>
                            <div class="col-md-6">
                                Apellido2:
                                <form:input path="apellido2_cliente" id="cognom2_user" type="text" class="form-control"/> <br/>
                            </div>
                            <div class="col-md-6">

                                Telefono:
                                <form:input path="telefono_cliente" id="telefono_user" type="text" class="form-control"/> 
                                <span id="error_telefono"></span>
                                <form:errors path="telefono_cliente"/><br/>
                            </div>
                            <div class="col-md-12">
                                Direccion:
                                <form:input path="direccion_cliente" id="direccio_user" type="text" class="form-control"/> <br/>
                                <span id="error_direccion"></span>
                                <form:errors path="direccion_cliente"/>
                            </div>
                            <div class="col-md-12">
                                Direccion2:
                                <form:input path="direccion2_cliente" id="direccio2_user" type="text" class="form-control"/> <br/>
                            </div>

                            <div class="col-md-6">

                                Email:
                                <form:input path="email_cliente" id="email_user2" type="email" class="form-control"/> 
                                <span id="error_email2"></span>
                                <form:errors path="email_cliente"/><br/>
                            </div>
                            <div class="col-md-6">

                                Contraseña:
                                <form:input path="contrasena_cliente" id="passwd_user2" type="password" class="form-control"/>     
                                <form:errors path="contrasena_cliente"/>
                                <span id="error_passwd2" ></span><br/>
                            </div>
                        </div>
                        <input type="submit" value="Crear" class="btn btn-primary" id="boton"/>
                    </div>
                </form:form> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Volver</button>


            </div>
        </div>
    </div>
</div>

