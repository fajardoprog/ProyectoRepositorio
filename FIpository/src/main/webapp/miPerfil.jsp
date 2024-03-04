<%-- 
    Document   : miPerfil
    Created on : 24 feb. 2024, 16:04:27
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
        <title>Mi perfil</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/miPerfil.css">


        <script src="js/jquery-3.7.1.min.js"></script>
        <script>

            $(document).ready(function () {
                $("#imgUsu").on("change", function () {
                    let file = this.files[0];
                    console.log(file);
                    $("#nombreFoto").text(file.name);
                });
            });

        </script>       
    </head>

    <body class="d-flex flex-column justify-content-between">
        <header>
           <jsp:include page="cabecera.jsp" />
            <!--Ver donde manda al pulsar Inicio-->
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Mi perfil</li>
                </ol>
            </nav>
        </header>
        <main class="d-flex flex-column align-items-center">
            <div class="container-fluid col-md-6 m-5 d-flex flex-column justify-content-center">
                <h1>Mi Perfil</h1>
                <form action="" class="d-flex flex-column align-items-center">

                    <div class="col-12 d-flex justify-content-around position-relative">
                        <input type="file" name="ImgUsu" id="imgUsu"/>

                        <img src="img/LogoFi.gif" alt="FotoPerfilUsu" id="fotoPer" class="w-40" for="imgUsu">

                        <div class="d-flex flex-column justify-content-center align-items-center position-absolute start-50">
                            <label class="material-symbols-outlined" for="imgUsu" id="labelImg"><span>add_circle</span></label>
                            <span id="nombreFoto"></span>
                        </div>
                    </div>

                    <label for="nicknameUsu" class="form-label">Nickname</label>
                    <input type="text" class="form-control" id="nicknameUsu" aria-describedby="nickname" name="nicknameUsu"
                           value="Evaristo97">

                    <div class="col-12 mt-3 mb-3 d-flex flex-column align-items-center separador" ><span></span></div>

                    <label for="nombreRealUsu" class="form-label">Nombre Usuario</label>
                    <input type="text" class="form-control" id="nombreUsuario" aria-describedby="nombre Usuario" name="nombreUsu"
                           value="Evaristo">

                    <label for="ape1Usu" class="form-label">1º Apellido</label>
                    <input type="text" class="form-control" id="ape1Usu" aria-describedby="ape1Usu" name="ape1Usu"
                           value="Díaz" readonly>

                    <label for="ape2Usu" class="form-label">2º Apellido</label>
                    <input type="text" class="form-control" id="ape2Usu" aria-describedby="ape2Usu" name="ape2Usu"
                           value="Pérez" readonly>

                    <div class="col-12 mt-3 mb-3 d-flex flex-column align-items-center separador" ><span></span></div>

                    <h4>Cambio contraseña</h4>
                    <label for="passUsu" class="form-label">Contraseña usuario</label>
                    <input type="password" class="form-control" id="passUsu" aria-describedby="contraseña del Usuario" name="passUsu"
                           value="Evaristo97">

                    <label for="repePass" class="form-label">Confirmar contraseña usuario</label>
                    <input type="password" class="form-control" id="repePass" aria-describedby="nombre Usuario" name="passUsuRepe"
                           value="Evaristo97">

                    <input type="submit" value="Confirmar cambios" class="btn btn-success m-3">
                </form>
            </div>


        </main>
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>