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
        <title>Cadastro de Usuário</title>
    </head>
    <body>
        <h3>Ainda não possui uma conta?</h3>
        <h4>Insira suas informações abaixo:</h4>
        
        <form method="POST" action="UsuarioController" name="formAddUsuario" id="usuarioForm">
            <table class="tableForm">
                
                
            <tr>
                <td>Nome completo:</td>
                <td><input type="text" name="nomecompleto" maxlength="100" required></td>
            </tr>
            <tr>
                <td>CPF:</td>
                <td><input type="text" name="cpf" maxlength="11" minlength="11" required></td>
            </tr>
            <tr>
                <td>Senha: 
                <td><input type="password" name="senha" maxlength="20" required></td>
            </tr>
            <tr>
                <td>Confirme a senha: 
                <td><input type="password" name="senha_confirmacao" maxlength="20" required></td>
            </tr>
            <tr>
                <td>Endereço:
                <td><textarea name="endereco" rows="2" columns="20" required></textarea></td>
            <tr>
                <td>Cidade:
                <td><input type="text" name="cidade" maxlength="30" required></td>
            </tr>

        </table>
            
            <input type="submit" value="Enviar">
            
        </form>
        
        <h4>Já é cadastrado? <a href="UsuarioController?action=login">Faça login!</a>
        
    </body>
</html>
