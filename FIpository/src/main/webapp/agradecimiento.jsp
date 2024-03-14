<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recibirás tu correo con la contraseña</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estiloComun.css">
        <link rel="stylesheet" href="css/agradecimiento.css">


        <script src="js/jquery-3.7.1.min.js"></script>
        <script>

            $(document).ready(function () {

            });

        </script>       
    </head>

    <body class="d-flex flex-column justify-content-between">
        <header>
            <jsp:include page="cabecera.jsp" />           
        </header>
        <main class="container-fluid col-10">
            <h1 class="m-4">¡Muchas Gracias!</h1>
            <p>Espere pacientemente un administrador verá su solicitud y le enviaremos un correo con el camio de contraseña (Revise su correo)</p>
            <form action="index.jsp" class="d-flex justify-content-center" >                
                <input type="submit" value="Volver" class="btn btn-success m-3 col-6">
            </form>            
        </main>
        <jsp:include page="pie.jsp"/>
    </body>

    <script src="js/bootstrap.bundle.js"></script>

</html>