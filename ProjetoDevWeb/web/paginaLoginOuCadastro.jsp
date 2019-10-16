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
        <title>Você é novo por aqui?</title>
    </head>
    <body>
        <h3>Já tem cadastro?</h3>
        <h4>Entre!</h4>
        
        <form> <!-- TODO: botar isso como tabela pra ficar menos feio -->
            <p>Nome de usuário:
            <input type="text" name="username" maxlength="15" required>
            </p>
            <p>Senha:
            <input type="password" id="password" name="password" maxlength="8" required>
            </p>
            <input type="submit" value="Entrar">
        </form>
        
        <br>
        <hr width="500" align="left">
        <br>
        
        <h3>Ainda não possui uma conta?</h3>
        <h4>Insira suas informações abaixo:</h4>
        
        
        <form>
            <p>
                Nome completo:
                <input type="text" name="fullname" maxlength="100" required>
            </p>
            
            <p>
                Nome de usuário:
                <input type="text" name="username" maxlength="20" required>
            </p>
            
            <p>
                E-mail:
                <input type="email" name="email" required>
            </p>
            
            <p>
                Senha: 
                <input type="password" name="password" required>
            </p>
            
            <p>
                Senha: 
                <input type="password" name="password_confirmation" required>
            </p>
            
            <p>
                Endereço:
                <textarea name="address" rows="2" columns="20" required></textarea>
            </p>

            <input type="submit" value="Enviar">
            
            
            
        </form>
        
    </body>
</html>
