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
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
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
            <article class="flex-column align-items-md-center" id="formularioIniciarSesi">
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

                    <a href="recuperaPass.jsp">¿Olvidaste tu contraseña?</a>

                    <p class="mt-5 mb-3 text-body-secondary">© FIpository</p>
                </form>
            </article>
            <!--Fin Bloque formulario Iniciar Sesión-->

            <!--Bloque formulario Registrar-->
            <article class=" flex-column align-items-md-center" id="registrarseForm">
                <form class="text-center  border border-black rounded col-md-6 " id="formu">

                    <h1 class="h3 mb-3 fw-normal m-3">Registrarse</h1>

                    <div class="d-flex flex-column justify-content-around align-items-center">

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">person</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Nombre Usuario"
                                       name="nicknameUsu">
                                <label for="floatingInput">Nombre Usuario</label>
                            </div>
                        </div>



                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">contacts</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Tu nombre"
                                       name="nombreUsu">
                                <label for="floatingInput">Tu nombre</label>
                            </div>
                        </div>



                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">contacts</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Primer apellido"
                                       name="ape1Usu" required="true">
                                <label for="floatingInput">Primer Apellido</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">contacts</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Segundo apellido"
                                       name="ape2Usu">
                                <label for="floatingInput">Segundo Apellido</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-1" 
                                       placeholder="Password" name="contraUsu">
                                <label for="floatingPassword">Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">refresh password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11" 
                                       placeholder="Password" name="contraUsuRepe">
                                <label for="floatingPassword">Repetir Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">mail</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="email" class="form-control col-11"  placeholder="email"
                                       name="emailUsu">
                                <label for="floatingPassword">Correo Electrónico</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">calendar_month</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="date" class="form-control col-11" 
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
            </article>
            <!--Fin Bloque formulario Registrar-->

        </main>


       <jsp:include page="pie.jsp"/>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>
