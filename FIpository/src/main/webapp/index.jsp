<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página de inicio</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloIndex.css">
        <script>

        </script>
    </head>
    <body class="d-flex flex-column justify-content-between">
        <header>     
            <jsp:include page="ComprobacionInvitado"/>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item active" aria-current="page">Bienvenida</li>
                </ol>
            </nav>
        </header>
        <main  class="d-flex flex-column align-items-center">
            <h1 class="text-center">FIpository</h1>
            <h2 class="text-center">Tus Apuntes en la nube sin límites</h2>
            <img src="img/LogoFi.png" alt="Logo de la pagina web Fipository" class="img-fluid align-items-center" id="logoMain">
            <div class="d-flex col-12 justify-content-around mt-5">
                <form action="inicioSesion.jsp" method="get" class="align-items-center ">
                    <button class="btn btn-success px-3 py-2 px-sm-5 py-sm-3" type="submit" id="bIniciarSesion">Iniciar
                        Sesión</button>
                </form>
                <form action="inicioSesion.jsp" method="get" class="align-items-center">
                    <button class="btn btn-success px-3 py-2 px-sm-5 py-sm-3" type="submit"
                            id="Registrarse">Registrarse</button>
                </form>
            </div>
        </div>
    </main>
    <jsp:include page="pie.jsp" />
</body>
<script src="js/bootstrap.bundle.js"></script>
</html>