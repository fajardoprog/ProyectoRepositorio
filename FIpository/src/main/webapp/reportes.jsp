<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reportes de Juanma</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/estiloReportes.css">
        <link rel="stylesheet" href="css/jquery.sweet-modal.css">
        <script src="js/jquery-3.7.1.min.js"></script>
        <script src="js/jquery.sweet-modal.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11">
            import Swal from 'sweetalert2';
        </script>
        <script>

            $(function () {
                $("#ban").on("click", function () {
                    const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: "btn btn-success",
                            cancelButton: "btn btn-danger"
                        },
                        buttonsStyling: false
                    });
                    Swal.fire({
                        title: "Bloquear a Juanma",
                        text: "¿Estás seguro de bloquear definitivamente a Juanma? Esto no se puede deshacer porque no quiero",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Bloquear",
                        cancelButtonText: "No bloquear",
                        reverseButtons: true
                    }).then((result) => {
                        if (result.isConfirmed) {
                            swalWithBootstrapButtons.fire({
                                title: "Bloqueo con éxito",
                                text: "Juanma ha sido baneado",
                                icon: "success"
                            });
                        } else if (
                                /* Read more about handling dismissals below */
                                result.dismiss === Swal.DismissReason.cancel
                                ) {
                            swalWithBootstrapButtons.fire({
                                title: "Cancelado",
                                text: "Has decidido no banear a Juanma",
                                icon: "error"
                            });
                        }
                    });
                });
                //------------------------------------------------------------
                $("#aviso").on("click", function () {
                    Swal.fire({
                        title: "Escriba el mensaje que quieras enviar al usuario",
                        input: "textarea",
                        inputAttributes: {
                            autocapitalize: "off"
                        },
                        showCancelButton: true,
                        confirmButtonText: "Enviar",
                        showLoaderOnConfirm: true,                        
                    });
                });
            });
        </script>

    </head>

    <body>
        <header>
            <jsp:include page="cabecera.jsp" />
            <nav aria-label="breadcrumb" id="breadcrumbs">
                <!--Asignar enlaces una vez hecha la parte admin-->                
                <ol class="breadcrumb p-4">
                    <li class="breadcrumb-item" aria-current="page"><a href="index.jsp">Bienvenida</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="AdminIndex.jsp">Panel Control Administrador</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="GestionPerfilUsuAdmin.jsp">Administración de Juanma</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Reportes de Juanma</li>
                </ol>
            </nav>
        </header>
        <div class="contenedor-reportes">

            <main>
                <h1>Reportes de Juanma</h1>
                <article>
                    <h2>Operaciones sobre Juanma</h2>
                    <div class="contenedor-botones">
                        <div>
                            <button class="ban" id="ban" title="Baneo al usuario">
                                Banear (prohibir entrada)
                            </button>
                        </div>
                        <div>
                            <button class="aviso" id="aviso" title="mandar mensaje al usuario">
                                Mandar correo de aviso
                            </button>
                        </div>

                    </div>
                </article>
                <section>
                    <h2>Lista de reportes</h2>
                    <table>
                        <tr>
                            <th>Usuario que reporta</th>
                            <th>Motivo principal</th>
                            <th>Fecha</th>
                            <th>Resto de motivos</th>
                        </tr>
                        <tr>
                            <td>Facundo</td>
                            <td>Distribución de pornografía</td>
                            <td>24/12/2023 13:45hs</td>
                            <td>Tiene cochinadas</td>
                        </tr>

                        <tr>
                            <td>Evaristo</td>
                            <td>Contenido robado</td>
                            <td>24/12/2023 13:50hs</td>
                            <td>Lo tiene otro tío de por aquí, petorluj me parece</td>
                        </tr>

                        <tr>
                            <td>Evaristo</td>
                            <td>Spam</td>
                            <td>24/12/2023 13:51hs</td>
                            <td>Es una hamburguesería, no me fastidies</td>
                        </tr>

                        <tr>
                            <td>Juanma</td>
                            <td>Lenguaje no apropiado</td>
                            <td>24/12/2023 13:52hs</td>
                            <td>Me ha dicho que soy un patatudo</td>
                        </tr>

                        <tr>
                            <td>Lola</td>
                            <td>Enaltecimiento del terrorismo</td>
                            <td>24/12/2023 14:40hs</td>
                            <td>¡Porra frita! Ha intentado adoctrinar a mis hijos</td>
                        </tr>

                    </table>
                </section>
            </main>
            <aside>
                <section>
                    <h2>Publicidad de la apliacion</h2>
                    <article>
                        <header>
                            <a href="#" class="text-center d-block">Añadir pulicidad a la aplicacion <i class="bi bi-cloud-plus-fill p-1"></i></a>
                            <h3 class="text-center">Compra Inca Kola</h3>
                        </header>
                        <figure>
                            <img src="img/inkacola.jpg" alt="foto de inka cola"/>
                            <figcaption>Imagen de la Inca Kola</figcaption>
                        </figure> 
                        <p>Llega desde el Perú más profundo la magnífica Inca Kola, llena de sabor a llama y palta para lograr un <strong>sabor único</strong>.</p>
                    </article>
                </section>

                <section>
                    <h2>Otras noticias</h2>
                    <article>
                        <header>
                            <h3>Lola es fichada por Oracle</h3>
                        </header>
                        <figure>
                            <img src="img/lola.JPG" alt="Foto de lola, afectada"/>
                            <figcaption>La afectada por la noticia, Lola Verdú</figcaption>
                        </figure>
                        <p>Sorprendida en la puerta de las oficinas de <strong>Oracle</strong> en Málaga, Lola firmó un contrato millonario (presuntamente) para seguir usando el IDE Netbeans, tal y como los estractos bancarios demuestran.</p>
                    </article>
                </section>
            </aside>
        </div>

        <jsp:include page="pie.jsp"/>
        <script src="js/bootstrap.bundle.js"></script>
    </body>
</html>