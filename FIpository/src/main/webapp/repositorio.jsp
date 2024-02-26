<%-- 
    Document   : repositorio
    Created on : 24 feb. 2024, 16:05:03
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
        <title>Datos del repositorio</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">2DAW (nombre repositorio)</li>
                </ol>
            </nav>
        </header>
        <main>
            <h1 class="text-center">2DAW (nombre repositorio)</h1>

            <form action="opiniones.jsp" class="m-2 ms-5">
                <button class="btn btn-success" type="submit">Opiniones</button>
            </form> 


            <div class="d-flex flex-column align-items-center container-fluid p-4 container-fluid">


                <table class="col-12 m-2 table table-striped table-success">
                    <tr>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Fecha</th>
                        <th>Usuario</th>
                    </tr>

                    <!--Esto sería una fila completa-->
                    <tr>
                        <td>Factura</td>
                        <td>PDF</td>
                        <td>10/10/2010 13:59</td>
                        <td>YO</td>
                    </tr>
                    <!--Fin fila completa-->

                    <!--Ejemplos DEMO BORRAR Despues-->
                    <tr>
                        <td>Fotos</td>
                        <td>Carpeta</td>
                        <td>11/04/2019 20:43</td>
                        <td>Fajardo</td>
                    </tr>

                    <tr>
                        <td>ApuntesDiseño</td>
                        <td>PDF</td>
                        <td>12/05/2021 14:00</td>
                        <td>YO</td>
                    </tr>

                    <tr>
                        <td>ApuntesProg</td>
                        <td>Carpeta</td>
                        <td>22/05/2023</td>
                        <td>YO</td>
                    </tr>
                    <!--Fin DEMO-->
                </table>
            </div>

        </main>
        <footer>
        </footer>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>