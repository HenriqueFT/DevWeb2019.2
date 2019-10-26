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
        
        <form>
            <p>
                Nome completo:
                <input type="text" name="nomecompleto" maxlength="100" required>
            </p>
            
            <p>
                CPF:
                <input type="text" name="cpf" maxlength="11" minlength="11" required>
            </p>
            
            <p>
                Senha: 
                <input type="password" name="senha" maxlength="20" required>
            </p>
            
            <p>
                Confirme a senha: 
                <input type="password" name="senha_confirmacao" maxlength="20" required>
            </p>
            
            <p>
                Endereço:
                <textarea name="endereco" rows="2" columns="20" required></textarea>
            </p>
            
            <p>
                Cidade:
                <input type="text" name="cidade" maxlength="30" required>
            </p>
            

            <input type="submit" value="Enviar">
            
        </form>
        
        <h4>Já é cadastrado? <a href="paginaLogin.jsp">Faça login!</a>
        
    </body>
</html>
