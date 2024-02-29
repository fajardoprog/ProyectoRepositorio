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
        <title>Perfil de: Juanma</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/otroPerfil.css">


        <script src="js/jquery-3.7.1.min.js"></script>
        <script>

            $(document).ready(function () {
                $("#imgUsu").on("change", function () {
                    let file = this.files[0];
                    console.log(file);
                    $("#nombreFoto").text(file.name);
                });
            });

        </script>       
    </head>

    <body class="d-flex flex-column justify-content-between">
        <header>
            <jsp:include page="cabecera.jsp" />
            <!--Ver donde manda al pulsar Inicio-->
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Perfil de: Juanma</li>
                </ol>
            </nav>
        </header>

        <h1>Espacio de: Juanma</h1>

        <!-- Modal -->
        <div class="modal fade" id="peticion" tabindex="-1" aria-labelledby="ventana Peticion" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" class="tituloModal">¿Quieres enviar una petición para ver el repositorio?</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-footer">
                        <form action="" class="d-flex justify-content-around w-100">
                            <div>
                                <input type="submit" class="btn btn-primary" value="Sí"/>
                            </div>

                            <div>
                                <input type="submit" class="btn btn-secondary" value="No"/>
                            </div>
                        </form>                                       
                    </div>
                </div>
            </div>
        </div>

        <!-- Atributos para que funcione la ventana modal->  data-bs-toggle="modal" data-bs-target="#peticion"-->
        <!-- Fin Vetana Modal-->

        <div class="container-fluid m-0 p-3 px-lg-5 d-lg-flex">
            <aside  id="mis-repositorios"  class="col-lg-4 p-4">
                <h3 class="p-0">Respositorios de: Juanma</h3>

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
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#" data-bs-toggle="modal" data-bs-target="#peticion">Juanma/1 DAW
                            <i class="bi bi-arrow-right"> <i class="bi bi-lock-fill"></i>
                            </i>
                        </a>


                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#">Juanma/1 DAW
                            <i class="bi bi-arrow-right"> 
                            </i>
                        </a>
                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#"  data-bs-toggle="modal" data-bs-target="#peticion">Juanma/Visibilidad
                            <i class="bi bi-arrow-right"> <i class="bi bi-lock-fill"></i>
                            </i>
                        </a>

                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#">Juanma/ApuntesDise
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#"  data-bs-toggle="modal" data-bs-target="#peticion">Juanma/Examenes
                            <i class="bi bi-arrow-right"> <i class="bi bi-lock-fill"></i>
                            </i>
                        </a>

                    </article>
                </section>
            </aside>

            <main class="offset-lg-1 col-lg-7">
                <h4>Información del repositorio</h4>
                <article class="card">
                    <h4 class="text-center">ApuntesDise</h4>
                    <div>
                        <h5>Media opiniones</h5>
                        <p>4.25/5</p>
                    </div>

                    <form action="opiniones.jsp" class="d-flex justify-content-end me-3">
                        <input type="submit" class="btn btn-primary botonOpiniones" value="Ver Opiniones"/>
                    </form>

                    <img src="img/4estrella.png" alt="nEstrellas"/>

                    <div>
                        <p>Permiso para ver el repositorio: Si </p>
                    </div>

                </article>

                <section id="intereses">
                    <header>
                        <h3>Quizá te interese basado en tus búsquedas</h3>
                    </header>
                    <!--TODO: Colocar artículos basados en tus búsquedas-->
                </section>
            </main>
        </div>

        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>