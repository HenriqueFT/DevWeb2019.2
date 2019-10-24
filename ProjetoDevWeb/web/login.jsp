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
        <h4>Entre!</h4>
        
        <%
            request.getSession().setAttribute("action", "login");
        %>
        
        <form  method="POST" action="UsuarioController" id="loginForm">
            <table class="tableForm">
                <tr>Nome de usuário:
                    <td><input type="text" name="nome" maxlength="15" required></td>
                </tr>
                <tr>Senha:
                    <td><input type="password" id="password" name="senha" maxlength="8" required></td>
                </tr>
                <input type="submit" value="Entrar">
            </table>
        </form>
        
        <br><br>
        <a href="index.jsp">Voltar a pagina principal</a>
    </body>
</html>
