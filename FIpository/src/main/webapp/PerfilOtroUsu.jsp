<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver perfil de Juanma</title>
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

                const toastTrigger = document.getElementById('meGusta');
                const toastLiveExample = document.getElementById('liveToastMG');

                if (toastTrigger) {
                    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
                    toastTrigger.addEventListener('click', () => {
                        toastBootstrap.show();
                    });
                }
            });

        </script>       
    </head>

    <body class="d-flex flex-column justify-content-between">
        <header>
            <jsp:include page="cabecera.jsp" />
            <!--Ver donde manda al pulsar Inicio-->
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Perfil de: Juanma</li>
                </ol>
            </nav>
        </header>

        <h1 class="m-4">Espacio de: Juanma</h1>

        <!--Toast me gusta -->
        <div class="toast-container position-fixed bottom-0 end-0 p-3" id="toastMG">
            <div id="liveToastMG" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">¡Me gusta!</strong>
                    <small>hace un momento</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Cerrar" title="Cerrar Ventana notificacion"></button>
                </div>
                <div class="toast-body">
                    ¡Le has dado me gusta a este repositorio!
                </div>
            </div>
        </div>
        <!-- Fin Toast me gusta-->

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
                                <input type="submit" class="btn btn-primary" value="Sí" title="Aceptar y enviar peticion para ver el repositorio"/>
                            </div>

                            <div>
                                <input type="submit" class="btn btn-secondary" value="No" title="Rechazar y cerrar ventana"/>
                            </div>
                        </form>                                       
                    </div>
                </div>
            </div>
        </div>

        <!-- Atributos para que funcione la ventana modal->  data-bs-toggle="modal" data-bs-target="#peticion"-->
        <!-- Fin Vetana Modal-->



        <!-- Modal Warning -->

        <div class="modal fade" id="warningRep" tabindex="-1" aria-labelledby="ventana Peticion Reporte" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" class="tituloModal">Cuentanos más sobre tu reporte</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-footer">
                        <form action="" class="row d-flex justify-content-around w-100">
                            <div class="form-floating g-0">
                                <textarea class="form-control mb-4" placeholder="Motivo de tu reporte..." id="motivoRep" name="comentario" ></textarea>
                                <label for="motivoRep">Motivo de tu reporte...</label>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Enviar"/>
                        </form>                                       
                    </div>
                </div>
            </div>
        </div>

        <!-- Fin Modal Warning-->

        <div class="container-fluid m-0 p-3 px-lg-5 d-lg-flex">
            <aside  id="mis-repositorios"  class="col-lg-4 p-4">
                <h2 class="p-0 fs-3">Respositorios de: Juanma</h2>

                <article>
                    <form  class="form-floating mb-3">
                        <input type="text" class="form-control" name="busqueda-repositorios" id="busqueda-repositorios"
                               placeholder="" />
                        <label for="busqueda-repositorios">Buscar repositorio</label>
                    </form>
                </article>

                <section class="d-flex flex-column container-repositorios">
                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="imagen del usuario">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#" data-bs-toggle="modal" data-bs-target="#peticion">Juanma/1 DAW
                            <i class="bi bi-arrow-right"><i class="bi bi-lock-fill"></i></i>
                        </a>
                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="imagen del usuario">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#">Juanma/1 DAW
                            <i class="bi bi-arrow-right"> 
                            </i>
                        </a>
                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png"alt="imagen del usuario">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#"  data-bs-toggle="modal" data-bs-target="#peticion">Juanma/Visibilidad
                            <i class="bi bi-arrow-right"> <i class="bi bi-lock-fill"></i>
                            </i>
                        </a>

                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="imagen del usuario">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#">Juanma/ApuntesDise
                            <i class="bi bi-arrow-right">
                            </i>
                        </a>
                    </article>

                    <article>
                        <img class="avatar-repositorio" src="img/MiFoto.png" alt="imagen del usuario">
                        <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="#"  data-bs-toggle="modal" data-bs-target="#peticion">Juanma/Examenes
                            <i class="bi bi-arrow-right"> <i class="bi bi-lock-fill"></i>
                            </i>
                        </a>

                    </article>
                </section>
            </aside>

            <main class="offset-lg-1 col-lg-7">
                  <h2 class="fs-4">Información del repositorio</h2>

                <article class="card card-repositorio">
                    <header class="card-header d-flex flex-column flex-lg-row justify-content-between align-items-stretch align-content-lg-center px-3 px-md-3">
                        <div class="titulo-accion ps-3 justify-content-center">
                            <h3 class="fs-5">IsmaelJ/Apuntes Lola</h3>
                            <p>Ultima modificación: Hace 7 horas</p>
                        </div>

                        <!--boton reporte y like-->
                        <div class="text-end m-2">
                            <span class="me-1" id="meGusta"><i class="bi bi-heart"></i></span>
                            <span class="ms-1 me-2" id="warninBtn" data-bs-toggle="modal" data-bs-target="#warningRep"><i class="bi bi-exclamation-triangle-fill"></i></span>
                        </div> 
                        <!-- fin boton -->

                        <form class="d-flex align-items-center ">
                            <input type="submit" value="Ir al repositorio" class="btn btn-primary w-100"/>
                        </form>
                    </header>
                    <div class="d-flex flex-column">
                        <div class="contenedor-afectado-repositorio d-flex align-items-center justify-content-between container-fluid py-2">
                            <div class="datos-repositorio text-truncate">
                                <div class="d-flex">
                                    <p class="text-truncate d-inline mw-100">
                                        IsmaelJ/Apuntes Lola Casa Servidor casa lola casa lola casa lola juanma
                                    </p>
                                    <i class="mx-2 bi bi-lock-fill"></i>
                                </div>

                                <p class="text-truncate">
                                    Apuntes para las asignaturas de Despliegue de Aplicaciones Web y Desarrollo Web en Entorno Servidor
                                </p>
                            </div>
                        </div>
                        <div class="datos-opiniones d-flex flex-column">
                            <div class="datos-opiniones-numeros d-flex justify-content-between align-items-center">
                                <div>
                                    <h3 class="fs-5">Media opiniones</h3>
                                    <p>4.25/5</p>
                                </div>

                                <form action="opiniones.jsp" class="d-flex justify-content-end me-3">
                                    <input type="submit" class="btn btn-primary botonOpiniones" value="Ver Opiniones" title="Ver Opiniones de ese repositorio"/>
                                </form>
                            </div>
                            <img class="img-fluid" src="img/4estrella.png" alt="numero de Estrellas:4 estrellas"/>
                        </div>
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