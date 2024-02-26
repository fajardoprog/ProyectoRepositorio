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
                $(".lista-filtro button").find("span").remove();
                $("#filtro-base").text($btn.text());
                $btn.prepend($("<span>").addClass("material-symbols-outlined").text("check"));
            }
        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page">Inicio</li>
                    <li class="breadcrumb-item active" aria-current="page">Búsquedas</li>
                </ol>
            </nav>
        </header>
        <div class="container-fluid">
            <aside class="d-none">

            </aside>
            <main>
                <h1>Búsquedas</h1>
                <section class="filtros d-flex flex-column justify-content-around">
                    <div class="d-flex justify-content-around">
                        <div class="dropdown diferenciar-busqueda" >
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="filtro-base">
                                Por repositorio
                            </button>
                            <ul class="dropdown-menu lista-filtro">
                                <li><button class="dropdown-item" href="#">Por repositorio</button></li>
                                <li><button class="dropdown-item" href="#">Por usuario</button></li>
                            </ul>
                        </div>

                        <div class="filtro-especifico">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filtroModal">
                                Filtros
                            </button>
                        </div>
                    </div>

                    <div>
                        <div class="form-floating my-3">
                            <input type="text" id="campoPrincipal" class="form-control" placeholder="Contengan">
                            <label id="labelCampoPrincipal" for="campoPrincipal">Búsqueda con filtros:</label>
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
                                                <li class="list-group-item">
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="nombre">
                                                        <label class="form-check-label" for="nombre">Nombre</label>
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
                    </div>
                </section>

                <section class="container cartas">
                    <article class="card card-usuario">
                        <header class="card-header d-flex align-items-center justify-content-around">
                             <img class="avatar-repositorio" src="img/LogoFi.png" alt="">
                            <div class="titulo-accion ps-md-3 p-3 p-md-1 ">
                                <h5>petorluj</h5>
                                <p>Última vez conectado: Hace 7 horas</p>
                            </div>
                             <form>
                                     <input type="submit" value="Comenzar a seguir" class="btn btn-success"/>
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
                    <article class="card card-repositorio">

                    </article>
                </section>

            </main>
        </div>
        <footer>
        </footer>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>