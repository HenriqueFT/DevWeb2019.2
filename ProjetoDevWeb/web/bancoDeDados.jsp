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
        
        <a href="ProdutoController?action=insert&id=0">Inserir Item</a><br>
    </body>
</html>
