<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio de sesión o registro</title>       
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/estiloIndex.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="css/estiloInicioSesion.css">

        <script>
            $(function () {
                $("input[name='tipoFormulario']").on("change", function () {
                    if ($("#formularioIniciarSesi").css("display") === "flex") {
                        $("#formularioIniciarSesi").fadeToggle(function () {
                            $("#titulo-pagina").text("Registrarse");
                            $("#registrarseForm").fadeToggle().css("display", "flex");
                        });
                    } else {
                        $("#registrarseForm").fadeToggle(function () {
                            $("#titulo-pagina").text("Inicio de sesión");
                            $("#formularioIniciarSesi").fadeToggle().css("display", "flex");
                        });
                    }

                });


                $("#seleccionGene").on("change", function () {
                    /*Esta parte sirve para mostrar la casilla para que el ususario especifique su genero*/
                    if ($(this).val() == 'Otro') {
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
                    <li class="breadcrumb-item active" aria-current="page">Iniciar Sesión/Registro</li>
                </ol>
            </nav>
        </header>

        <!--Parte main-->
        <main class="container-fluid">
            <h1 class="m-3 text-center" id="titulo-pagina">Inicio de sesión</h1>
            <!--Seleccion de formulario-->
            <div class="container mb-4">
                <div class="row row-cols-2" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="tipoFormulario" id="inicioSesion" autocomplete="off"
                           checked>
                    <label class="btn btn-lg btn-outline-primary" for="inicioSesion">Formulario iniciar sesión</label>
                    <input type="radio" class="btn-check" name="tipoFormulario" id="registrarse" autocomplete="off">
                    <label class="btn btn-lg btn-outline-primary" for="registrarse">Formulario registrarse</label>
                </div>
            </div>
            <!--Fin Seleccion de formulario-->

            <!--Bloque formulario Iniciar Sesión-->
            <article class="flex-column align-items-md-center" id="formularioIniciarSesi">
                <form action="InicioSesion" class="text-center  border border-black rounded col-md-6 formu">

                    <h2 class="h3 mb-3 fw-normal m-3">Inicio Sesión</h2>

                    <div class="d-flex flex-column justify-content-around align-items-center">

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                               <i class="bi bi-person-fill"></i>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" id="floatingInput" placeholder="Usuario"
                                       name="nombreUsuario">
                                <label for="floatingInput">Nombre Usuario</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-key-fill"></i>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11" id="floatingPassword"
                                       placeholder="Password" name="password">
                                <label for="floatingPassword">Contraseña</label>
                            </div>
                        </div>

                    </div>


                    <div class="d-flex flex-row justify-content-around m-3">
                        <input type="submit" class="btn btn-primary w-30 py-2" value="Iniciar sesion">
                    </div>

                    <a href="recuperaPass.jsp">¿Olvidaste tu contraseña?</a>

                    <p class="mt-5 mb-3 text-body-secondary">© FIpository</p>
                </form>
            </article>
            <!--Fin Bloque formulario Iniciar Sesión-->

            <!--Bloque formulario Registrar-->
            <article class=" flex-column align-items-lg-center" id="registrarseForm">
                <p>${requestScope.mensajeError}</p>
                <form action="Registro" method="post" class="text-center  border border-black rounded col-lg-6 formu" enctype="multipart/form-data">

                    <h2 class="h3 mb-3 fw-normal m-3">Registrarse</h2>

                    <div class="d-flex flex-column justify-content-around align-items-center">


                        <div class="d-flex justify-content-end align-items-center container-fluid">
                            <div class="mb-3 col-11">
                                <label for="fotoPerfil" class="form-label">Tu foto perfil: </label>
                                <input class="form-control" type="file" id="fotoPerfil" name="fotoUsu">
                            </div>
                        </div>


                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                               <i class="bi bi-file-person-fill"></i>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Nombre Usuario"
                                       name="nombreUsuario">
                                <label for="floatingInput">Nombre Usuario</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-person-vcard-fill"></i>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Tu nombre"
                                       name="nombreCompleto">
                                <label for="floatingInput">Tu nombre</label>
                            </div>
                        </div>



                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-person-vcard-fill"></i>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Primer apellido"
                                       name="primerApellidoUsuario" required="true">
                                <label for="floatingInput">Primer Apellido</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-person-vcard-fill"></i>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-11" placeholder="Segundo apellido"
                                       name="segundoApellidoUsuario">
                                <label for="floatingInput">Segundo Apellido</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                               <i class="bi bi-key-fill"></i>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-1" 
                                       placeholder="Password" name="passwordUsuario">
                                <label for="floatingPassword">Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                               <i class="bi bi-key-fill"></i>
                               <i class="bi bi-arrow-clockwise"></i>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11" 
                                       placeholder="Password" name="passwordUsuarioRepetida">
                                <label for="floatingPassword">Repetir Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-envelope-at-fill"></i>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="email" class="form-control col-11"  placeholder="email"
                                       name="correoUsuario">
                                <label for="floatingPassword">Correo Electrónico</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-calendar-fill"></i>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="date" class="form-control col-11" 
                                       placeholder="Fecha nacimiento" name="fechaNacimientoUsuario">
                                <label for="floatingPassword">Fecha de nacimiento</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <i class="bi bi-person-standing"></i>
                            </div>

                            <div class="form-floating d-flex col-2 justify-content-around align-items-center col-10 m-2 ">
                                <select name="generoUsuario" class="form-select" id="seleccionGene" aria-label="Floating label select example">
                                    <option value="Hombre">Hombre</option>
                                    <option value="Mujer">Mujer</option>
                                    <option value="Otro">Otro</option>
                                </select>
                                <label for="floatingSelect">Selecciona tu Género</label>
                            </div>
                        </div>

                        <div class="col-11 align-items-center" id="otroG">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="text" class="form-control col-11" id="generoUsu" placeholder="Password"
                                       name="otroGenero">
                                <label for="generoUsu">Especifique su Género</label>
                            </div>
                        </div>


                        <div class="d-flex flex-row col-12 justify-content-between align-items-center container-fluid mt-2">

                            <div class="d-flex align-items-center col-2 justify-content-center">
                                <i class="bi bi-info-circle"></i>
                            </div>
                            
                            <div class="form-floating g-1 col-10">
                                <textarea class="form-control" placeholder="pequeña Descrición tuya..." name="descripcionUsu" id="descripcion"></textarea>
                                <label for="descripcion">Pequeña descripción tuya...</label>
                            </div>
                        </div>

                        <div class="d-flex flex-row justify-content-around m-2">
                            <input type="submit" class="btn btn-primary py-2" value="Registrarme" name="registrarse">
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
