<%-- 
    Document   : privada
    Created on : 06-nov-2020, 23:11:30
    Author     : lisandrorocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        if (session.getAttribute("session") == null) {
            response.sendRedirect("http://localhost:8080/PeliculesWeb20/login.jsp");
        }
        %> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadísticas Actores - Privada</title>

        <!-- Imports necesarios para pie chart y nube -->
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/jquery.tagcanvas.min.js" type="text/javascript"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/maps/modules/exporting.js"></script>
        <script src="js/export-data.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                if (!$('#myCanvas').tagcanvas({
                    textColour: '#047AFB',
                    outlineThickness: 1,
                    outlineColour: '#000000',
                    maxSpeed: 0.03,
                    depth: 0.75
                }, 'tags')) {
                    $('#myCanvasContainer').hide();
                }
            });
        </script>
        
        <!-- Imports personalizados -->
        <script src="js/piechartprivada.js" type="text/javascript"></script>
    </head>
    <body>

        <!-- Cabecera -->
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
        <%-- <jsp:useBean id="bean" class="bean.LoginBean" scope="session"> --%>
        
        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Bienvenido/a a la parte privada</h2>
                    <p class="lead">En esta zona podrás ver información<br>más detallada sobre cada actor.</p>
                </div>
            </div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">

            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Nube de palabras</h2>
                    <p class="lead">Selecciona un actor para ver sus detalles.</p>
                </div>
                <div class="container" style="">
                    <div class="m-5">
                        <div id="myCanvasContainer">
                            <canvas class="border border-primary" width="500" height="300" id="myCanvas" style="background: #F8F9FA"></canvas>
                        </div>
                        <div id="tags">
                            <ul>
                                <li><a href="privada.jsp?persona=Robin Williams">Robin Williams</a></li>
                                <li><a href="privada.jsp?persona=Brad Pitt">Brad Pitt</a></li>
                                <li><a href="privada.jsp?persona=George Clooney">George Clooney</a></li>
                                <li><a href="privada.jsp?persona=Matt Damon">Matt Damon</a></li>
                                <li><a href="privada.jsp?persona=Ryan Reynolds">Ryan Reynolds</a></li>
                                <li><a href="privada.jsp?persona=Chris Evans">Chris Evans</a></li>
                                <li><a href="privada.jsp?persona=Paul Walker">Paul Walker</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Información detallada</h2>
                    <p class="lead">Aquí podrás ver la información detallada de cada actor que selecciones.</p>
                </div>
                <div class="container align-middle" style="">
                    <div class="m-5">
                        <h5 class="display-5">Nombre: <span id="nombreactor"></span></h5>
                        <p class="lead">
                            Año de nacimiento: <span id="nacimiento"></span><br>
                            Año de muerte: <span id="muerte"></span><br>
                            Nº de películas: <span id="npeliculas"></span>
                        </p>
                        <p></p>
                        <p></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Gráfico de tarta</h2>
                    <p class="lead">Aquí podrás visualizar la cantidad de películas que tiene un actor en compración a los otros.</p>
                    <div class="container" style="">
                        <div class="m-5">
                            <div>
                                <div id="esperaPie"></div>
                                <div id="pieContainer"></div>
                            </div>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
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
