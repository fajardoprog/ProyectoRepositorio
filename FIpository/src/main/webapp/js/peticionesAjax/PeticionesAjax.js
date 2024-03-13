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
                            class: "btn btn-outline-success",
                            for : nombreCarpeta,
                            style:"color:"+carpetaActual.color+";border: 1px solid "+carpetaActual.color+";"
                        }).append("<span>").text(nombreCarpeta)));
                        
                    }
                },
                error: function (result, status, xhr) {
                    alert("Error-->" + status + "<br>" + xhr.responseText);
                }
            }
    );
}