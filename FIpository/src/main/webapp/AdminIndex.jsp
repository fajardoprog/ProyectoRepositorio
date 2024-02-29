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
        <title>Panel Control Administrador</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloAdminIndex.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item active" aria-current="page"><a href="index.jsp">Panel Control Admin</a></li>
                </ol>
            </nav>
        </header>
        <main>

            <h1 class="m-3">Panel de Control</h1>

            <form action="AdminIndex.jsp" class="container-fluid">
                <div class="input-group mb-3 p-xl-3 ">
                    <input type="text" class="form-control" placeholder="Búsquedas" aria-label="Búsquedas" aria-describedby="Búsquedas de usuarios o repositorios">
                    <button class="btn btn-success d-flex align-items-center justify-content-around" type="submit" id="botonBusquedaAdmin"><i class="bi bi-search me-2"></i> Buscar</button>
                </div>
            </form>

            <section class="container-Admin row row-cols-1 row-cols-md-2 row-cols-xl-3 row container-fluid justify-content-center g-0 ">
                <!--Aquí van las opiniones-->

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between">
                            <img src="img/images.jfif" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="miFoto" class="rounded-circle img-thumbnail"/>
                            <h5>EricCartman21</h5>
                            <form action="" class="d-none d-xl-block">
                                <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <h5>Fecha Creación Cuenta</h5>
                            <p>11/12/2023</p>

                            <div class="d-flex justify-content-around text-center">
                                <div>
                                    <i class="bi bi-exclamation-diamond-fill"></i>
                                    <p>1</p>
                                </div>

                                <div>
                                    <i class="bi bi-heart-fill"></i>
                                    <p>360</p>
                                </div>
                            </div>

                        </div>
                        <form action="" class="d-block d-xl-none">
                            <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                        </form>
                    </article>
                </div>

                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between">
                            <img src="img/images.jfif" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="miFoto" class="rounded-circle img-thumbnail"/>
                            <h5>EricCartman21</h5>
                            <form action="" class="d-none d-xl-block">
                                <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <h5>Fecha Creación Cuenta</h5>
                            <p>11/12/2023</p>

                            <div class="d-flex justify-content-around text-center">
                                <div>
                                    <i class="bi bi-exclamation-diamond-fill"></i>
                                    <p>1</p>
                                </div>

                                <div>
                                    <i class="bi bi-heart-fill"></i>
                                    <p>360</p>
                                </div>
                            </div>

                        </div>
                        <form action="" class="d-block d-xl-none">
                            <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                        </form>
                    </article>
                </div>
                
                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between">
                            <img src="img/images.jfif" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="miFoto" class="rounded-circle img-thumbnail"/>
                            <h5>EricCartman21</h5>
                            <form action="" class="d-none d-xl-block">
                                <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <h5>Fecha Creación Cuenta</h5>
                            <p>11/12/2023</p>

                            <div class="d-flex justify-content-around text-center">
                                <div>
                                    <i class="bi bi-exclamation-diamond-fill"></i>
                                    <p>1</p>
                                </div>

                                <div>
                                    <i class="bi bi-heart-fill"></i>
                                    <p>360</p>
                                </div>
                            </div>

                        </div>
                        <form action="" class="d-block d-xl-none">
                            <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                        </form>
                    </article>
                </div>
                
                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between">
                            <img src="img/images.jfif" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="miFoto" class="rounded-circle img-thumbnail"/>
                            <h5>EricCartman21</h5>
                            <form action="" class="d-none d-xl-block">
                                <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <h5>Fecha Creación Cuenta</h5>
                            <p>11/12/2023</p>

                            <div class="d-flex justify-content-around text-center">
                                <div>
                                    <i class="bi bi-exclamation-diamond-fill"></i>
                                    <p>1</p>
                                </div>

                                <div>
                                    <i class="bi bi-heart-fill"></i>
                                    <p>360</p>
                                </div>
                            </div>

                        </div>
                        <form action="" class="d-block d-xl-none">
                            <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                        </form>
                    </article>
                </div>
                
                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between">
                            <img src="img/images.jfif" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="miFoto" class="rounded-circle img-thumbnail"/>
                            <h5>EricCartman21</h5>
                            <form action="" class="d-none d-xl-block">
                                <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <h5>Fecha Creación Cuenta</h5>
                            <p>11/12/2023</p>

                            <div class="d-flex justify-content-around text-center">
                                <div>
                                    <i class="bi bi-exclamation-diamond-fill"></i>
                                    <p>1</p>
                                </div>

                                <div>
                                    <i class="bi bi-heart-fill"></i>
                                    <p>360</p>
                                </div>
                            </div>

                        </div>
                        <form action="" class="d-block d-xl-none">
                            <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                        </form>
                    </article>
                </div>
                
                <div>
                    <article class="card flex-column flex-xl-row py-2 px-4 justify-content-between align-items-center shadow bg-body-tertiary rounded">
                        <div class="d-flex flex-column align-items-center justify-content-between">
                            <img src="img/images.jfif" class="d-block d-xl-none img-fluid"/>
                            <img src="img/MiFoto.png" alt="miFoto" class="rounded-circle img-thumbnail"/>
                            <h5>EricCartman21</h5>
                            <form action="" class="d-none d-xl-block">
                                <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                            </form>
                        </div>

                        <div class="d-flex flex-column justify-content-around">
                            <h5>Fecha Creación Cuenta</h5>
                            <p>11/12/2023</p>

                            <div class="d-flex justify-content-around text-center">
                                <div>
                                    <i class="bi bi-exclamation-diamond-fill"></i>
                                    <p>1</p>
                                </div>

                                <div>
                                    <i class="bi bi-heart-fill"></i>
                                    <p>360</p>
                                </div>
                            </div>

                        </div>
                        <form action="" class="d-block d-xl-none">
                            <input type="submit" class="btn btn-primary w-100" value="Ver Perfil" />
                        </form>
                    </article>
                </div>
            </section>

        </main>        
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>
</html>