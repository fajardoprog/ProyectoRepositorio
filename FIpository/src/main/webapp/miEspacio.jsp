<%-- 
    Document   : miEspacio
    Created on : 24 feb. 2024, 16:04:22
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
        <title>Mi espacio</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloMiEspacio.css">
        <script>

        </script>

    </head>

    <body>
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

                    <!-- Cambiar esta estructura por 
                    <form>
                        submit
                    </form>
                    -->
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
                                    <li class="nav-item dropdown d-xl-flex w-50 align-items-center text-md-center">
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
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="listaUsuarios.jsp">
                                            <span class="material-symbols-outlined mx-2">user_attributes</span>Ver usuarios
                                        </a>
                                    </li>
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="misRepositorios.jsp">
                                            <span class="material-symbols-outlined mx-2">home</span>Mi espacio
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
                                               for="campoBusquedaPrincipal">Buscar</label>
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
                    <li class="breadcrumb-item active" aria-current="page">Mi espacio</li>
                </ol>
            </nav>
        </header>
        <h1>Mi espacio</h1>
        <div class="container-fluid m-0 p-3 p-md-2 d-md-flex">
            <aside class="col-md-4 p-3">
                <h3 class="p-0">Mis repositorios</h3>

                <article>
                    <form  class="form-floating mb-3">
                        <input type="text" class="form-control" name="busqueda-repositorios" id="busqueda-repositorios"
                               placeholder="" />
                        <label for="busqueda-repositorios">Buscar repositorio</label>
                    </form>
                </article>

                <section class="d-flex flex-column container-repositorios">
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/1 DAW</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/2 DAW</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Policía</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Cliente</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Diseño de Interfaces Web</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Despliegue</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Desarrollo web en entorno servidor</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Programación</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Bases de datos</a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/FOL</a>
                    </article>
                </section>
            </aside>
            <main class="offset-md-1 col-md-7">
                <section id="compartido-conmigo">
                    <header>
                        <h3>Compartido conmigo</h3>
                    </header>
                    <section class="d-flex flex-column container-repositorios">
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/3 DAW</a>
                        </article>
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/Profesores</a>
                        </article>
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/Apuntes de Bootstrap</a>
                        </article>
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/Accesibilidad</a>
                        </article>
                    </section>
                </section>
                <section id="actividad-reciente">
                    <header>
                        <h3>Actividad reciente</h3>
                    </header>
                    <article class="card carta-actividad">
                        <header class="card-header d-flex align-items-center">
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <div class="titulo-accion ps-3">
                                <h5>IsmaelJ creó un repositorio</h5>
                                <p>Hace 7 horas</p>
                            </div>
                        </header>
                        <article class="contenedor-afectado-repositorio d-flex align-items-center justify-content-between container-fluid py-2">
                            <div class="datos-repositorio text-truncate">
                                <p>
                                    IsmaelJ/Apuntes Lola
                                </p>
                                <p class="text-truncate">
                                    Apuntes para las asignaturas de Despliegue de Aplicaciones Web y Desarrollo Web en Entorno Servidor
                                </p>
                            </div>
                            <form class="ms-5">
                                <input type="submit" value="Ir al repositorio" class="btn btn-success"/>
                            </form>
                        </article>
                    </article>

                    <article class="card carta-actividad">
                        <header class="card-header d-flex align-items-center">
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <div class="titulo-accion ps-3">
                                <h5>IsmaelJ ha empezado a seguir a alguien</h5>
                                <p>Hace 7 horas</p>
                            </div>
                        </header>
                        <article class="contenedor-afectado-usuario container-fluid d-flex flex-column py-2">
                            <div class="datos-usuario d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center text-truncate">
                                    <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                                    <div class="usuario-completo ps-3 text-truncate">
                                        <p>petorluj</p>
                                        <p class="text-truncate">Pedro Manuel Torres Luján</p>
                                        <p class="text-truncate">Profesor de Desarrollo Web en entorno Cliente en el IES Martín Rivero</p>
                                    </div>
                                </div>
                                <form class="ms-5">
                                    <input type="submit" value="Comenzar a seguir" class="btn btn-success"/>
                                </form>
                            </div>
                            <div class="stats d-flex justify-content-around pt-2 text-center">
                                <p class="px-2">
                                    <span class="num-repositorios">
                                        33
                                    </span>
                                    repositorio/s
                                </p>

                                <p class="px-2">
                                    <span class="num-seguidores">
                                        33
                                    </span>
                                    seguidor/es
                                </p>

                                <p class="px-2">
                                    <span class="num-reputacion">
                                        333
                                    </span>
                                    punto/s de reputación
                                </p>
                            </div>
                        </article>
                    </article>

                    <article class="card carta-actividad">
                        <header class="card-header d-flex align-items-center">
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <div class="titulo-accion ps-3">
                                <h5>IsmaelJ ha jugado una partida a Reposita2</h5>
                                <p>Hace 9 horas</p>
                            </div>
                        </header>
                        <article class="contenedor-afectado-juego">
                            <div class="container-fluid d-flex justify-content-between align-items-center py-2 text-truncate">
                                <p class=" text-truncate">¡No pierdas tu oportunidad y juega tú también!</p>
                                <form>
                                    <input type="submit" class="btn btn-success" value="Jugar ahora">
                                </form>
                            </div>
                        </article>
                    </article>

                </section>
                <section id="intereses">
                    <header>
                        <h3>Quizá te interese basado en tus búsquedas</h3>
                    </header>
                    <!--TODO: Colocar artículos basados en tus búsquedas-->
                    <article>

                    </article>
                </section>
            </main>
        </div>
        <footer>
        </footer>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>