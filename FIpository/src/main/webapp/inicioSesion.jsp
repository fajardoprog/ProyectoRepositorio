<%-- 
    Document   : inicioSesion
    Created on : 24 feb. 2024, 16:03:42
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
        <title>Fipository</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/indexStyleBs.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <style>
            #registrarseForm {
                display: none;
            }

            #otroG {
                display: none;
            }

            #formularioIniciarSesi {
                display: flex;
            }
        </style>

        <script>
            $(function () {
                $("input[name='tipoFormulario']").on("change", function () {
                    if ($("#formularioIniciarSesi").css("display") === "flex") {
                        $("#formularioIniciarSesi").fadeToggle(function () {
                            $("#registrarseForm").fadeToggle().css("display", "flex");
                        });
                    } else {
                        $("#registrarseForm").fadeToggle(function () {
                            $("#formularioIniciarSesi").fadeToggle().css("display", "flex");
                        });
                    }

                });


                $("#seleccionGene").on("change", function () {
                    /*Esta parte sirve para mostrar la casilla para que el ususario especifique su genero*/
                    if ($(this).val() == 'O') {
                        $("#otroG").css("display", "flex");
                    } else {
                        $("#otroG").css("display", "none");
                    }
                });

            });
        </script>

    </head>

    <body class="d-flex flex-column justify-content-between">
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
                                    <li class="nav-item dropdown d-xl-flex w-100 align-items-center text-md-center">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
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
                                           href="misRepositorios.jsp">
                                            <span class="material-symbols-outlined mx-2">home</span>Mis repositorios
                                        </a>
                                    </li>
                                    <li class="nav-item w-50">
                                        <a class="nav-link d-flex flex-wrap align-items-center justify-content-center text-center"
                                           href="miEspacio.jsp">
                                            <span class="material-symbols-outlined mx-2">group</span>Compartido
                                            conmigo
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
                                <form class="d-flex align-items-center justify-content-center">
                                    <div class="input-group input-group-sm row">
                                        <label class="input-group-text col-2 ms-2"
                                               for="campoBusquedaPrincipal">Nombre</label>
                                        <input class="form-control col-4" type="search" placeholder="Búsqueda..."
                                               aria-label="Búsqueda" id="campoBusquedaPrincipal" />
                                        <button class="btn btn-sm btn-primary col-2 ms-2" type="submit">Buscar</button>
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
                    <li class="breadcrumb-item active" aria-current="page">Iniciar Sesión / Registro</li>
                </ol>
            </nav>
        </header>
        <!--Fin Header-->
        <!--Parte main-->
        <main class="container-fluid">

            <!--Seleccion de formulario-->
            <div class="container mb-2">
                <div class="row row-cols-2" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="tipoFormulario" id="inicioSesion" autocomplete="off"
                           checked>
                    <label class="btn btn-outline-primary" for="inicioSesion">Formulario iniciar sesión</label>
                    <input type="radio" class="btn-check" name="tipoFormulario" id="registrarse" autocomplete="off">
                    <label class="btn btn-outline-primary" for="registrarse">Formulario registrarse</label>
                </div>
            </div>
            <!--Fin Seleccion de formulario-->

            <!--Bloque formulario Iniciar Sesión-->
            <div class="flex-column align-items-md-center" id="formularioIniciarSesi">
                <form class="text-center  border border-black rounded col-md-6 " id="formu">

                    <h1 class="h3 mb-3 fw-normal m-3">Inicio Sesión</h1>

                    <div class="d-flex flex-column justify-content-around align-items-center">

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">person</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" id="floatingInput" placeholder="Usuario"
                                       name="nombreUsu">
                                <label for="floatingInput">Nombre Usuario</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11" id="floatingPassword"
                                       placeholder="Password" name="contraUsu">
                                <label for="floatingPassword">Contraseña</label>
                            </div>
                        </div>

                    </div>


                    <div class="d-flex flex-row justify-content-around m-3">
                        <input type="submit" class="btn btn-primary w-30 py-2 col-5" value="Iniciar sesion">
                    </div>

                    <a href="recuperaPass.html">¿Olvidaste tu contraseña?</a>

                    <p class="mt-5 mb-3 text-body-secondary">© FIpository</p>
                </form>
            </div>
            <!--Fin Bloque formulario Iniciar Sesión-->

            <!--Bloque formulario Registrar-->
            <div class=" flex-column align-items-md-center" id="registrarseForm">
                <form class="text-center  border border-black rounded col-md-6 " id="formu">

                    <h1 class="h3 mb-3 fw-normal m-3">Registrarse</h1>

                    <div class="d-flex flex-column justify-content-around align-items-center">

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">person</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" id="floatingInput" placeholder="Usuario"
                                       name="nombreUsu">
                                <label for="floatingInput">Nombre Usuario</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-1" id="floatingPassword"
                                       placeholder="Password" name="contraUsu">
                                <label for="floatingPassword">Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">refresh password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11" id="floatingPassword"
                                       placeholder="Password" name="contraUsuRepe">
                                <label for="floatingPassword">Repetir Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">mail</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="email" class="form-control col-11" id="floatingPassword" placeholder="email"
                                       name="emailUsu">
                                <label for="floatingPassword">Correo Electrónico</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">calendar_month</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="date" class="form-control col-11" id="floatingPassword"
                                       placeholder="Fecha nacimiento" name="fechaNaciUsu">
                                <label for="floatingPassword">Fecha de nacimiento</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">wc</span>
                            </div>

                            <div class="form-floating d-flex col-2 justify-content-around align-items-center col-10 m-2 ">
                                <select class="form-select" id="seleccionGene" aria-label="Floating label select example">
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
                                    <option value="O">Otro</option>
                                </select>
                                <label for="floatingSelect">Selecciona tu Género</label>
                            </div>
                        </div>

                        <div class="col-11 just ify-content-between align-items-center" id="otroG">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="text" class="form-control col-11" id="generoUsu" placeholder="Password"
                                       name="generoUsu">
                                <label for="generoUsu">Especifique su Género</label>
                            </div>
                        </div>

                    </div>

                    <div class="d-flex flex-row justify-content-around m-2">
                        <input type="submit" class="btn btn-primary w-30 py-2 col-5" value="Registrarme">
                    </div>
                </form>
                <p class="mt-5 mb-3 text-body-secondary">© FIpository</p>
            </div>
            <!--Fin Bloque formulario Registrar-->

        </main>


        <footer class="d-flex flex-wrap justify-content-around align-items-center py-3 my-4">
            <div class="col-md-4 d-flex align-items-center">
                <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
                    <svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                    </svg>
                </a>
                <span class="mb-3 mb-md-0 text-body-secondary">© FIpository Jose Antonio Ismael</span>
            </div>

            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="ms-3">
                    <a class="text-body-secondary" href="#">
                        <i class="bi bi-instagram"></i>
                    </a>
                </li>
                <li class="ms-3">
                    <a class="text-body-secondary" href="#">
                        <i class="bi bi-facebook"></i>
                    </a>
                </li>
                <li class="ms-3">
                    <a class="text-body-secondary" href="#">
                        <i class="bi bi-whatsapp"></i>
                    </a>
                </li>
            </ul>
        </footer>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>F
