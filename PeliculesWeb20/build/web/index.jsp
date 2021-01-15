<%-- 
    Document   : index
    Created on : 04-nov-2020
    Author     : Lisandro Rocha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Estadísticas Actores - Inicio</title>
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

            if (request.getParameter("logout") != null) {
                System.out.println(request.getParameter("logout"));
                if (request.getParameter("logout").equals("true")) {
                    session.removeAttribute("session");
                }
            }
        %>
        <jsp:include page="<%= lloc%>"/> 

        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
            <div class="col-md-5 p-lg-5 mx-auto my-5">
                <h1 class="display-4 font-weight-normal">Estadísticas de Actores</h1>
                <p class="lead font-weight-normal">
                    Disponemos de los datos más actualizados sobre información de actores de todo el mundo. <br>
                    Mediante gráficas detalladas podrás ver todo tipo de estadísticas como actores por edad, por sexo, por país, entre otros.
                </p>
                <a class="btn btn-outline-secondary" href="<%= request.getContextPath()%>/graficas.jsp">Visualizar estadísticas</a>
            </div>
            <div class="product-device shadow-sm d-none d-md-block"></div>
            <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Hecha con Boostrap 4</h2>
                    <p class="lead">La mejor libreria web.</p>
                </div>
                <div class="mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
                    <img alt="Boostrap4" src="<%= request.getContextPath()%>/imatges/Bootstrap.png" width="30%">
                </div>
            </div>
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Highcharts</h2>
                    <p class="lead">Para sacar el mejor rendimiento a nuestros gráficos.</p>
                </div>
                <div class="mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
                    <img alt="Highcharts" src="<%= request.getContextPath()%>/imatges/Highcharts.png" width="69%">
                </div>
            </div>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">MAMP</h2>
                    <p class="lead">Para potenciar el desarrollo en servidor.</p>
                </div>
                <div class="mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
                    <img alt="MAMP" src="<%= request.getContextPath()%>/imatges/Mamp.png" width="30%">
                </div>
            </div>
            <div class="bg-primary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">Java Enterprise Edition</h2>
                    <p class="lead">Because Java BEANS its the future.</p>
                </div>
                <div class="mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
                    <img alt="Java" src="<%= request.getContextPath()%>/imatges/Java.png" width="60%">
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
