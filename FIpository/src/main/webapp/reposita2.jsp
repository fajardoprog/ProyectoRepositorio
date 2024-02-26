<%-- 
    Document   : reposita2
    Created on : 24 feb. 2024, 16:04:55
    Author     : José Antonio Fajardo Naranjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reposita2</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloReposita2.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page">Inicio</li>
                    <li class="breadcrumb-item active" aria-current="page">Reposita2</li>
                </ol>
            </nav>
        </header>
        <main>
            <div class="container-fluid my-4" id="cabezeraJuego">
                <h1 class="text-center">Reposita2</h1>
                <h5 class="text-center">¡Juega ahora para aumentar tu reputación!</h5>
                <form action="#" class="row">
                    <button type="submit" class="btn btn-sm btn-primary offset-3 col-6 p-3" type="submit">Jugar</button>
                </form>
            </div>
            <div class="container">
                <section>
                    <h2 class="text-center">Usuarios más valorados</h2>
                    <div class="row row-cols-3 align-items-end text-center g-0">
                        <div>
                            <h2 class="text-truncate">El mismísimo pato Lucas de los Looneys</h2>
                            <article id="segundo">
                                2º: 2000 puntos
                            </article>
                        </div>
                        <div>
                            <h1 class="text-truncate">Paquillo</h1>
                            <article id="primero">
                                1º: 3000 puntos
                            </article>
                        </div>
                        <div>
                            <h3 class="text-truncate">M. Rajoy</h3>
                            <article id="tercero">
                                3º: 1000 puntos
                            </article>
                        </div>

                    </div>
                </section>
                <section id="puntuaciones" class="my-5">
                    <h4>Puntuaciones</h4>
                    <table class="table table-striped table-hover table-primary">
                        <tr class="row row-cols-3 text-center">
                            <th>Puesto</th>
                            <th>Nombre</th>
                            <th>Puntuacion</th>
                        </tr>
                        <tbody class="table-group-divider">
                            <tr class="row row-cols-3">
                                <td class="text-truncate">1</td>
                                <td class="text-truncate">Paquillo</td>
                                <td class="text-truncate">3000</td>
                            </tr>
                            <tr class="row row-cols-3">
                                <td class="text-truncate">2</td>
                                <td class="text-truncate">El mismísimo pato Lucas de los Looneys</td>
                                <td>2000</td>
                            </tr>
                            <tr class="row row-cols-3">
                                <td class="text-truncate">3</td>
                                <td class="text-truncate">M. Rajoy</td>
                                <td class="text-truncate">1000</td>
                            </tr>
                            <tr class="row row-cols-3">
                                <td class="text-truncate">4</td>
                                <td class="text-truncate">Sin ánimo de lucro, tú que prefieres?</td>
                                <td class="text-truncate">500</td>
                            </tr>
                            <tr class="row row-cols-3">
                                <td class="text-truncate">5</td>
                                <td class="text-truncate">El negrito del África tropical</td>
                                <td class="text-truncate">60</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
            </div>
        </main>
        <footer>
        </footer>
    </body>
    <script src="js/bootstrap.bundle.js"></script>
</html>
