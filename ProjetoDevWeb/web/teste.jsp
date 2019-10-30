<%-- 
    Document   : teste
    Created on : 29/10/2019, 22:04:27
    Author     : loivo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        out.println("<form action=\"listaDeProdutos.jsp?id=0\" method=\"post\">");
        out.println("<input type=\"submit\" value=\"Entrar\">");
        out.println("</form>");
         %>
    </body>
</html>
