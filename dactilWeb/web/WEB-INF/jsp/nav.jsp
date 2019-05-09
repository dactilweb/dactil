<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String titulo = (String) request.getAttribute("titulo"); %>
<% String subtitulo = (String) request.getAttribute("subtitulo"); %>
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
    <div class="dropdown pmd-dropdown pmd-user-info ml-auto">
        <a href="javascript:void(0);" class="btn-user dropdown-toggle media align-items-center" data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
            <i class="fas fa-user"></i>
            
                    <div class="media-body"> ${us.getNombre_cliente()} &nbsp;</div>
             <div class="media-body"> ${us.getApellido_cliente()}</div>
        </a>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
            <a class="dropdown-item" href="#">Editar Perfil</a>
            <c:choose>
                <c:when test="${us.getNivel() == 1}">
                     <a class="dropdown-item" href="panelcontrol">Panel de Control</a>
                </c:when>
            </c:choose>
            <a class="dropdown-item" href="logout">Cerrar Sesion</a>
        </ul>
                </c:when>
                
              
            </c:choose>
        
    </div>
  </div>
</nav>
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
    
    %>
    
</div>