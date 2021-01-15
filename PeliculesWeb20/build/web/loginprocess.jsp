<%-- 
    Document   : loginprocess
    Created on : 09-ene-2021, 19:27:52
    Author     : lumalisan
--%>

<%@page import="bean.LoginDao"%>  
<jsp:useBean id="obj" class="bean.LoginBean"/>  

<jsp:setProperty property="*" name="obj"/>  

<%
    boolean status = LoginDao.validate(obj);
    if (status) {
        //out.println("You r successfully logged in");
        session.setAttribute("session", "TRUE");
        String redirectURL = "http://localhost:8080/PeliculesWeb20/privada.jsp";
        response.sendRedirect(redirectURL);
    } else {
        out.print("Sorry, email or password error"); 
%>  
<jsp:include page="login.jsp"></jsp:include>  
<%
    }
%>  
