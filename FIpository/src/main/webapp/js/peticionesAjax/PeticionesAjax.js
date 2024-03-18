function recuperarCarpetasRepositorio(repositorio) {
    $.ajax(
            {
                url: "RecuperarCarpetas",
                method: "POST",
                data: {
                    repositorio: repositorio
                },
                success: function (carpetas) {
                    console.log("arrecogios");
                    if (Object.keys(carpetas).length !== 0) {
                        for (let carpeta in carpetas) {
                            let carpetaActual = JSON.parse(carpetas[carpeta]);
                            nombreCarpeta = carpetaActual.archivoPK.nombreArchivo;
                            $("#container-carpetas").append($("<div>").append($("<input>").attr({
                                type: "radio",
                                class: "btn-check",
                                name: "carpetaElegida",
                                id: nombreCarpeta,
                                autocomplete: "off",
                                value: nombreCarpeta
                            })).addClass("container-carpetas-fichero").append($("<label>").attr({
                                class: "btn btn-outline-dark",
                                for : nombreCarpeta,
                                style: "color:" + carpetaActual.color + ";border: 1px solid " + carpetaActual.color + ";"
                            }).append("<span>").text(nombreCarpeta)));
                        }
                    } else {
                        $("#container-carpetas").append($("<p>").text("No tienes carpetas, ¡crea una ahora!").addClass("text-center fw-bold"));
                    }

                },
                error: function (result, status, xhr) {
                    alert("Error-->" + status + "<br>" + xhr.responseText);
                }
            }
    );
}

function busqueda($filtro, desc, criterio) {
    let filtro = $filtro.text().split(" ")[1];
    console.log(filtro);
    $.ajax(
            {
                url: "Busqueda",
                method: "POST",
                data: {
                    tipoFiltro: filtro,
                    filtro: $("#busquedas-input").val()
                },
                success: function (resultado) {
                    if (Object.keys(resultado).length !== 0) {
                        if (filtro === "usuario") {
                            resultado = ordenarArrayObjetos(resultado, desc);
                            for (let usuario in resultado) {
                                let usuarioActual = JSON.parse(resultado[usuario]);
                                nombreUsuario = usuarioActual.nombreArchivo;
                                $("#cartas").append($("<article>").addClass("card card-usuario")
                                        .append($("<header>").addClass("card-header d-flex flex-column flex-lg-row align-items-stretch align-items-lg-center justify-content-lg-between")
                                                .append($("<div>").addClass("d-flex align-items-center")
                                                        .append($("<img>").addClass("avatar-repositorio").attr({src: "imgPerfilUsuario/" + usuarioActual.foto, alt: "foto de " + usuarioActual.nombreUsuario}))
                                                        .append($("<div>").addClass("titulo-accion ps-md-3 p-3 p-md-1")
                                                                .append($("<h5>").text(usuarioActual.nombreUsuario))
                                                                //.append($("<p>").text("Última vez conectado: Hace 7 horas"))
                                                                )
                                                        )
                                                .append($("<form>").attr({action: "PerfilOtroUsu.jsp"})
                                                        .append($("<input>").attr({type: "submit", value: "Visitar perfil", "class": "btn btn-primary w-100", title: "Visitar perfil del usuario"})))
                                                ) //header
                                        .append($("<div>").addClass("datos-usuario d-flex align-items-center justify-content-between")
                                                .append($("<div>").addClass("d-flex align-items-center text-truncate")
                                                        .append($("<div>").addClass("usuario-completo ps-3 text-truncate")
                                                                .append($("<p>").text(usuarioActual.nombreUsuario))
                                                                .append($("<p>").addClass("text-truncate").text(usuarioActual.nombreCompleto + " " + usuarioActual.primerApellido + " " + usuarioActual.segundoApellido))
                                                                .append($("<p>").addClass("text-truncate").text(usuarioActual.descripcion))
                                                                )
                                                        )

                                                )
                                        .append($("<div>").addClass("stats d-flex justify-content-around pt-2 text-center align-items-stretch")
                                                .append($("<p>").addClass("p-2 border rounded-pill text-white badgeCentrado").text("punto/s de reputación ")
                                                        .append($("<span>").addClass("badge text-white bg-success ms-2").text(usuarioActual.numeroLike)))
                                                )

                                        ); //container principal
                            }
                        } else {
                            for (let repositorio in resultado) {
                                let repositorioActual = resultado[repositorio];
                                $("#cartas").append($("<article>").addClass("card card-repositorio")
                                        .append($("<header>").addClass("card-header d-flex flex-column flex-lg-row justify-content-between align-items-stretch align-content-lg-center px-3 px-md-3")
                                                .append($("<div>").addClass("titulo-accion ps-3 justify-content-center")
                                                        .append($("<h5>").text(repositorioActual.nombrerepositorio)))
                                                .append($("<form>").addClass("d-flex align-items-center").attr("action", "repositorio.jsp")
                                                        .append($("<input>").attr({type: "hidden", value: repositorioActual.nombrerepositorio, name: "repositorio"}))
                                                        .append($("<input>").attr({type: "submit", value: "Ir al repositorio", "class": "btn btn-primary w-100", title: "Visitar el repositorio " + repositorioActual.nombrerepositorio})))
                                                )
                                        .append($("<article>").addClass("contenedor-afectado-repositorio d-flex align-items-center justify-content-between container-fluid py-2")
                                                .append($("<div>").addClass("datos-repositorio text-truncate")
                                                        .append($("<p>").text(repositorioActual.nombrerepositorio))
                                                        .append($("<p>").addClass("text-truncate").text(repositorioActual.descripcion))))
                                        );
                            }
                        }

                    } else {
                        $("#cartas").append($("<p>").text("No hay resultados que cumplan ese criterio de búsqueda").addClass("text-center fw-bold"));
                    }

                },
                error: function (result, status, xhr) {
                    alert("Error-->" + status + "<br>" + xhr.responseText);
                }
            }
    );
}

