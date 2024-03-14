<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Opinion sobre "nombreRepositorio"</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloOpiniones.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="repositorio.jsp">2DAW (nombre repositorio)</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Opiniones</li>
                </ol>
            </nav>
        </header>
        <main>

            <h1 class="m-4">2DAW (nombre repositorio)</h1>

            <section class="container-opiniones row row-cols-1 row-cols-md-2 row-cols-xl-3 row container-fluid justify-content-center g-0 ">
                <!--Aquí van las opiniones-->

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between p-3">
                            <img src="img/images.jfif" alt="Puntuación de 1,5 estrella o estrellas" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="Foto de FajardoProg" class="rounded-circle img-thumbnail"/>
                            <h5>FajardoProg</h5>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif"  alt="Puntuación de 1,5 estrella o estrellas" class="d-none d-xl-block img-fluid"/>
                            <h5>Comentario</h5>
                            <p>"Me gusta mucho este Repositorio"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>11/12/2023</p>
                        </div>
                    </article>
                </div>

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between p-3">
                            <img src="img/images.jfif" alt="Puntuación de 1,5 estrella o estrellas" class="d-block d-xl-none img-fluid"/>
                            <img src="img/ismael3.JPG" alt="Foto de Ismael" class="rounded-circle img-thumbnail"/>
                            <h5>Ismael</h5>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif"  alt="Puntuación de 1,5 estrella o estrellas" class="d-none d-xl-block img-fluid"/>
                            <h5>Comentario</h5>
                            <p>"Me gusta mucho entre 0 y nada"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>12/12/2023</p>
                        </div>
                    </article>
                </div>

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between p-3">
                            <img src="img/images.jfif" alt="Puntuación de 1,5 estrella o estrellas" class="d-block d-xl-none img-fluid"/>
                            <img src="img/juanma.JPG" alt="Foto de Juanma" class="rounded-circle img-thumbnail"/>
                            <h5>Juanma</h5>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif"  alt="Puntuación de 1,5 estrella o estrellas" class="d-none d-xl-block img-fluid"/>
                            <h5>Comentario</h5>
                            <p>"Este proyecto está pepino, os voy a tener que poner un 10"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>14/12/2023</p>
                        </div>
                    </article>
                </div>

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between p-3">
                            <img src="img/images.jfif" alt="Puntuación de 1,5 estrella o estrellas" class="d-block d-xl-none img-fluid"/>
                            <img src="img/pedro.JPG" alt="Foto de petorluj" class="rounded-circle img-thumbnail"/>
                            <h5>petorluj</h5>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif"  alt="Puntuación de 1,5 estrella o estrellas" class="d-none d-xl-block img-fluid"/>
                            <h5>Comentario</h5>
                            <p>"Bah, no habéis implementado AJAX"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>15/12/2023</p>
                        </div>
                    </article>
                </div>

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between p-3">
                            <img src="img/images.jfif" alt="Puntuación de 1,5 estrella o estrellas" class="d-block d-xl-none img-fluid"/>
                            <img src="img/lola.JPG" alt="Foto de LaLola" class="rounded-circle img-thumbnail"/>
                            <h5>LaLola</h5>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif"  alt="Puntuación de 1,5 estrella o estrellas" class="d-none d-xl-block img-fluid"/>
                            <h5>Comentario</h5>
                            <p>"Ahorrad energías"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>16/12/2023</p>
                        </div>
                    </article>
                </div>
            </section>
            <form action="miEspacio.jsp" class="text-center row g-0">               
                <input type="submit" class="btn btn-primary offset-1 col-10 offset-sm-2 col-sm-8" value="Volver al Inicio" title="Volver a tu perfil del usuario"/>
            </form>
        </main>        
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>
</html>