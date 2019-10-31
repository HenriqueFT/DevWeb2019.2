<%-- 
    Document   : pleaseLogin
    Created on : Oct 29, 2019, 12:19:59 PM
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Not Logged</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <div class="basicPage container-fluid" style="text-align: center">
            <h1>Voce nao pode vir aqui sem login, faca login ou cadastro</h1>
            <br>
            <a style="text-align: center" href="UsuarioController?action=login" >Faça login!</a>
            <br>
            <a style="text-align: center" href="UsuarioController?action=insert">Cadastre-se!</a>
        </div>
    </body>
</html>

