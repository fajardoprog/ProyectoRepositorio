<%-- 
    Document   : subida
    Created on : 24 feb. 2024, 16:05:15
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
        <title>Subida de ficheros</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/estiloSubida.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <style>
            #carpetas {
                display: none;
            }
        </style>
        <script>
            
        </script>

    </head>

 
    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Inicio</a></li>                    
                    <li class="breadcrumb-item active" aria-current="page">Subida de archivos</li>
                </ol>
            </nav>
        </header>
               <jsp:include page="CreacionRepositorio"/>
        <main>
            <h1>Creación de repositorios</h1>
            <div class="container" id="reposiotrio">
                <div class="row">
                    <div class="offset-lg-2 col-lg-8">
                        <h2 class="text-center">Crea ahora tu repositorio</h2>

                        <div class="barra-progresion position-relative m-4">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar"></div>
                            </div>
                            <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill">1</button>
                            <button type="button" class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-secondary rounded-pill" >2</button>
                            <button type="button" class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill">3</button>
                        </div>

                        <form action="crearRepositorio.jsp" method="post" class="d-flex flex-column d-md-block">
                            <article id="paso1fichero">
                                <h3 class="my-3">1. Escribe el nombre tu repositorio</h3>
                                <div class="input-group">
                                    <label for="nombreRepositorio" class="input-group-text">Introduce el nombre</label>
                                    <input class="form-control" type="text" id="nombreRepositorio" name="nombreRepositorio">
                                </div>
                            </article>
                            <hr class="hr" />
                            <article id="paso2fichero">
                                <h3 class="my-3">2. Elige la visibilidad</h3>
                                <section class="row row-cols-2 p-3 container-archivos">
                                    <div>
                                        <input type="radio" class="btn-check" name="visibilidad" value="publico" id="success-outlined" autocomplete="off" checked>
                                        <label class="btn btn-outline-success" for="success-outlined"><span>Checked success radio</span></label>
                                    </div>

                                    <div>
                                        <input type="radio" class="btn-check" name="visibilidad" value="privado" id="danger-outlined" autocomplete="off">
                                        <label class="btn btn-outline-danger" for="danger-outlined"><span>Checked success radio</span></label>
                                    </div>
                                </section>
                            </article>
                            <hr class="hr" />
                            <article id="paso3fichero">
                                <h3 class="my-3">3. Introduce una descripción</h3>
                                 <div class="input-group">
                                    <label for="descripcionRepositorio" class="input-group-text">Recomendamos una breve descripción</label>
                                    <input class="form-control" type="text" id="descripcionRepositorio" name="descripcionRepositorio">
                                </div>
                            </article>
                            <hr class="hr" />
                            <button type="submit" class="btn btn-primary my-3 align-items-center">Crear repositorio</button>
                        </form>
                    </div>
                </div>
            </div>

        </main>
        <jsp:include page="pie.jsp"/>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>