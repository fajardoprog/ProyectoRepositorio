<%-- 
    Document   : miPerfil
    Created on : 24 feb. 2024, 16:04:27
    Author     : José Antonio Fajardo Naranjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi perfil</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <script>

        </script>
        <style>
            #fotoPer {
                width: 30%;
                border-radius: 100px;
            }
        </style>
    </head>

    <body class="d-flex flex-column justify-content-between">
       <header>
            <nav class="navbar navbar-expand-xl navbar-dark">
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

                    <a href="inicioSesion.jsp"
                       class="order-xl-1 d-flex flex-column align-items-center text-decoration-none mx-3"
                       id="enlInciarSesion">
                        <span class="material-symbols-outlined" id="iniSesi">account_circle</span>
                        <span class="text-center " id="nombreUsu">No está conectado</span>
                    </a>

                    <div class="collapse navbar-collapse justify-content-between flex-column" id="barraNavPrincipal">
                        <div class="d-flex flex-column">
                            <!--Dentro de este bloque se engloba los dos para que se vaya el filtro debajo-->
                            <div class="mb-2">
                                <ul class="navbar-nav mb-2 flex-sm-row flex-sm-wrap flex-xl-nowrap mb-xl-0">
                                    <li class="nav-item dropdown d-xl-flex w-100 align-items-center text-md-center">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
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
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="listaUsuarios.jsp">
                                            <span class="material-symbols-outlined mx-2">user_attributes</span>Ver usuarios
                                        </a>
                                    </li>
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="misRepositorios.jsp">
                                            <span class="material-symbols-outlined mx-2">home</span>Mis repositorios
                                        </a>
                                    </li>
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="miEspacio.jsp">
                                            <span class="material-symbols-outlined mx-2">group</span>Compartido
                                            conmigo
                                        </a>
                                    </li>
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="reposita2.jsp">
                                            <span class="material-symbols-outlined mx-2">sports_esports</span>Reposita2
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div>
                                <form class="d-flex align-items-center justify-content-center">
                                    <div class="input-group input-group-sm row">
                                        <label class="input-group-text col-2 ms-2"
                                               for="campoBusquedaPrincipal">Nombre</label>
                                        <input class="form-control col-4" type="search" placeholder="Búsqueda..."
                                               aria-label="Búsqueda" id="campoBusquedaPrincipal" />
                                        <button class="btn btn-sm btn-primary col-2 ms-2" type="submit">Buscar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page">Inicio</li>
                    <li class="breadcrumb-item" aria-current="page">Mi espacio</li>
                    <li class="breadcrumb-item active" aria-current="page">Mi perfil</li>
                </ol>
            </nav>
        </header>
        <main class="d-flex flex-column align-items-center">
            <div class="container-fluid col-lg-6 m-5 d-flex flex-column justify-content-center">
                <h1>Mi Perfil</h1>
                <form action="" class="d-flex flex-column align-items-center">
                    <div class="col-12 d-flex justify-content-center">
                        <img src="img/LogoFi.gif" alt="FotoPerfilUsu" id="fotoPer" class="w-40">
                    </div>


                    <label for="nombreUsu" class="form-label">Nombre Usuario</label>
                    <input type="text" class="form-control" id="nombreUsuario" aria-describedby="nombre Usuario"
                           value="Evaristo97">

                    <div class="col-12 mt-3 mb-3 d-flex flex-column align-items-center"><img src="img/filigrana2.png"
                                                                                             alt="filigrana" class="w-50"></div>

                    <h4>Cambio contraseña</h4>
                    <label for="passUsu" class="form-label">Contraseña usuario</label>
                    <input type="password" class="form-control" id="passUsu" aria-describedby="contraseña del Usuario"
                           value="Evaristo97">

                    <label for="repePass" class="form-label">Confirmar contraseña usuario</label>
                    <input type="password" class="form-control" id="repePass" aria-describedby="nombre Usuario"
                           value="Evaristo97">

                    <input type="submit" value="Confirmar cambios" class="btn btn-success m-3">
                </form>
            </div>


        </main>
        <footer class="d-flex flex-wrap justify-content-around align-items-center p-5 pb-3">
            <div class="col-md-4 d-flex flex-column">
                <h6 class="mb-3 mb-md-0 text-body-secondary">©FIpository por:</h6>
                <h6 class="mb-3 mb-md-0 text-body-secondary">José Antonio Fajardo</h6>
                <h6 class="mb-3 mb-md-0 text-body-secondary">Ismael J.
                    Jiménez</h6>
            </div>

            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="px-3">
                    <a class="text-body-secondary" href="#">
                        <i class="bi bi-instagram"></i>
                    </a>
                </li>
                <li class="px-3">
                    <a class="text-body-secondary" href="#">
                        <i class="bi bi-facebook"></i>
                    </a>
                </li>
                <li class="px-3">
                    <a class="text-body-secondary" href="#">
                        <i class="bi bi-whatsapp"></i>
                    </a>
                </li>
            </ul>
        </footer>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>