<%-- 
    Document   : recuperaPass
    Created on : 24 feb. 2024, 16:04:48
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

        </style>

        <script>
            $(function () {

            });
        </script>

    </head>

    <body class="d-flex flex-column justify-content-between">
        <!--Header de la pagina donde se encuentra el menu-->
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Inicio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="inicioSesion.jsp">Iniciar Sesión / Registro</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Recuperar contraseña</li>
                </ol>
            </nav>
        </header>
        <!--Fin Header-->
        <!--Parte main-->
        <main class="container-fluid">
            <!--Bloque formulario Iniciar Sesión-->
            <div class="d-flex flex-column align-items-md-center" id="formularioIniciarSesi">
                <form class="text-center  border border-black rounded col-md-6 " id="formu">

                    <h1 class="h3 mb-3 fw-normal m-3">Recuperar Contraseña</h1>

                    <div class="d-flex flex-column justify-content-around align-items-center">

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">person</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="mail" class="form-control col-11 m-1" id="floatingInput" placeholder="Usuario"
                                       name="EmailUsu">
                                <label for="floatingInput">Correo Usuario</label>
                            </div>
                        </div>


                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11 m-1" id="floatingPassword1"
                                       placeholder="Password" name="NuevacontraUsu">
                                <label for="floatingPassword1">Contraseña</label>
                            </div>
                        </div>

                        <div class="col-11 d-flex just ify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">refresh password</span>
                            </div>

                            <div class="form-floating m-2 align-items-center col-10">
                                <input type="password" class="form-control col-11 m-1" id="floatingPassword2"
                                       placeholder="Password" name="NuevacontraUsuRepe">
                                <label for="floatingPassword2">Repetir Contraseña</label>
                            </div>
                        </div>

                    </div>


                    <div class="d-flex flex-row justify-content-around m-3">
                        <input type="submit" class="btn btn-primary w-30 py-2 col-5" value="Cambiar Contraseña">
                    </div>

                    <p class="mt-5 mb-3 text-body-secondary">© FIpository</p>
                </form>
            </div>
            <!--Fin Bloque formulario Iniciar Sesión-->

        </main>


        <jsp:include page="pie.jsp" />
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>
