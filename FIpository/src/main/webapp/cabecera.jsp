<%-- 
    Document   : cabecera
    Created on : 26 feb. 2024, 15:53:49
    Author     : José Antonio Fajardo Naranjo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--Cabecera cambios hechos preguntar a Fajardo-->

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#barraNavPrincipal" aria-controls="barraNavPrincipal" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <a class="navbar-brand" href="index.jsp">
            <img src="img/LogoFi.png" alt="Logo" class="d-inline-block">
            FIpository
        </a>

        <!-- Cambiar esta estructura por 
        <form>
            submit
        </form>
        -->
        <a href="inicioSesion.jsp"
           class="order-lg-1 d-flex flex-column align-items-center text-decoration-none mx-3"
           id="enlInciarSesion">
            <c:if test="${cookie.usuarioActual == null}">
                <i class="bi bi-person-circle" id="iniSesi"></i>
                <span class="text-center " id="nombreUsu">No está conectado</span>
            </c:if>

            <c:if test="${cookie.usuarioActual != null}">
                <div class="dropdown text-end order-lg-1 d-flex flex-column align-items-center text-decoration-none mx-3 p-2">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" id="perfilUsuario">
                        <img src="imgPerfilUsuario/${}" alt="fotoPeril" class="rounded-circle" id="imgUsuario">
                        ${cookie.usuarioActual.value}
                    </a>
                    <ul class="dropdown-menu text-small">
                        <li><a class="dropdown-item" href="miPerfil.jsp">Ver mi Perfil</a></li>
                        <li><a class="dropdown-item" href="miEspacio.jsp">Mi espacio</a></li>
                        <li><a class="dropdown-item" href="misOpiniones.jsp">Mis opiniones</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-power"></i> Cerrar Sesión</a></li>
                    </ul>
                </div>
            </c:if>
        </a>

        <div class="collapse navbar-collapse justify-content-between flex-column" id="barraNavPrincipal">
            <div class="d-flex flex-column">
                <!--Dentro de este bloque se engloba los dos para que se vaya el filtro debajo-->
                <div class="mb-2">
                    <ul class="navbar-nav mb-2 flex-sm-row flex-sm-wrap flex-lg-nowrap mb-lg-0 justify-content-around">
                        <li class="nav-item dropdown d-lg-flex w-100 align-items-center text-sm-center">
                            <a class="nav-link dropdown-toggle px-3" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                Subida
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="crearRepositorio.jsp">
                                        <i class="bi bi-cloud-plus mx-2"></i>Crear repositorio
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item" href="subida.jsp">
                                        <i class="bi bi-file-earmark-arrow-up mx-2"></i>Subir
                                        archivos
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="subida.jsp">
                                        <i class="bi bi-folder-plus mx-2"></i>Subir
                                        carpetas
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item w-33">
                            <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                               href="busquedas.jsp">
                                <i class="bi bi-people-fill mx-2"></i>Ver usuarios
                            </a>
                        </li>
                        <li class="nav-item w-33">
                            <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                               href="miEspacio.jsp">
                                <i class="bi bi-house-fill mx-2"></i>Mi espacio
                            </a>
                        </li>
                        <li class="nav-item w-33">
                            <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                               href="misOpiniones.jsp">
                                <i class="mx-2 bi bi-person-heart"></i>Mis opiniones
                            </a>
                        </li>
                    </ul>
                </div>
                <div>
                    <form action="busquedas.jsp" class="d-flex align-items-center justify-content-center">
                        <div class="input-group">
                            <label class="input-group-text ms-2"
                                   for="campoBusquedaPrincipal"><i class="bi bi-search mx-2 fs-3"></i></label>
                            <input class="form-control" type="search" placeholder="Búsqueda..."
                                   aria-label="Búsqueda" id="campoBusquedaPrincipal" />
                            <input type="submit" value="Buscar" class="btn btn-sm btn-primary col-4 ms-2 me-2"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</nav>
