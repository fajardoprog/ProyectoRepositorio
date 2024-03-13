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
        <link rel="stylesheet" href="css/estiloIndex.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="css/estiloRecuperaPass.css">

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
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="inicioSesion.jsp">Iniciar Sesión / Registro</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Recuperar contraseña</li>
                </ol>
            </nav>
        </header>
        <!--Fin Header-->
        <!--Parte main-->
        <main class="container-fluid">
            
            <!--Bloque formulario Recuperar contraseña-->
            <div class="d-flex flex-column align-items-md-center" id="formularioIniciarSesi">
                
                <h1 class="text-danger">${sessionScope.error}</h1>
                
                <form action="PeticionCambioPass" class="text-center  border border-black rounded col-md-8 formu p-4">

                    <h1 class="h3 mb-3 fw-normal m-3">Recuperar Contraseña</h1>

                    <div class="d-flex flex-column justify-content-around align-items-center">

                        <div class="col-11 d-flex justify-content-between align-items-center">
                            <div class="d-flex col-2 justify-content-around align-items-center">
                                <span class="material-symbols-outlined">person</span>
                            </div>

                            <div class="form-floating m-2 col-10">
                                <input type="text" class="form-control col-10" id="floatingInput" placeholder="Usuario"
                                       name="nombreUsuario">
                                <label for="floatingInput">Nickname Usuario</label>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary w-30 p-2 m-2 col-5">Cambiar Contraseña</button>

                    <p class="mt-5 mb-3 text-body-secondary">© FIpository</p>
                </form>
            </div>
            <!--Fin Bloque formulario Recuperar contraseña-->

        </main>


        <jsp:include page="pie.jsp" />
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>
