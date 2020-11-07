<%-- 
    Document   : privada
    Created on : 19-oct-2020, 22:17:35
    Author     : mascport
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../capcalera.jsp"%>
        <%-- AQUÍ EN EL INCLUDE HAY QUE PONER EL "../" PORQUE ESTÁ EN OTRA CARPETA --%>
        <%
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            
            session.setAttribute("user", user);
            session.setAttribute("pass", pass);
            session.setAttribute("level", "1");
            System.out.println("SOSIG");
            
            response.setHeader("Location", request.getContextPath() + "/privat/privada.jsp");


            %>
        <h1>Estic a la secció privada</h1>
    </body>
</html>
