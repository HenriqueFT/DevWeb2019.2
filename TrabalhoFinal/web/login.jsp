<%-- 
    Document   : login
    Created on : Nov 6, 2017, 5:45:34 PM
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Tela de Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="script.js"></script>
    </head>
    <body>
        <div>Por favor entre com o Usuario e Senha</div> <br><br>
        <form action="LoginCheck" method="post">
            Nome <input type="text" name="nome" placeholder="Digite seu Usuario"> <br>
            Senha <input type="password" name="senha" placeholder = "Digite sua Senha"><br><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>

