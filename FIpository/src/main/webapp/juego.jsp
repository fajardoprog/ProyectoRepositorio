<%-- 
    Document   : juego
    Created on : 24 feb. 2024, 16:03:52
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
        <title>Juego</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloJuego.css">
        <script>

        </script>

    </head>

    <body>
        <header>
          <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page">Inicio</li>
                    <li class="breadcrumb-item" aria-current="page">Reposita2</li>
                    <li class="breadcrumb-item active" aria-current="page">Juego</li>
                </ol>
            </nav>
        </header>
        <main>
            <section class="container container-juego-teclado">
                <article class="container-juego">
                    <!-- Anchura máxima permitida 7 letras -->
                    <div class="linea-juego">
                        <div class="container-letra-juego">
                            <span class="letra-juego">B</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">Y</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">T</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                    </div>
                    <div class="linea-juego">
                        <div class="container-letra-juego">
                            <span class="letra-juego">B</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">Y</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">T</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                    </div>
                    <div class="linea-juego">
                        <div class="container-letra-juego">
                            <span class="letra-juego">B</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">Y</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">T</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                    </div>
                    <div class="linea-juego">
                        <div class="container-letra-juego">
                            <span class="letra-juego">B</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">Y</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">T</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                    </div>
                    <div class="linea-juego">
                        <div class="container-letra-juego">
                            <span class="letra-juego">B</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">Y</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">T</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                        <div class="container-letra-juego">
                            <span class="letra-juego">E</span>
                        </div>
                    </div>
                </article>
                <article class="container-teclado">
                    <div class="linea-teclado">
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">Q</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">W</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">E</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">R</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">T</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">Y</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">U</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">I</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">O</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">P</span>
                        </div>
                    </div>
                    <div class="linea-teclado">
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">A</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">S</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">D</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">F</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">G</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">H</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">J</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">K</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">L</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">Ñ</span>
                        </div>
                    </div>
                    <div class="linea-teclado">
                        <div class="container-letra-teclado">
                            <span class="letra-teclado letra-teclado-especial">Atrás</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">Z</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">X</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">C</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">V</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">B</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">N</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado">M</span>
                        </div>
                        <div class="container-letra-teclado">
                            <span class="letra-teclado letra-teclado-especial">Enter</span>
                        </div>
                    </div>

                </article>
            </section>
        </main>
        <footer>
        </footer>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>