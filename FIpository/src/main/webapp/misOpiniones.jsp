<%-- 
    Document   : misOpiniones
    Created on : 26 feb. 2024, 18:44:49
    Author     : IsmaelJJL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis opiniones</title>
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
                    <li class="breadcrumb-item" aria-current="page"><a href="miEspacio.jsp">Inicio</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="repositorio.jsp">2DAW (nombre repositorio)</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="opiniones.jsp">Opiniones</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Mis Opiniones</li>
                </ol>
            </nav>
        </header>
        <main>

            <h1>Mis opiniones</h1>
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
                            <td>Tú</td>
                            <td>"Me gusta mucho este Repositorio"</td>
                            <td>11/12/2023</td>
                        </tr>
                        
                        <tr>
                            <td>Tú</td>
                            <td>"Me gusta mucho"</td>
                            <td>15/03/2023</td>
                        </tr>
                        
                        <tr>
                            <td>Tú</td>
                            <td>"Menos mal que encontré este repositorio"</td>
                            <td>10/05/2023</td>
                        </tr>
                        
                        <tr>
                            <td>Tú</td>
                            <td>"Sí , aunque aportaría otra cosa a tus apuntes"</td>
                            <td>05/11/2023</td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <form action="miEspacio.jsp">               
                <input type="submit" value="Volver al Inicio"/>
            </form>

        </main>        
        <jsp:include page="pie.jsp"/>
    </body>
</html>
