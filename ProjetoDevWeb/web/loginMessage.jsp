
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        <title>Login Message</title>
    </head>
    <body>
        <div class="basicPage container-fluid" style="text-align: center">
        <%
            String ls = (String) request.getAttribute("loginSucess");

            if(ls.equals("true")){
        %>

        <h1>SEJA BEM VINDO</h1>

        <a href="index.jsp">Voltar a Pagina inicial</a>

        <%
            }else{
        %>

        <h1>Erro no Login</h1>

        <a  href="paginaLogin.jsp">Tente Logar novamente</a> 
        <br>
        <a  href="index.jsp">Voltar a Pagina inicial</a>

        <%}%>
        </div>
    </body>
</html>
