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
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Inicio</li>
                </ol>
            </nav>
        </header>
        <h1>Mi espacio</h1>
        <div class="container-fluid m-0 p-3 px-lg-5 d-lg-flex">
            <aside  id="mis-repositorios"  class="col-lg-4 p-4">
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
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#">JFajardo/1 DAW
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/2 DAW
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Policía
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Cliente
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Diseño de Interfaces Web
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Despliegue
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Desarrollo web en entorno servidor
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Programación
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/Bases de datos
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1" href="#">JFajardo/FOL
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>
                </section>
            </aside>
            <main class="offset-lg-1 col-lg-7">
                <section id="compartido-conmigo" class="p-4 my-3 my-lg-0">
                    <header>
                        <h3>Compartido conmigo</h3>
                    </header>
                    <section class="d-flex flex-column container-repositorios">
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/3 DAW
                                <i class="bi bi-arrow-right">
                                </i>
                            </a>
                        </article>
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/Profesores
                                <i class="bi bi-arrow-right">
                                </i>
                            </a>
                        </article>
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/Apuntes de Bootstrap
                                <i class="bi bi-arrow-right">
                                </i> 
                            </a>
                        </article>
                        <article>
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <a class="enlace-repositorio m-2 my-1" href="#">IsmaelJ/Accesibilidad
                                <i class="bi bi-arrow-right">
                                </i>
                            </a>
                        </article>
                    </section>
                </section>
                <section id="actividad-reciente" class="my-lg-3">
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
                        <article class="contenedor-afectado-repositorio d-flex flex-column flex-sm-row align-items-stretch justify-content-between container-fluid py-2">
                            <div class="datos-repositorio d-flex flex-column text-truncate w-100">
                                <p>IsmaelJ/Apuntes Lola</p>
                                <p class="text-truncate">Apuntes para las asignaturas de Despliegue de Aplicaciones Web y Desarrollo Web en Entorno Servidor</p>
                            </div>
                            <form class="my-2 ms-sm-5">
                                <input type="submit" value="Ir al repositorio" class="btn btn-primary w-100"/>
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

                        <article class="contenedor-afectado-repositorio d-flex flex-column flex-sm-row align-items-stretch justify-content-between container-fluid py-2">
                            <div class="datos-repositorio d-flex flex-column text-truncate w-100">
                                <div class="d-flex align-content-center align-items-center">
                                    <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                                    <div class="usuario-completo d-flex flex-column text-truncate ps-3">
                                        <p>petorluj</p>
                                        <p class="text-truncate">Pedro Manuel Torres Luján</p>
                                        <p class="text-truncate">Profesor de Desarrollo Web en entorno Cliente en el IES Martín Rivero</p>
                                    </div>
                                </div>
                            </div>
                            <form class="my-2 ms-sm-5">
                                <input type="submit" value="Comenzar a seguir" class="btn btn-primary w-100"/>
                            </form>
                        </article>
                        <div class="stats d-flex flex-column flex-md-row justify-content-around pt-2 text-center">
                            <p class="py-2 py-sm-0 px-2">
                                <span class="num-repositorios">
                                    33
                                </span>
                                repositorio/s
                            </p>
                            <p class="py-2 py-sm-0 px-2">
                                <span class="num-seguidores">
                                    33
                                </span>
                                seguidor/es
                            </p>
                            <p class="py-2 py-sm-0 px-2">
                                <span class="num-reputacion">
                                    333
                                </span>
                                punto/s de reputación
                            </p>
                        </div>
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
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>