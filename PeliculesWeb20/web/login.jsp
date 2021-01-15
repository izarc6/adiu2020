<%-- 
    Document   : login
    Created on : 04-nov-2020
    Author     : Lisandro Rocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Log In">
        <meta name="author" content="Lisandro Rocha">
        <meta name="generator" content="Jekyll v4.1.1">
        <title>Estadísticas Actores - Log In</title>
        
        <!-- Bootstrap core CSS -->
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body class="text-center">
        
        <form class="form-signin" action="loginprocess.jsp" method="post">
            <a href="<%= request.getContextPath()%>"><img class="mb-4" src="<%= request.getContextPath()%>/imatges/Bootstrap.png" alt="" width="72" height="72"></a>
            <h1 class="h3 mb-3 font-weight-normal">Entrar en tu cuenta</h1>
            <label for="inputEmail" class="sr-only">Usuario</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="Usuario" name="user" required autofocus>
            <label for="inputPassword" class="sr-only" >Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" name="pass" required>
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Recordarme
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
            <p class="mt-5 mb-3 text-muted">Rocha Castorina Enterprise &copy; 2020</p>
        </form>
            
    </body>
</html>
