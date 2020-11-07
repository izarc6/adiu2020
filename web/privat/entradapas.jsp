<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Form Using jQuery - Demo Preview</title>
        <meta name="robots" content="noindex, nofollow">
        <!-- Include CSS File Here -->
        <link rel="stylesheet" href="css/style.css"/>
        <!-- Include CSS File Here -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    </head>



    <body>

        <% /*
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            
            session.setAttribute("user", user);
            session.setAttribute("pass", pass);
            session.setAttribute("level", "1");
            System.out.println("SOSIG");
            
            response.setHeader("Location", request.getContextPath() + "/privat/entradapas.jsp");
            */
        %>

        <div class="container">
            <div class="main">
                <form class="form" method="post" action="#">
                    <h2>Create Login Form Using jQuery</h2>
                    <label>Username :</label>
                    <input type="text" name="uname" id="user">
                    <label>Password :</label>
                    <input type="password" name="password" id="pass">
                    <input type="button" name="login" id="login" value="Login" onclick="button1()">
                </form>
            </div>
        </div>

        <SCRIPT LANGUAGE="JavaScript">
            <!--
            function button1()
            {
                console.log("OMG WHAT");

                sessionStorage.user = document.getElementById("user").value;
                sessionStorage.pass = document.getElementById("pass").value;
                sessionStorage.level = "1";
                console.log("User es: " + document.getElementById("user").value);
                console.log("Password es: " + document.getElementById("pass").value);
                
                var user_val = document.getElementById("user").value;
                var pass_val = document.getElementById("pass").value;
                
                window.location="http://localhost:8080/PeliculesWeb20/privat/privada.jsp?user="+user_val+"&pass="+pass_val;

                

            }
            // --> 
        </SCRIPT>

    </body>
</html>