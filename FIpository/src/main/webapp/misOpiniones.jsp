<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
        <link rel="stylesheet" href="css/estiloMisOpiniones.css">
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
                    <li class="breadcrumb-item active" aria-current="page">Mis Opiniones</li>
                </ol>
            </nav>
        </header>
        <main>

            <h1 class="m-4">Mis opiniones</h1>
            <section class="container-opiniones row row-cols-1 row-cols-md-2 row-cols-xl-3 row container-fluid justify-content-center g-0 ">
                <!--Aquí van las opiniones-->
                <div class="d-flex">
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-xl-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column justify-content-between justify-content-between justify-content-xl-center h-100 pe-xl-3">
                            <div>
                                <img src="img/images.jfif" class="d-block d-xl-none img-fluid" alt="Numero de Estrellas"/>
                                <h5>FajardoProg/Desarrollo Web en entorno Servidor</h5>
                            </div>
                            <form action="repositorio.jsp" >
                                <input type="submit" class="btn btn-primary w-100" value="Ver repositorio" title="visitar el repositorio de FajardoProg llamado Desarrollo Web en entorno Servidor"/>
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif" class="d-none d-xl-block img-fluid" alt="Numero de Estrellas"/>
                            <h5>Comentario</h5>
                            <p>"Me gusta mucho este Repositorio"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>11/12/2023</p>
                        </div>
                    </article>
                </div>
                <div class="d-flex">
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-xl-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column justify-content-between justify-content-between justify-content-xl-center h-100 pe-xl-3">
                            <div>
                                <img src="img/images.jfif" class="d-block d-xl-none img-fluid" alt="Numero de Estrellas"/>
                                <h5>FajardoProg/Desarrollo Web en entorno Cliente</h5>
                            </div>
                            <form action="repositorio.jsp" >
                                <input type="submit" class="btn btn-primary w-100" value="Ver repositorio"  title="visitar el repositorio de FajardoProg llamado Desarrollo Web en entorno Cliente"/>
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif" class="d-none d-xl-block img-fluid" alt="Numero de Estrellas"/>
                            <h5>Comentario</h5>
                            <p>"No me gusta mucho este Repositorio, es penoso"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>13/12/2023</p>
                        </div>
                    </article>
                </div>

                <div class="d-flex">
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-xl-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column justify-content-between justify-content-between justify-content-xl-center h-100 pe-xl-3">
                            <div>
                                <img src="img/images.jfif" class="d-block d-xl-none img-fluid" alt="Numero de Estrellas"/>
                                <h5>FajardoProg/Proyecto Integrado, banco de España</h5>
                            </div>
                            <form action="repositorio.jsp" >
                                <input type="submit" class="btn btn-primary w-100" value="Ver repositorio"  title="visitar el repositorio de FajardoProg llamado Proyecto Integrado, banco de España"/>
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif" class="d-none d-xl-block img-fluid" alt="Numero de Estrellas"/>
                            <h5>Comentario</h5>
                            <p>"Esta página es lamentable, pero los que la hicieron son demasiado guapos"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>14/12/2023</p>
                        </div>
                    </article>
                </div>

                <div class="d-flex">
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-xl-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column justify-content-between justify-content-between justify-content-xl-center h-100 pe-xl-3">
                            <div>
                                <img src="img/images.jfif" class="d-block d-xl-none img-fluid" alt="Numero de Estrellas"/>
                                <h5>FajardoProg/Empresa e Iniciativa Emprendedora</h5>
                            </div>
                            <form action="repositorio.jsp" >
                                <input type="submit" class="btn btn-primary w-100" value="Ver repositorio"  title="visitar el repositorio de FajardoProg llamado Empresa e Iniciativa Emprendedora"/>
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif" class="d-none d-xl-block img-fluid" alt="Numero de Estrellas"/>
                            <h5>Comentario</h5>
                            <p>"La vida es una lenteja, o la tomas o la dejas"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>16/12/2023</p>
                        </div>
                    </article>
                </div>

                <div class="d-flex">
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-xl-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column justify-content-between justify-content-between justify-content-xl-center h-100 pe-xl-3">
                            <div>
                                <img src="img/images.jfif" class="d-block d-xl-none img-fluid" alt="Numero de Estrellas"/>
                                <h5>IsmaeloteElMalote/Apuntes serios</h5>
                            </div>
                            <form action="repositorio.jsp" >
                                <input type="submit" class="btn btn-primary w-100" value="Ver repositorio"  title="visitar el repositorio de IsmaeloteElMalote llamado Apuntes serios"/>
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif" class="d-none d-xl-block img-fluid" alt="Numero de Estrellas"/>
                            <h5>Comentario</h5>
                            <p>"Una experiencia sumamente gratificante"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>11/12/2023</p>
                        </div>
                    </article>
                </div>

                <div class="d-flex">
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-xl-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column justify-content-between justify-content-between justify-content-xl-center h-100 pe-xl-3">
                            <div>
                                <img src="img/images.jfif" class="d-block d-xl-none img-fluid" alt="Numero de Estrellas"/>
                                <h5>FajardoProg/Desarrollo Web en entorno Inglés</h5>
                            </div>
                            <form action="repositorio.jsp" >
                                <input type="submit" class="btn btn-primary w-100" value="Ver repositorio"  title="visitar el repositorio de FajardoProg llamado Desarrollo Web en entorno Inglés"/>
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <img src="img/images.jfif" class="d-none d-xl-block img-fluid" alt="Numero de Estrellas"/>
                            <h5>Comentario</h5>
                            <p>"I love this!"</p>
                            <h5>Fecha de la opinión</h5>
                            <p>1/12/2023</p>
                        </div>
                    </article>
                </div>
            </section>

            <form action="miEspacio.jsp" class="text-center row g-0">               
                <input type="submit" class="btn btn-primary offset-1 col-10 offset-sm-2 col-sm-8 offset-xl-3 col-xl-6" value="Volver al Inicio" title="Volver a tu perfil del usuario"/>
            </form>

        </main>        
        <jsp:include page="pie.jsp"/>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>
