<%-- 
    Document   : BancoDeDados
    Created on : Oct 16, 2019, 8:27:36 PM
    Author     : Henrique
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco</title>
    </head>
    <body>
        <h1>Bem vindo ao banco</h1>
        <table>
            <tbody>
                <tr>
                    <th><a href="ProdutoController?show=Produtos">Produtos</a></th>
                    <th><a href="UsuarioController?show=Usuarios">Usuarios</a></th>
                    <th></th>
                </tr>
            </tbody>
        </table>
        <% String s = (String) request.getAttribute("show");
            if(s.equals("Produtos")){ %>
        <a href="ProdutoController?action=insert&id=0">Inserir Item</a><br>
        <table class='tableList'>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Descricao</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ProdutoDAO}" var="produto">
                    <tr>
                        <th><c:out value="${produto.nome}" /></th>
                        <th><c:out value="${produto.descricao}" /></th>
                        <th><c:out value="${produto.preco}" /></th>
                        <!--TEM QUE  ATUALIZAR AQUI PARA VER O ID PRA VERSE EH ADM,olhando a sessao-->
                        <th><a href="ProdutoController?action=update&id=<c:out value="${produto.id}"/>">Update</a></th>
                        <th><a href="ProdutoController?action=delete&id=<c:out value="${produto.id}"/>">Delete</a></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%} else if(s.equals("Usuarios")) { %>
        <a href="UsuarioController?action=insert&id=0">Novo Usuario</a><br>
        <table class='tableList'>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Descricao</th>
                    <th>Preço</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach items="${UsuarioDAO}" var="usuario">
                    <tr>
                        <th><c:out value="${usuario.nome}" /></th>
                        <th><c:out value="${usuario.cpf}" /></th>
                        <th><c:out value="${usuario.isAdm}" /></th>
                        <th><c:out value="${usuario.cidade}" /></th>
                        <th><c:out value="${usuario.endereco}" /></th>
                        <th><c:out value="${usuario.nFuncionario}" /></th>
                        <!--TEM QUE  ATUALIZAR AQUI PARA VER O ID PRA VERSE EH ADM,olhando a sessao-->
                        <th><a href="UsuarioController?action=update&id=<c:out value="${usuario.id}"/>">Update</a></th>
                        <th><a href="UsuarioController?action=delete&id=<c:out value="${usuario.id}"/>">Delete</a></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <%}%>
    </body>
</html>
