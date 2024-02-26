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
        <link rel="stylesheet" href="css/repositorio.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Inicio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Mi espacio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">2DAW (nombre repositorio)</li>
                </ol>
            </nav>
        </header>
        <main>
            <h1 class="text-center">2DAW (nombre repositorio)</h1>

            <div class="d-flex justify-content-around">
                <form action="opiniones.jsp" class="m-2 ms-5">
                    <button class="btn btn-success" type="submit">Opiniones</button>
                </form> 

                <form action="miEspacio.jsp" class="m-2 ms-5">
                    <button class="btn btn-success" type="submit">Mi Espacio</button>
                </form> 
            </div>

            <div class="col-12 container-fluid">
                <table class=" table table-striped table-success container-fluid">
                    <thead class="text-center">
                        <tr>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                            <th>Usuario</th>
                        </tr>
                    </thead>

                    <tbody class="table-group-divider">
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
                            <td><p >Fotos</p></td>
                            <td><p>Carpeta</p></td>
                            <td><p >11/04/2019 20:43</p></td>
                            <td><p >Fajardo</p></td>
                        </tr>
                         <tr>
                            <td><p >Fotos</p></td>
                            <td><p>Carpeta</p></td>
                            <td><p >11/04/2019 20:43</p></td>
                            <td><p >Fajardo</p></td>
                        </tr>
                         <tr>
                            <td><p >Fotos</p></td>
                            <td><p>Carpeta</p></td>
                            <td><p >11/04/2019 20:43</p></td>
                            <td><p >Fajardo</p></td>
                        </tr>
                         <tr>
                            <td><p >Fotos</p></td>
                            <td><p>Carpeta</p></td>
                            <td><p >11/04/2019 20:43</p></td>
                            <td><p >Fajardo</p></td>
                        </tr>
                        <!--Fin DEMO-->
                    </tbody>
                </table>            
            </div>
        </main>
        <jsp:include page="pie.jsp"/>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>