<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Datos del repositorio</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloRepositorio.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/peticionesAjax/PeticionesAjax.js"></script>
        <script>

            $(document).ready(function () {


                let nombreRepositorio = $("#repo-seleccionado").text();
                recuperarArchivosRepositorio(nombreRepositorio);

            }
            );

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Inicio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${param.repositorio}</li>
                </ol>
            </nav>
        </header>
        <main>
            <h1 id="repo-seleccionado" class="text-center">${param.repositorio}</h1>

            <div class="row container-botones row-cols-3 justify-content-around g-0">
                <form action="opiniones.jsp" class="p-3">
                    <button class="btn btn-success w-100" type="submit">Opiniones</button>
                </form> 
                <div class="p-3">
                    <button type="button" class="btn btn-success w-100" data-bs-toggle="modal" data-bs-target="#modalComentario">
                        Añadir opinión
                    </button>
                </div>


                <div class="modal fade" id="modalComentario" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Añade tu opinión</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form class="p-3">
                                <div class="modal-body container-fluid">
                                    <div class="row justify-content-center">
                                        <div class="form-floating g-0">
                                            <textarea class="form-control" placeholder="Leave a comment here" id="comentario" name="comentario" ></textarea>
                                            <label for="floatingTextarea2">Escribe tu comentario</label>
                                        </div>
                                        <select class="form-select form-select-lg col-10 my-3" aria-label="numero de estrellas">
                                            <option selected>-- Vota --</option>
                                            <option value="1">1 ☆</option>
                                            <option value="2">2 ☆☆</option>
                                            <option value="3">3 ☆☆☆</option>
                                            <option value="3">4 ☆☆☆☆</option>
                                            <option value="3">5 ☆☆☆☆☆</option>
                                        </select>
                                    </div>   
                                </div>
                                <div class="modal-footer p-0">
                                    <input type="reset" value="Limpiar formulario" class="btn btn-secondary" data-bs-dismiss="modal">
                                    <input type="submit" value="Enviar opinión" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <form action="miEspacio.jsp" class="p-3">
                    <button class="btn btn-success w-100" type="submit">Mi Espacio</button>
                </form> 
            </div>

            <div class="container-fluid">
                <table id="formato-tabla" class="d-none d-lg-block table tabla-repositorio table-responsive table-striped bg-light">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                            <th >Usuario</th>
                        </tr>
                    </thead>

                    <tbody class="table-group-divider">

                        <!--Fin DEMO-->
                    </tbody>
                </table>
                <div class="container" id="formato-cartas">
                    <section class="row  d-flex d-lg-none row-cols-1 row-cols-sm-2 row-cols-lg-4 g-0">


                    </section>
                </div>

            </div>
        </main>
        <jsp:include page="pie.jsp"/>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>