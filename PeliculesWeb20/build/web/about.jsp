<%-- 
    Document   : about
    Created on : 04-nov-2020
    Author     : Lisandro Rocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadísticas Actores - Sobre Nosotros</title>
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

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">

            <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">¿Necesitas una llamada?</h2>
                    <p class="lead">No dudes en contactarnos.</p>
                </div>
                <div class="jumbotron" style="opacity: 1; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">
                    <address>
                        <strong>Estadísticas Actores, Inc.</strong><br>
                        1355 Calle Velázquez, Puerta 45<br>
                        España, ES 94103<br>
                        <abbr title="Teléfono">Telf:</abbr> +34 697 567 938
                    </address>

                    <address>
                        <strong>Correo Electrónico</strong><br>
                        <a href="mailto:estadisticasactores@gmail.com">estadisticasactores@gmail.com</a>
                    </address>
                </div>
            </div>

            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="jumbotron" style="">
                    <h1 class="display-3">¿Precios?</h1>
                    <p class="lead">Disponemos diferentes planes para diferentes necesidades, no dudes en comprobar todas las opciones y verificar cual se adapta mejor a tu presupuesto.</p>
                    <hr class="my-4">
                    <p>Si quieres ver los precios disponibles, mira la sección "Precios", si aún tienes dudas, no tardes en contactarnos.</p>
                    <p class="lead">
                        <a class="btn btn-primary btn-lg" href="<%= request.getContextPath()%>/precios.jsp" role="button">Saber más</a>
                    </p>
                </div>
            </div>

        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">

            <div class="bg-primary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Nuestras Oficinas</h2>
                    <p class="lead">Disponemos de la mejor infraestructura y del hardware para realizar proyectos de calidad.</p>
                    <div class="container" style="">
                        <div class="m-5">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="<%= request.getContextPath()%>/imatges/oficina1.jpg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%= request.getContextPath()%>/imatges/oficina2.jpg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%= request.getContextPath()%>/imatges/oficina3.jpg" class="d-block w-100" alt="">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Lisandro Rocha</h2>
                    <p class="lead">Project Manager and Developer</p>
                    <div class="row" style=""></div></div>
                <img src="<%= request.getContextPath()%>/imatges/lisandro.jpg" width="100%" style="">
            </div>
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Izar Castorina</h2>
                    <p class="lead">Senior Developer and Programmer</p>
                </div>
                <img src="<%= request.getContextPath()%>/imatges/izar.jpg" width="100%" style="">
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery.slim.min.js"><\/script>')</script><script src="dist/js/bootstrap.bundle.min.js"></script>
</html>
