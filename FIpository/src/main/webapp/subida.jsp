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
        <!-- Importo por el reseteo de bootstrap y los iconos -->

        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/estiloSubida.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/peticionesAjax/PeticionesAjax.js"></script>
        <style>
            #carpetas {
                display: none;
            }
        </style>
        <script>
            var opcionesRepositorios = [];
            var carpetasFicheros = [];
            $(function () {
                $("input[name='elegirArchivo']").on("change", function () {
                    if ($("#ficheros").css("display") === "block") {
                        $("label[for='subirFichero']").toggleClass("radio-seleccionado");
                        $("label[for='subirCarpeta']").toggleClass("radio-seleccionado");
                        $("#ficheros").fadeToggle(function () {
                            $("#carpetas").fadeToggle();
                        });
                    } else {
                        $("label[for='subirFichero']").toggleClass("radio-seleccionado");
                        $("label[for='subirCarpeta']").toggleClass("radio-seleccionado");
                        $("#carpetas").fadeToggle(function () {
                            $("#ficheros").fadeToggle();
                        });
                    }
                });

                $("#paso1fichero").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        if (!$("#paso1fichero h3").hasClass("valido")) {
                            $("#paso1fichero h3").addClass("valido").append($("<i>").addClass("bi bi-check-circle-fill mx-2"));
                        }
                        $("#paso1fichero h3").removeClass("foco");
                        $("#paso2fichero h3").addClass("foco");
                    }
                });

                $("#paso1carpeta").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        if (!$("#paso1carpeta h3").hasClass("valido")) {
                            $("#paso1carpeta h3").addClass("valido").append($("<i>").addClass("bi bi-check-circle-fill mx-2"));
                        }
                        $("#paso1carpeta h3").removeClass("foco");
                        $("#paso2carpeta h3").addClass("foco");
                    }
                });
                $("#paso2carpeta").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        if (!$("#paso2carpeta h3").hasClass("valido")) {
                            $("#paso2carpeta h3").addClass("valido").append($("<i>").addClass("bi bi-check-circle-fill mx-2"));
                        }
                        $("#paso2carpeta h3").removeClass("foco");
                        $("#paso3carpeta h3").addClass("foco");
                    }
                });
                $("#paso3carpeta").on("blur", "input", function () {
                    if (validarCampo($(this))) {
                        if (!$("#paso3carpeta h3").hasClass("valido")) {
                            $("#paso3carpeta h3").addClass("valido").append($("<i>").addClass("bi bi-check-circle-fill mx-2"));
                        }
                        $("#paso3carpeta h3").removeClass("foco");
                    }
                });


                $("#opcionesDatalist option").each(function () {
                    opcionesRepositorios.push($(this)[0].value);
                });


                $("#elegirRepoFichero").on("input", function (ev) {
                    if (opcionesRepositorios.indexOf($(this)[0].value) >= 0) {
//                         <div>
                        //                                <input type="radio" class="btn-check" name="carpetaElegida" id="success-outlined" autocomplete="off" checked>
                        //                                <label class="btn btn-outline-success" for="success-outlined"><span>Checked success radio</span></label>
                        //                          </div>
                        $("#container-carpetas").empty();
                        $("#container-carpetas").append($("<div>").append($("<input>").attr({
                            type: "radio",
                            class: "btn-check",
                            name: "carpetaElegida",
                            id: "raiz",
                            autocomplete: "off"
                        })).addClass("container-carpetas-fichero").append($("<label>").attr({
                            class: "btn btn-outline-success",
                            for : "raiz"
                        }).append("<span>").text("/")));
                        recuperarCarpetasRepositorio($(this)[0].value);
                    } else {
                        console.log("el nombre no se encuentra en la lista");
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
            <jsp:include page="cabecera.jsp" />
            <jsp:include page="/CargaDatosFichCarp"/>
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>                    
                    <li class="breadcrumb-item active" aria-current="page">Subida de archivos</li>
                </ol>
            </nav>
        </header>
        <main >
            <h1>Subida de archivos</h1>
            <div class="container-botones">
                <div role="group" aria-label="Cambiar entre subir fichero y carpeta">
                    <input type="radio" name="elegirArchivo" id="subirFichero" autocomplete="off" checked>
                    <label class="radio-seleccionado" for="subirFichero">Fichero</label>
                    <input type="radio" name="elegirArchivo" id="subirCarpeta" autocomplete="off">
                    <label for="subirCarpeta">Carpeta</label>
                </div>
            </div>

            <div id="ficheros">
                <div>
                    <div>
                        <h2>Subida de ficheros</h2>

                        <div class="barra-progresion position-relative m-4">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar"></div>
                            </div>
                            <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill">1</button>
                            <button type="button" class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-secondary rounded-pill" >2</button>
                            <button type="button" class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill">3</button>
                        </div>

                        <form action="SubidaArchivos" method="post" enctype="multipart/form-data">
                            <article id="paso1fichero">
                                <h3>1. Selecciona el repositorio</h3>
                                <div class="container-input-texto">
                                    <label for="elegirRepoFichero"><span>Buscar</span></label>
                                    <input list="opcionesDatalist" id="elegirRepoFichero" name="elegirRepoFichero">
                                </div>
                                <datalist id="opcionesDatalist">
                                    <c:forEach items="${requestScope.listaDirectorios}" var="directorio">
                                        <option value="${directorio}"></option>
                                    </c:forEach>
                                </datalist>
                            </article>
                            <hr class="hr" />
                            <article id="paso2fichero">
                                <h3 class="my-3">2. Selecciona la carpeta</h3>
                                <section class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 p-3 container-archivos" id="container-carpetas">
                                    <div class="container-carpetas-fichero">
                                        <input type="radio" class="btn-check" name="carpetaElegida" id="success-outlined" autocomplete="off" checked>
                                        <label class="btn btn-outline-success" for="success-outlined"><span>Checked success radio</span></label>
                                    </div>
                                    <div class="container-carpetas-fichero">
                                        <input type="radio" class="btn-check" name="carpetaElegida" id="success-outlined" autocomplete="off" checked>
                                        <label class="btn btn-outline-success" for="success-outlined"><span>Checked success radio</span></label>
                                    </div>
                                    <div class="container-carpetas-fichero">
                                        <input type="radio" class="btn-check" name="carpetaElegida" id="success-outlined" autocomplete="off" checked>
                                        <label class="btn btn-outline-success" for="success-outlined"><span>Checked success radio</span></label>
                                    </div>
                                    <div class="container-carpetas-fichero">
                                        <input type="radio" class="btn-check" name="carpetaElegida" id="success-outlined" autocomplete="off" checked>
                                        <label class="btn btn-outline-success" for="success-outlined"><span>Checked success radio</span></label>
                                    </div>

                                </section>
                            </article>
                            <hr class="hr" />
                            <article id="paso3fichero">
                                <h3 class="my-3">3. Selecciona el fichero</h3>
                                <input type="file" class="form-control" name="elegirFicheroFichero" id="elegirFicheroFichero" placeholder=""
                                       aria-describedby="fileHelpId" />
                            </article>
                            <hr class="hr" />
                            <input value="Subir fichero" type="submit" class="btn btn-primary my-3 align-items-center"/>
                        </form>
                    </div>
                </div>
            </div>

            <div class="container" id="carpetas">
                <div class="row">
                    <div class="offset-lg-2 col-lg-8">
                        <h2 class="text-center">Subida de carpeta</h2>

                        <div class="barra-progresion position-relative m-4">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar"></div>
                            </div>
                            <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill">1</button>
                            <button type="button" class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-secondary rounded-pill">2</button>
                            <button type="button" class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill">3</button>
                        </div>

                        <form action="SubidaCarpetas" class="d-flex flex-column d-md-block" method="post" enctype="multipart/form-data">
                            <article id="paso1carpeta">
                                <h3 class="my-2">1. Selecciona el repositorio</h3>
                                <div class="input-group">
                                    <label for="elegirRepoCarpeta" class="input-group-text">Buscar</label>
                                    <input class="form-control" list="opcionesDatalist" id="elegirRepoCarpeta" name="elegirRepoCarpeta">
                                </div>
                            </article>
                            <hr class="hr" />
                            <section id="paso2carpeta">
                                <article>
                                    <h3 class="my-2">2. Sube tu carpeta o crea tu carpeta</h3>
                                    <section class="row row-cols-1 row-cols-sm-2">
                                        <div>
                                            <input type="file" multiple="multiple" class="form-control" name="carpetaSeleccionada" id="carpetaSeleccionada" placeholder=""
                                                   webkitdirectory mozdirectory msdirectory odirectory directory>
                                            <!--onchange="selectFolder(event);"-->
                                        </div>
                                        <div>
                                            <input class="form-control" type=" search" placeholder="Nombre de la carpeta"
                                                   aria-label="Nombre de la carpeta" id="nombreCarpeta" name="nombreCarpeta" />
                                        </div>
                                    </section>

                                </article>
                            </section>
                            <hr class="hr" />
                            <article id="paso3carpeta">
                                <h3 class="my-2">3. Elige el color de tu carpeta</h3>
                                <label for="colorCarpeta" class="form-label">Elige el color de la carpeta</label>
                                <input type="color" class="form-control form-control-color m-2" id="colorCarpeta" value="#000000"
                                       title="Selecciona el color" name="colorCarpeta">
                            </article>
                            <hr class="hr" />
                            <button type="submit" class="btn btn-primary mb-3 align-items-center">Crear carpeta</button>
                        </form>
                    </div>


                </div>
            </div>
        </main>
        <jsp:include page="pie.jsp"/>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>