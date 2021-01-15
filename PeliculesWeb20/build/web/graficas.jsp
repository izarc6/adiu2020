<%-- 
    Document   : graficas
    Created on : 05-nov-2020, 13:09:56
    Author     : lisandrorocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Estadísticas Actores - Gráficas</title>

        <!-- Imports necesarios para los gráficos -->
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.6/proj4.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/maps/modules/map.js"></script>
        <script src="http://code.highcharts.com/maps/modules/exporting.js"></script>
        <script src="js/offline-exporting.js"></script>
        <script src="https://code.highcharts.com/mapdata/countries/es/es-all.js"></script>
        <script src="https://code.highcharts.com/mapdata/custom/world.js"></script>
        <script src="js/export-data.js"></script>

        <!-- Imports personalizados -->
        <script src="js/barchart.js" type="text/javascript"></script>
        <script src="js/piechart.js" type="text/javascript"></script>
        <script src="js/worldMap.js" type="text/javascript"></script>
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

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Gráficos de alta calidad</h2>
                    <p class="lead">Aquí solo encontrarás buenos gráficos.</p>

                    <div class="row" style="">
                        <div class="col-sm-4">
                            <h3>Utilizamos la mejor libreria de gráficos
                                <div><br></div>
                                <div><img src="imatges/logoHC.png" heigh="150" width="150" style=""></div>
                            </h3>
                        </div>
                        <div class="col-sm-4 col-5">
                            <h3>Incluye diferentes tipos de mapas
                                <div><br></div>
                                <div><img src="imatges/graficas.png" heigh="150" width="150" style=""></div>
                            </h3>
                        </div>
                        <div class="col-sm-4">
                            <h3>Calidad asegurada
                                <div><br></div>
                                <div><img src="imatges/calidad.png" heigh="150" width="150" style=""></div>
                            </h3>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Gráfico de tarta<hr style=""></h2>
                    <p class="lead">Aquí podrás visualizar el porcentaje de actores por edad.</p>
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
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Gráfico de barras<hr style=""></h2>
                    <p class="lead">Aquí podrás visualizar la cantidad de películas que tiene cada actor.</p>
                    <div class="container" style="">
                        <div class="m-5">
                            <div>
                                <div id="esperaBar"></div>
                                <div id="barContainer"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">

            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Selector de país<hr style=""></h2>
                    <p class="lead">Aquí podrás elegir la nacionalidad de los actores para que se muestren en las otras gráficas.</p>
                    <div class="container" style="">
                        <div class="m-5">
                            <div>

                                <div class="row" style="">
                                    <div class="col-sm-4">
                                        <label class="checkbox" style="">
                                            <input id="esp" type="checkbox"
                                                   onclick="checkbox('es', 'Madrid');"> España 
                                        </label>
                                    </div>
                                    <div class="col-sm-4 col-5">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('fr', 'Paris');"> Francia 
                                        </label>
                                    </div>
                                    <div class="col-sm-4">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('us', 'Washington');"> EEUU
                                        </label>
                                    </div>
                                </div>

                                <div class="row" style="">
                                    <div class="col-sm-4">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('it', 'Roma');"> Italia 
                                        </label>
                                    </div>
                                    <div class="col-sm-4 col-5">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('ar', 'Buenos Aires');"> Argentina 
                                        </label>
                                    </div>
                                    <div class="col-sm-4">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('au', 'Canberra');"> Australia
                                        </label>
                                    </div>
                                </div>

                                <div class="row" style="">
                                    <div class="col-sm-4">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('ca', 'Ottawa');"> Canadá 
                                        </label>
                                    </div>
                                    <div class="col-sm-4 col-5">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('de', 'Berlin');"> Alemania 
                                        </label>
                                    </div>
                                    <div class="col-sm-4">
                                        <label class="checkbox" style="">
                                            <input type="checkbox"
                                                   onclick="checkbox('pt', 'Lisboa');"> Portugal
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Mapa del mundo<hr style=""></h2>
                    <p class="lead">Aquí podrás ver la capital del país que selecciones.</p>
                    <div class="container" style="">
                        <div class="m-5">
                            <div>
                                <div id="esperaMapa"></div>
                                <div id="mapContainer"></div>
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
