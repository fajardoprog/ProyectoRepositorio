<%-- 
    Document   : cabecera
    Created on : 26 feb. 2024, 15:53:49
    Author     : José Antonio Fajardo Naranjo
--%>

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
            <span class="material-symbols-outlined" id="iniSesi">account_circle</span>
            <span class="text-center " id="nombreUsu">No está conectado</span>
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
                                    <a class="dropdown-item" href="subida.jsp">
                                        <span class="material-symbols-outlined mx-2">upload_file</span>Subir
                                        archivos
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="subida.jsp">
                                        <span
                                            class="material-symbols-outlined mx-2">drive_folder_upload</span>Subir
                                        carpetas
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item w-33">
                            <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                               href="busquedas.jsp">
                                <span class="material-symbols-outlined mx-2">user_attributes</span>Ver usuarios
                            </a>
                        </li>
                        <li class="nav-item w-33">
                            <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                               href="miEspacio.jsp">
                                <span class="material-symbols-outlined mx-2">home</span>Mi espacio
                            </a>
                        </li>
                        <li class="nav-item w-33">
                            <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                               href="reposita2.jsp">
                                <span class="material-symbols-outlined mx-2">sports_esports</span>Reposita2
                            </a>
                        </li>
                    </ul>
                </div>
                <div>
                    <form action="busquedas.jsp" class="d-flex align-items-center justify-content-center">
                        <div class="input-group input-group-sm row">
                            <label class="input-group-text col-2 ms-2"
                                   for="campoBusquedaPrincipal">Buscar</label>
                            <input class="form-control col-4" type="search" placeholder="Búsqueda..."
                                   aria-label="Búsqueda" id="campoBusquedaPrincipal" />
                            <input type="submit" value="Buscar" class="btn btn-sm btn-primary col-2 ms-2"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</nav>
