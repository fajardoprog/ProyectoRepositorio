<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi perfil</title>       
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

    <body>
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
        <main>
            <div id="cotenedorForm">
                <h1>Mi Perfil</h1>
                <form action="ModificaPerfil" enctype="multipart/form-data" class="d-flex flex-column align-items-center" method="post" >

                    <div>
                        <input type="file" name="ImgUsuario" id="imgUsu" title="Imagen del usuario"/>

                        <img src="imgPerfilUsuario/${sessionScope.usuarioActual.foto}" alt="Foto Perfil del Usuario" id="fotoPer" class="w-40" for="imgUsu">

                        <div id="cambiaImage">
                            <label class="material-symbols-outlined" for="imgUsu" id="labelImg"><i class="bi bi-plus-circle-fill"></i></label>
                        </div>
                    </div>
                    <span id="nombreFoto"></span>
                    <label for="nicknameUsu" class="labelFormPer">Nickname</label>

                    <input type="text" class="inputForm" id="nicknameUsu" aria-describedby="nickname del usuario" name="nicknameUsu"
                           value="${sessionScope.usuarioActual.nombreUsuario}">

                    <div class="separadores"><span></span></div>

                    <label for="nombreRealUsu" class="labelFormPer">Nombre Usuario</label>
                    <input type="text" class="inputForm" id="nombreUsuario" aria-describedby="nombre del usuario si tiene 2 nombre ponga los 2" name="nombreUsu"
                           value="${sessionScope.usuarioActual.nombreCompleto}" readonly>

                    <label for="ape1Usu" class="labelFormPer">1º Apellido</label>
                    <input type="text" class="inputForm" id="ape1Usu" aria-describedby="Primer apellido del usuario" name="ape1Usu"
                           value="${sessionScope.usuarioActual.primerApellido}" readonly>

                    <label for="ape2Usu" class="labelFormPer">2º Apellido</label>
                    <input type="text" class="inputForm" id="ape2Usu" aria-describedby="Segundo apellido del usuario" name="ape2Usu"
                           value="${sessionScope.usuarioActual.segundoApellido}" readonly>

                    <div class="separadores" ><span></span></div>

                    <h2 class="fs-3">Cambio contraseña</h2>
                    <label for="passUsu" class="labelFormPer">Contraseña usuario</label>
                    <input type="password" class="form-control" id="passUsu" aria-describedby="contraseña del Usuario" name="passUsu"
                           value="${sessionScope.usuarioActual.passwordUsuario}">

                    <label for="repePass" class="labelFormPer">Confirmar contraseña usuario</label>
                    <input type="password" class="inputForm" id="repePass" aria-describedby="repetir la contraseña de antes para verificar el cambio de esta misma" name="passUsuRepe">

                    <input type="submit" value="Confirmar cambios" id="boton">
                </form>
            </div>


        </main>
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>