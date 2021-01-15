<%-- 
    Document   : about
    Created on : 04-nov-2020
    Author     : Lisandro Rocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Estadísticas Actores - Precios</title>
        <!-- Custom styles for this template -->
        <link href="css/pricing.css" rel="stylesheet">
    </head>
    <body>
        <%
            String lloc = request.getServletContext().getContextPath();
            int num = lloc.length() - lloc.replaceAll("/", "").length();
            lloc = "";
            for (int i = 0; i < num - 1; i++) {
                lloc = lloc + "/..";
            }
            lloc = lloc + "/capcalera.jsp";
        %>
        <jsp:include page="<%= lloc%>"/> 

        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
            <h1 class="display-4">Precios</h1>
            <p class="lead">Consigue información precisa sobre los actores en un entorno con gráficos de alta calidad y soporte en todo momento.</p>
        </div>

        <div class="container">
            <div class="card-deck mb-3 text-center">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Gratis</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">0€ <small class="text-muted">/ mes</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>10 gráficos básicos</li>
                            <li>20 actores al mes</li>
                            <li>Soporte básico</li>
                            <li>Acceso a los datos más antiguos</li>
                        </ul>
                        <button role="link" onClick="window.location='<%= request.getContextPath()%>/login.jsp'" type="button" class="btn btn-lg btn-block btn-outline-primary">Registrate gratis</button>
                    </div>
                </div>
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Pro</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">15€ <small class="text-muted">/ mes</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>10 gráficos avanzados</li>
                            <li>200 actores al mes</li>
                            <li>Soporte extendido</li>
                            <li>Acceso a los datos más recientes</li>
                        </ul>
                        <button role="link" onClick="window.location='<%= request.getContextPath()%>/login.jsp'" type="button" class="btn btn-lg btn-block btn-primary">Elegir</button>
                    </div>
                </div>
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Empresa</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">29€ <small class="text-muted">/ mes</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Todo tipo de gráficos</li>
                            <li>Actores ilimitados</li>
                            <li>Soporte dedicado 24h</li>
                            <li>Acceso a datos exclusivos</li>
                        </ul>
                        <button role="link" onClick="window.location='<%= request.getContextPath()%>/about.jsp'" type="button" class="btn btn-lg btn-block btn-primary">Contáctanos</button>
                    </div>
                </div>
            </div>

        <%
            String footer = request.getServletContext().getContextPath();
            int num2 = footer.length() - footer.replaceAll("/", "").length();
            footer = "";
            for (int i = 0; i < num2 - 1; i++) {
                footer = footer + "/..";
            }
            footer = footer + "/footer.jsp";
        %>
        <jsp:include page="<%= footer%>"/> 
</html>
