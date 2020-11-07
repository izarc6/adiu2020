<%-- 
    Document   : capcalera
    Created on : 06-nov-2019, 15:29:53
    Author     : dsst
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            * {box-sizing: border-box;}

            body { 
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            .header {
                overflow: hidden;
                background-color: #f1f1f1;
                padding: 20px 10px;
            }

            .header a {
                float: left;
                color: black;
                text-align: center;
                padding: 12px;
                text-decoration: none;
                font-size: 18px; 
                line-height: 25px;
                border-radius: 4px;
            }

            .header a.logo {
                font-size: 25px;
                font-weight: bold;
            }

            .header a:hover {
                background-color: #ddd;
                color: black;
            }

            .header a.active {
                background-color: dodgerblue;
                color: white;
            }

            .header-right {
                float: right;
            }

            @media screen and (max-width: 500px) {
                .header a {
                    float: none;
                    display: block;
                    text-align: left;
                }

                .header-right {
                    float: none;
                }
            }
        </style>
    </head>
    <body>

        <%
            // Si es una página de la intranet y no permiso redirecciona al inicio
            String s = request.getRequestURI(); // Devuelve URL de consulta
            String servletlloc = request.getContextPath();  // Devuelve URL base (localhost:8080)
            if ((s.startsWith(servletlloc + "/privat/") // Si se intenta acceder a una página privada
                    && (!(s.contains("/entradapas.jsp"))))) {
                System.out.println("DEBUG - Intentando acceder a página privada");
                String user = (String) session.getAttribute("user");    // Coje user y pass para comprobar
                String pass = (String) session.getAttribute("pass");    // Son objetos de sesión
                System.out.println("DEBUG - Entrado con user " + user + " y password " + pass);

                if ((user == null) || (pass == null)) {     // Si no están definidos
                    out.println(s + "    " + servletlloc);
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", request.getContextPath() + "/index.jsp");    // Redirecciona a home
                } else {
                    String level = (String) session.getAttribute("level");
                    if (Integer.parseInt(level) > 1) {       // Redirecciona a home también si el nivel es > que 1
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", request.getContextPath() + "/index.jsp");
                    }
                }
            }
        %>


        <div class="header">
            <a href="<%= request.getContextPath()%>" class="logo">
                <img alt="Company Logo" src="<%= request.getContextPath()%>/imatges/logo.jpeg" width="100%" height="30%">
            </a>
            <div class="header-right">
                <a class="active" href="<%= request.getContextPath()%>">Home</a>
                <a href="<%= request.getContextPath()%>/contact.jsp">Contact</a>
                <a href="<%= request.getContextPath()%>/about.jsp">About</a>
            </div>
        </div>

        <div style="padding-left:20px">
            <h1>Date: <%= (new Date()).toString()%> <br> </h1>
            <hr>
        </div>
    </body>
</html>
