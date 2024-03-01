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
        <a class="navbar-brand" href="#">
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
            <i class="bi bi-person-circle" id="iniSesi"></i>
            <span class="text-center " id="nombreUsu">
                <c:choose>
                    <c:when test="${cookie.usuarioActual != null}">
                        ${cookie.usuarioActual.value}
                    </c:when>
                    <c:otherwise>
                        No está conectado
                    </c:otherwise>
                </c:choose> 
            </span>
        </a>

        <!--        
                <div class="dropdown text-end">
                  <a href="#" class="order-lg-1 d-flex flex-column align-items-center text-decoration-none mx-3" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
                  </a>
                  <ul class="dropdown-menu text-small">
                    <li><a class="dropdown-item" href="#">New project...</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                  </ul>
                </div>
        -->

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
                                    <a class="dropdown-item" href="#">
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