function ordenarArrayObjetos(resultado, desc, criterio) {
    let claves = Object.keys(resultado);
    if (desc === false) {
        claves.sort((a, b) => b.localeCompare(a));
    } else {
        claves.sort((a, b) => a.localeCompare(b));
    }

    objetoDesordenado = resultado;
    resultado = {};
    for (let clave of claves) {
        resultado[clave] = objetoDesordenado[clave];
    }
    return resultado;
}

function recuperarArchivosRepositorio(repositorio) {
    $.ajax(
            {
                url: "CargaRepositorio",
                method: "POST",
                data: {
                    repositorio: repositorio
                },
                success: function (archivos) {
                    console.log(archivos);
                    if (Object.keys(archivos).length !== 0) {
                        for (let archivo in archivos) {
                            let archivoActual = JSON.parse(archivos[archivo]);
                            let tipo = "";
                            let imagen = "";
                            let fecha = new Date(archivoActual.fechaCreacion);
                            if (archivoActual.carpeta) {
                                tipo = "Carpeta";
                                imagen = "img/carpeta.png";
                            } else {
                                let longitud = archivoActual.archivoPK.nombreArchivo.split(".").length;
                                tipo =  archivoActual.archivoPK.nombreArchivo.split(".")[longitud-1];
                                if (tipo === "png" || tipo === "PNG" || tipo === "jpg" || tipo === "JPG") {
                                    let foto = archivoActual.archivoPK.nombreArchivo.split("/")[1];
                                    imagen = "imgPerfilUsuario/" + foto;
                                    // Coger la imagen desde el repositorio, no desde la carpeta fija imgPerfilUsuario
                                } else {
                                    imagen = "img/fichero.png";
                                }
                            }
                            console.log(archivoActual);
                            $("#formato-tabla").append($("<tr>")
                                    .append($("<td>").text(archivoActual.archivoPK.nombreArchivo))
                                    .append($("<td>").text(tipo))
                                    .append($("<td>").text(fecha.toLocaleString()))
                                    .append($("<td>")
                                            .append($("<div>").addClass("d-flex justify-content-between align-items-center")
                                                    .append($("<span>").text(archivoActual.archivoPK.nombreUsuario))
                                                    .append($("<form>"))))
                                    );
                            $("#formato-cartas section").append($("<div>").addClass("container-carta")
                                    .append($("<article>").addClass("card")
                                            .append($("<img>").addClass("card-img-top").attr({src: imagen}))
                                            .append($("<div>").addClass("card-body")
                                                    .append($("<h4>").addClass("card-title").text(archivoActual.archivoPK.nombreArchivo))
                                                    .append($("<form>").addClass("d-flex justify-content-between align-items-end")))))

                        }
                        $("table tr td:last-child form, #formato-cartas article.card form").append(
                                $("<button>").attr({
                            type: "button",
                            "data-bs-toggle": "tooltip",
                            "data-bs-placement": "bottom",
                            "data-bs-custom-class": "boton-tooltip",
                            "data-bs-title": "Descargar"
                        }).addClass("btn").append("<i>").addClass("bi bi-download")
                                ).append(
                                $("<button>").attr({
                            type: "button",
                            "data-bs-toggle": "tooltip",
                            "data-bs-placement": "bottom",
                            "data-bs-custom-class": "boton-tooltip",
                            "data-bs-title": "Cambiar nombre"
                        }).addClass("btn").append("<i>").addClass("bi bi-pencil-square")).append($("<button>").attr({
                            type: "button",
                            "data-bs-toggle": "tooltip",
                            "data-bs-placement": "bottom",
                            "data-bs-custom-class": "boton-tooltip",
                            "data-bs-title": "Borrar archivo"
                        }).addClass("btn").append("<i>").addClass("bi bi-trash-fill"));

                        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
                        tooltipTriggerList.forEach(function (tooltipTriggerEl) {
                            new bootstrap.Tooltip(tooltipTriggerEl);
                        });

                    }
                }
                ,
                error: function (result, status, xhr) {
                    alert("Error-->" + status + "<br>" + xhr.responseText);
                }
            }
    );
}