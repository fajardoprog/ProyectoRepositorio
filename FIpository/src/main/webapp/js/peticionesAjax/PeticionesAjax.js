function recuperarCarpetasRepositorio(repositorio) {
    $.ajax(
            {
                url: "RecuperarCarpetas",
                method: "POST",
                data: {
                    repositorio: repositorio
                },
                success: function (datos) {
                    console.log(JSON.stringify(datos));
                },
                error: function (result, status, xhr) {
                    alert("Error-->" + status + "<br>" + xhr.responseText);
                }
            }
    );
}