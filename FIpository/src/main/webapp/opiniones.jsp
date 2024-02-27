<%-- 
    Document   : opiniones
    Created on : 24 feb. 2024, 16:04:41
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
        <title>Opinion sobre "NombreRepositorio"</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloOpiniones.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Inicio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="repositorio.jsp">2DAW (nombre repositorio)</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Opiniones</li>
                </ol>
            </nav>
        </header>
        <main>

            <h1 class="m-3">2DAW (nombre repositorio)</h1>

            <section class="container-fluid">
                <!--Aquí van las opiniones-->
                <table class="table table-info">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Opinión</th>
                            <th>Fecha Opinión realizada</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>EricCartman21</td>
                            <td>"Me gusta mucho este Repositorio"</td>
                            <td>11/12/2023</td>
                        </tr>

                        <tr>
                            <td>Eva2342</td>
                            <td>"Me gusta mucho"</td>
                            <td>15/03/2023</td>
                        </tr>

                        <tr>
                            <td>Alvaro845</td>
                            <td>"Menos mal que encontré este repositorio"</td>
                            <td>10/05/2023</td>
                        </tr>

                        <tr>
                            <td>Vegetta777</td>
                            <td>"Sí , aunque aportaría otra cosa a tus apuntes"</td>
                            <td>05/11/2023</td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <div class="container-fluid d-flex flex-column align-content-center">
                
                <form action="opiniones.jsp" class="d-flex flex-column justify-content-center">
                    <div class="row justify-content-center">
                        <!--Aquí iran las estrellas-->
                        <img src="img/3estrella.png" alt="nEstrellas" class="col-6">
                    </div>

                    <div class="container-fluid row justify-content-center">
                        <input type="text" name="OpinionUsu" placeholder="Escribe tu opinión..." class="col-6 m-3 p-1"/>

                        <select class="col-4 m-3 p-1 text-center" aria-label="numero de estrellas">
                            <option selected>-- Vota --</option>
                            <option value="1">1 ☆</option>
                            <option value="2">2 ☆☆</option>
                            <option value="3">3 ☆☆☆</option>
                            <option value="3">4 ☆☆☆☆</option>
                            <option value="3">5 ☆☆☆☆☆</option>
                        </select>

                        <input type="submit" value="Subir mi Opinión" class="btn btn-primary m-3 p-1 col-6"/>
                    </div>                   
                </form>

                <form action="misOpiniones.jsp" class="d-flex">
                    <input type="submit" value="Ver mis opiniones" class="btn btn-secondary"/>
                </form>
            </div>

        </main>        
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>
</html>