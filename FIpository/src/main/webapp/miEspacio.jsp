
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi espacio</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloMiEspacio.css">
        <script>

        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <jsp:include page="CargaDatosRepositorio"/>
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Mi espacio</li>
                </ol>
            </nav>
        </header>
        <h1 class="m-4">Mi espacio</h1>
        <div class="container-fluid m-0 p-3 px-lg-5 d-lg-flex">
            <aside  id="mis-repositorios"  class="col-lg-4 p-4">
                <h3 class="m-4">Mis repositorios</h3>
                <article>
                    <form  class="form-floating mb-3">
                        <input type="text" class="form-control" name="busqueda-repositorios" id="busqueda-repositorios"
                               placeholder="" />
                        <label for="busqueda-repositorios">Buscar repositorio</label>
                    </form>
                </article>

                <section class="d-flex flex-column container-repositorios">
                    <c:choose>
                        <c:when test="${not empty requestScope.misRepositorios}">
                            <c:forEach items="${requestScope.misRepositorios}" var="repo">
                                <article>
                                    <img class="avatar-repositorio" src="imgPerfilUsuario/${sessionScope.usuarioActual.foto}" alt="Avatar del Usuario">
                                    <a class="enlace-repositorio m-2 my-1 icon-link icon-link-hover" href="repositorio.jsp" >
                                        ${sessionScope.usuarioActual.nombreUsuario}/${repo.repositorioPK.nombreRepositorio}
                                        <c:if test="${repo.privado == 0}">
                                             <i class="ms-2 bi bi-eye-fill"></i>
                                        </c:if>
                                        <c:if test="${repo.privado == 1}">
                                            <i class="ms-2 bi bi-eye-slash-fill"></i>
                                        </c:if>
                                        <i class="ms-2 bi bi-arrow-right"></i>
                                    </a>
                                </article>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </section>
            </aside>
            <main class="offset-lg-1 col-lg-7">
                <section id="compartido-conmigo" class="p-4 my-3 my-lg-0">
                    <header>
                        <h3>Compartido conmigo</h3>
                    </header>
                    <section class="d-flex flex-column container-repositorios">
                        <c:choose>
                            <c:when test="${not empty requestScope.repositoriosCompartidos}">
                                <c:forEach items="${requestScope.repositoriosCompartidos}" var="repoCompartido">
                                    <article>
                                        <img class="avatar-repositorio" src="imgPerfilUsuario/${repoCompartido.usuario.foto}" alt="Avatar del Usuario">
                                        <a class="enlace-repositorio m-2 my-1" href="#">
                                            ${repoCompartido.repositorio.repositorioPK.nombreUsuario}/${repoCompartido.repositorio.repositorioPK.nombreRepositorio}
                                            <i class="bi bi-arrow-right">
                                            </i>
                                        </a>
                                    </article> 
                                </c:forEach>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>

                    </section>
                </section>
                <section id="actividad-reciente" class="my-lg-3">
                    <header>
                        <h3 >Actividad reciente</h3>
                    </header>
                    <article class="card carta-actividad">
                        <header class="card-header d-flex align-items-center">
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="Logotipo pagina web FIpository">
                            <div class="titulo-accion ps-3">
                                <h5>IsmaelJ creó un repositorio</h5>
                                <p>Hace 7 horas</p>
                            </div>
                        </header>
                        <article class="contenedor-afectado-repositorio d-flex flex-column flex-sm-row align-items-stretch justify-content-between container-fluid py-2">
                            <div class="datos-repositorio d-flex flex-column text-truncate w-100">
                                <p>IsmaelJ/Apuntes Lola<i class="mx-2 bi bi-lock-fill"></i></p>
                                <p class="text-truncate">Apuntes para las asignaturas de Despliegue de Aplicaciones Web y Desarrollo Web en Entorno Servidor</p>
                            </div>
                            <form class="my-2 ms-sm-5" action="repositorio.jsp">
                                <input type="submit" value="Ir al repositorio" class="btn btn-primary w-100"/>
                            </form>
                        </article>
                    </article>

                    <article class="card carta-actividad">
                        <header class="card-header d-flex align-items-center">
                            <img class="avatar-repositorio" src="img/LogoFi.png" alt="Logo pagina web Fipository">
                            <div class="titulo-accion ps-3">
                                <h5>IsmaelJ ha empezado a seguir a alguien</h5>
                                <p>Hace 7 horas</p>
                            </div>
                        </header>

                        <article class="contenedor-afectado-repositorio d-flex flex-column flex-sm-row align-items-stretch justify-content-between container-fluid py-2">
                            <div class="datos-repositorio d-flex flex-column text-truncate w-100">
                                <div class="d-flex align-content-center align-items-center">
                                    <img class="avatar-repositorio" src="img/LogoFi.png" alt="Logo pagina web Fipository">
                                    <div class="usuario-completo d-flex flex-column text-truncate ps-3">
                                        <p>petorluj</p>
                                        <p class="text-truncate">Pedro Manuel Torres Luján</p>
                                        <p class="text-truncate">Profesor de Desarrollo Web en entorno Cliente en el IES Martín Rivero</p>
                                    </div>
                                </div>
                            </div>
                            <form class="my-2 ms-sm-5" action="PerfilOtroUsu.jsp">
                                <input type="submit" value="Ver perfil" class="btn btn-primary w-100"/>
                            </form>
                        </article>
                        <div class="stats d-flex flex-column flex-md-row justify-content-around pt-2 text-center">
                            <p class="py-2 py-sm-0 px-2">
                                <span class="num-repositorios">
                                    33
                                </span>
                                repositorio/s
                            </p>
                            <p class="py-2 py-sm-0 px-2">
                                <span class="num-seguidores">
                                    33
                                </span>
                                seguidor/es
                            </p>
                            <p class="py-2 py-sm-0 px-2">
                                <span class="num-reputacion">
                                    333
                                </span>
                                punto/s de reputación
                            </p>
                        </div>
                    </article>

                </section>
                <section id="intereses">
                    <header>
                        <h3>Quizá te interese basado en tus búsquedas</h3>
                    </header>
                    <!--TODO: Colocar artículos basados en tus búsquedas-->
                    <article>

                    </article>
                </section>
            </main>
        </div>
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>