<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <div class="dropdown pmd-dropdown pmd-user-info ml-auto">
        <a href="javascript:void(0);" class="btn-user dropdown-toggle media align-items-center" data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
            <i class="fas fa-user"></i>
            <c:choose>
              
                <c:when test="${sessionScope.us != null}">
                    <div class="media-body"> ${us.getNombre_cliente()} &nbsp;</div>
             <div class="media-body"> ${us.getApellido_cliente()}</div>
        </a>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
            <a class="dropdown-item" href="javascript:void(0);">Edit Profile</a>
            <c:choose>
                <c:when test="${us.getNivel() == 1}">
                     <a class="dropdown-item" href="panelcontrol">Panel de Control</a>
                </c:when>
            </c:choose>
            <a class="dropdown-item" href="logout">Cerrar Sesion</a>
        </ul>
                </c:when>
                
                <c:when test="${sessionScope.us == null}">
                    <div class="media-body">
                test
            </div>
            <i class="material-icons md-light ml-2 pmd-sm">test</i>
        </a>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
            <a class="dropdown-item" href="login">Iniciar Sesion</a>
            <a class="dropdown-item" href="crearUsuario">Registrarse</a>
        </ul>
                </c:when>
            </c:choose>
            
    </div>
  </div>
</nav>