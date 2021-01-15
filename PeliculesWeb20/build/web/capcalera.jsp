<%-- 
    Document   : capcalera
    Created on : 04-nov-2020
    Author     : Lisandro Rocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Estadisticas de actores">
        <meta name="author" content="Lisandro Rocha y Izar Castorina">
        <meta name="generator" content="Jekyll v4.1.1">

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
        <link href="css/product.css" rel="stylesheet">
        
        <%
        String logout, href;
        if (session.getAttribute("session") != null) {
            logout = "Log Out";
            href = "/index.jsp?logout=true";
        } else {
            logout = "Log In";
            href = "/login.jsp";
        }
        %> 
    </head>
    <body>
        <nav class="site-header sticky-top py-1">
            <div class="container d-flex flex-column flex-md-row justify-content-between">
                <a class="py-2" href="<%= request.getContextPath()%>" aria-label="Product">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mx-auto" role="img" viewBox="0 0 24 24" focusable="false"><title>Peliculas</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
                </a>
                <a class="py-2 d-none d-md-inline-block" href="<%= request.getContextPath()%>">Inicio</a>
                <a class="py-2 d-none d-md-inline-block" href="<%= request.getContextPath()%>/graficas.jsp">Gráficas</a>
                <a class="py-2 d-none d-md-inline-block" href="<%= request.getContextPath()%>/precios.jsp">Precios</a>
                <a class="py-2 d-none d-md-inline-block" href="<%= request.getContextPath()%>/about.jsp">Sobre Nosotros</a>
                <a class="py-2 d-none d-md-inline-block" href="<%= request.getContextPath() + href%>"><%=logout%></a>
            </div>
        </nav>
    </body>
</html>
