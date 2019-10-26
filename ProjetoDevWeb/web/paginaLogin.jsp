<%-- 
    Document   : paginaLoginOuCadastro
    Created on : 15/10/2019, 22:03:36
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h3>Bem vindo de volta!</h3>
        <h4>Insira suas informações para acessar sua conta.</h4>
        
        <form>
            <p>CPF:
            <input type="text" name="cpf" maxlength="11" minlength="11" required>
            </p>
            <p>Senha:
            <input type="password" id="senha" name="senha" maxlength="10" required>
            </p>
            <input type="submit" value="Entrar">
        </form>
        
        <h4>Não possui uma conta ainda? <a href="paginaCadastro.jsp">Cadastre-se!</a>
        
    </body>
</html>
