<%-- 
    Document   : log
    Created on : 24 feb. 2024, 16:04:15
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
        <title>Log</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloLog.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <!--Asignar enlaces una vez hecha la parte admin-->                
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="#">Administrador</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="#">Gestión de usuarios</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="#">Administración de un perfil</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Registro de usuario</li>
                </ol>
            </nav>
        </header>
        <div class="container">
            <main>
                <h1>Registro de acciones del usuario</h1>
                <section>
                    <table class="tabla-log table table-hover table-striped bg-white" id="tablaLog">
                        <tr>
                            <th>Usuario afectado</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                            <th>Descripción</th>
                        </tr>
                        
                         <tr>
                            <td>Evaristo</td>
                            <td>Inicio de sesión</td>
                            <td>24/12/2023 13:45hs</td>
                            <td>Evaristo ha iniciado sesión a las 13:45hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                        <tr>
                            <td>Evaristo</td>
                            <td>Creación de carpeta</td>
                            <td>24/12/2023 13:50hs</td>
                            <td>Evaristo ha iniciado sesión a las 13:50hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                          <tr>
                            <td>Evaristo</td>
                            <td>Eliminación de carpeta</td>
                            <td>24/12/2023 13:51hs</td>
                            <td>Evaristo ha iniciado sesión a las 13:51hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                        <tr>
                            <td>Evaristo</td>
                            <td>Creación de fichero</td>
                            <td>24/12/2023 13:52hs</td>
                            <td>Evaristo ha iniciado sesión a las 13:52hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                          <tr>
                            <td>Evaristo</td>
                            <td>Eliminación de fichero</td>
                            <td>24/12/2023 14:40hs</td>
                            <td>Evaristo ha iniciado sesión a las 14:40hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                        <tr>
                            <td>Evaristo</td>
                            <td>Reporte</td>
                            <td>24/12/2023 14:40hs</td>
                            <td>Evaristo ha iniciado sesión a las 14:40hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                           <tr>
                            <td>Evaristo</td>
                            <td>Puntuación</td>
                            <td>24/12/2023 14:40hs</td>
                            <td>Evaristo ha iniciado sesión a las 14:40hs del 24 de diciembre de 2023</td>
                        </tr>
                        
                        
                    </table>
                </section>
            </main>
        </div>

        <jsp:include page="pie.jsp"/>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>