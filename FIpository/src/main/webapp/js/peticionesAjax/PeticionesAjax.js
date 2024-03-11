function recuperarCarpetasRepositorio(repositorio) {
    $.ajax(
            {
                url: "RecuperarCarpetas",
                method: "POST",
                data: {
                    repositorio: repositorio
                },
                success: function (carpetas) {
                    for (let carpeta in carpetas) {
                        let carpetaActual = JSON.parse(carpetas[carpeta]);
                        nombreCarpeta = carpetaActual.archivoPK.nombreArchivo;
                        $("#container-carpetas-fichero").append($("<div>").append($("<input>").attr({
                            type: "radio",
                            class: "btn-check",
                            name: "carpetaElegida",
                            id: nombreCarpeta,
                            autocomplete: "off",
                            value: nombreCarpeta
                        })).append($("<label>").attr({
                            class: "btn btn-outline-success",
                            for : nombreCarpeta
                        }).append("<span>").text(nombreCarpeta)));
                    }
                },
                error: function (result, status, xhr) {
                    alert("Error-->" + status + "<br>" + xhr.responseText);
                }
            }
    );
}