
<%-- 
    Document   : listaUsuarios
    Created on : 24 feb. 2024, 16:04:00
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
        <title>Lista usuarios</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloBusquedas.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script>
            $(function () {
                $(".lista-filtro button").on("click", function () {
                    cambiarFiltroBase($(this));
                });
            }
            );
            function cambiarFiltroBase($btn) {
                $(".lista-filtro button").find("i").remove();
                $("#filtro-base").text($btn.text());
                $btn.prepend($("<i>").addClass("bi bi-check-circle-fill mx-2"));
            }
        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Búsquedas</li>
                </ol>
            </nav>
        </header>
        <div class="container">
            <div class="row d-flex flex-column flex-lg-row g-0">

                <aside class="d-none d-lg-flex flex-column col-4 p-4">
                    <section>
                        <h3>Filtrar por</h3>
                        <ul class="list-group list-group-flush lista-filtro">
                            <li class="list-group-item bg-transparent">
                                <button type="button" class="btn btn-primary"  aria-current="true">
                                    Por repositorio
                                </button>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <button type="button" class="btn btn-primary">Por usuario</button>                              
                            </li>
                        </ul>
                    </section>
                    <section>
                        <h3>Ordenar por</h3>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item bg-transparent">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="reputacion">
                                    <label class="form-check-label mx-2" for="reputacion">Reputación</label>
                                </div>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="nVisitas">
                                    <label class="form-check-label mx-2" for="nVisitas">Nº de visitas</label>
                                </div>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="nArchivos">
                                    <label class="form-check-label mx-2" for="nArchivos">Nº de archivos</label>
                                </div>
                            </li>
                        </ul>
                    </section>
                </aside>

                <main class="offset-lg-1 col-lg-7">
                    <h1>Búsquedas</h1>
                    <section class="filtros d-flex flex-column justify-content-around">
                        <div class="d-flex flex-column flex-sm-row row-cols-sm-2 d-lg-none justify-content-around">


                            <div class="dropdown diferenciar-busqueda" >
                                <div class="pe-sm-2">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="filtro-base">
                                        Por repositorio
                                    </button>
                                    <ul class="dropdown-menu lista-filtro">
                                        <li><button class="dropdown-item" href="#">Por repositorio</button></li>
                                        <li><button class="dropdown-item" href="#">Por usuario</button></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="filtro-especifico">
                                <div class="ps-sm-2">
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filtroModal">
                                        Ordenar por
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="modal fade" id="filtroModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <form>
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Ordenar por</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="reputacion">
                                                        <label class="form-check-label" for="reputacion">Reputación</label>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="nVisitas">
                                                        <label class="form-check-label" for="nVisitas"> Nº de visitas</label>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="nArchivos">
                                                        <label class="form-check-label" for="nArchivos"> Nº de archivos</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                            <input type="submit" value="Guardar filtro" name="guardaFiltro" class="btn btn-primary"/>
                                            <input type="reset" value="Limpiar filtro" name="limpia" class="btn btn-primary"/>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!--Ventana modal-->
                        <div class="input-group form-floating my-3">
                            <i class="input-group-text bi bi-search"></i>
                            <div class="form-floating col">
                                <input type="text" class="form-control" id="floatingInputGroup1" placeholder="Username">
                                <label for="floatingInputGroup1" >Buscar que contengan</label>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Buscar">
                        </div>

                    </section>

                    <section class="container cartas">
                        <article class="card card-usuario">
                            <header class="card-header d-flex flex-column flex-lg-row align-items-stretch align-items-lg-center justify-content-lg-between">
                                <div class="d-flex align-items-center">
                                    <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                                    <div class="titulo-accion ps-md-3 p-3 p-md-1 ">
                                        <h5>petorluj</h5>
                                        <p>Última vez conectado: Hace 7 horas</p>
                                    </div>
                                </div>
                                <form>
                                    <input type="submit" value="Visitar perfil" class="btn btn-primary w-100"/>
                                </form>
                            </header>

                            <div class="datos-usuario d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center text-truncate">
                                    <div class="usuario-completo ps-3 text-truncate">
                                        <p>petorluj</p>
                                        <p class="text-truncate">Pedro Manuel Torres Luján</p>
                                        <p class="text-truncate">Profesor de Desarrollo Web en entorno Cliente en el IES Martín Rivero</p>
                                    </div>
                                </div>
                            </div>
                            <div class="stats d-flex justify-content-around pt-2 text-center align-items-stretch">
                                <p class="p-2 border bg-primary rounded-pill text-white badgeCentrado" >
                                    repositorio/s
                                    <span class="badge text-white bg-success ms-2">33</span>                                    
                                </p>

                                <p class="p-2 border bg-primary rounded-pill text-white badgeCentrado">
                                    seguidor/es
                                    <span class="badge text-white bg-success ms-2">33</span>                                    
                                </p>

                                 <p class="p-2 border bg-primary rounded-pill text-white badgeCentrado">
                                    punto/s de reputación
                                    <span class="badge text-white bg-success ms-2">33</span>                                    
                                </p>
                            </div>
                        </article>
                        <article class="card card-repositorio">
                            <header class="card-header d-flex flex-column flex-lg-row justify-content-between align-items-stretch align-content-lg-center px-3 px-md-3">
                                <div class="titulo-accion ps-3 justify-content-center">
                                    <h5>IsmaelJ/Apuntes Lola</h5>
                                    <p>Ultima modificación: Hace 7 horas</p>
                                </div>
                                <form class="d-flex align-items-center ">
                                    <input type="submit" value="Ir al repositorio" class="btn btn-primary w-100"/>
                                </form>
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
                            </article>
                        </article>
                    </section>
                </main>
            </div>
        </div>

        <jsp:include page="pie.jsp"/>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>