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
            $(function () {
                $("input[name='elegirArchivo']").on("change", function () {
                    if ($("#ficheros").css("display") === "block") {
                        $("#ficheros").fadeToggle(function () {
                            $("#carpetas").fadeToggle();
                        });
                    } else {
                        $("#carpetas").fadeToggle(function () {
                            $("#ficheros").fadeToggle();
                        });
                    }
                });

                $("#paso1fichero").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        $("#paso1fichero").addClass("valido");
                        $("#paso1fichero").removeClass("foco");
                        $("#paso2fichero").addClass("foco");
                    }
                });

                $("#paso1carpeta").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        $("#paso1carpeta").addClass("valido");
                        $("#paso1carpeta").removeClass("foco");
                        $("#paso2carpeta").addClass("foco");
                    }
                });
                $("#paso2carpeta").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        $("#paso2carpeta").addClass("valido");
                        $("#paso2carpeta").removeClass("foco");
                        $("#paso3carpeta").addClass("foco");
                    }
                });
                $("#paso3carpeta").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        $("#paso3carpeta").addClass("valido");
                        $("#paso3carpeta").removeClass("foco");
                    }
                });

            });

            function validarCampo(campo) {
                return true;
            }

            function resetearFicheros() {

            }

            function resetearCarpetas() {

            }
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
                                           href="miEspacio.jsp">
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
                                <form action="busquedas.jsp" class="d-flex align-items-center justify-content-center">
                                    <div class="input-group input-group-sm row">
                                        <label class="input-group-text col-2 ms-2"
                                               for="campoBusquedaPrincipal">Buscar</label>
                                        <input class="form-control col-4" type="search" placeholder="Búsqueda..."
                                               aria-label="Búsqueda" id="campoBusquedaPrincipal" />
                                        <input type="submit" value="Buscar" class="btn btn-sm btn-primary col-2 ms-2"/>
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
                    <li class="breadcrumb-item active" aria-current="page">Subida de archivos</li>
                </ol>
            </nav>
        </header>
        <main>

            <div class="container">
                <div class="row row-cols-2" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="elegirArchivo" id="subirFichero" autocomplete="off" checked>
                    <label class="btn btn-outline-primary" for="subirFichero">Fichero</label>
                    <input type="radio" class="btn-check" name="elegirArchivo" id="subirCarpeta" autocomplete="off">
                    <label class="btn btn-outline-primary" for="subirCarpeta">Carpeta</label>
                </div>
            </div>

            <div class="container my-5" id="ficheros">
                <h1 class="text-center">Subida de ficheros</h1>
                <form action="#">
                    <article id="paso1fichero">
                        <h2>1. Selecciona el repositorio</h2>
                        <div class="input-group">
                            <label for="elegirRepoFichero" class="input-group-text">Buscar</label>
                            <input class="form-control" list="opcionesDatalist" id="elegirRepoFichero">
                        </div>
                        <datalist id="opcionesDatalist">
                            <option value="2 DAW"></option>
                            <option value="Policía"></option>
                            <option value="Lucah"></option>
                        </datalist>
                    </article>
                    <article id="paso2fichero">
                        <h2>2. Selecciona el fichero</h2>
                        <input type="file" class="form-control" name="" id="elegirFicheroFichero" placeholder=""
                               aria-describedby="fileHelpId" />
                    </article>
                    <button type="submit" class="btn btn-primary my-3">Subir fichero</button>
                </form>
            </div>

            <div class="container my-5" id="carpetas">
                <h1 class="text-center">Subida de carpeta</h1>
                <form action="#">
                    <article id="paso1carpeta">
                        <h2>1. Selecciona el repositorio</h2>
                        <div class="input-group">
                            <label for="elegirRepoCarpeta" class="input-group-text">Buscar</label>
                            <input class="form-control" list="opcionesDatalist" id="elegirRepoCarpeta">
                        </div>
                    </article>
                    <section id="paso2carpeta">
                        <article>
                            <h2>2. Sube tu carpeta</h2>
                            <input type="file" class="form-control" name="" id="" placeholder=""
                                   aria-describedby="fileHelpId" />
                        </article>
                        <h2>o...</h2>
                        <article>
                            <h2>Crea tu carpeta</h2>
                            <input class="form-control" type=" search" placeholder="Nombre de la carpeta"
                                   aria-label="Búsqueda" id="nombreCarpeta" name="nombreCarpeta" />
                        </article>
                    </section>
                    <article id="paso3carpeta">
                        <h2>3. Elige el color de tu carpeta</h2>
                        <label for="colorCarpeta" class="form-label">Elige el color de la carpeta</label>
                        <input type="color" class="form-control form-control-color" id="colorCarpeta" value="#563d7c"
                               title="Choose your color">
                    </article>

                    <button type="submit" class="btn btn-primary mb-3">Crear carpeta</button>
                </form>
            </div>
        </main>
        <footer>
        </footer>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>