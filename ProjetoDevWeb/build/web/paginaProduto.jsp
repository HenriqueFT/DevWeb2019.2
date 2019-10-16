<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="modelos.Produto"%>

<!DOCTYPE html>
<html>
    <%
        ProdutoDAO crudProduto = new ProdutoDAO();
        Produto produto = crudProduto.getProduto(Integer.parseInt(request.getParameter("id")));
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% out.println("<title>Produto - " + produto.getNome() + "</title>"); %>
    </head>

    <body>
        <a href="paginaCarrinho.jsp">Carrinho (0)</a>
        <h1><% out.println(produto.getNome()); %></h1>
        <img src="<% out.println(produto.getImagem()); %>" width="90" height="120">
        <p>Preço: R$ <% out.println(produto.getPreco()); %></p>
        <button type="button">Adicionar ao carrinho</button>
        <h3>Sinopse:</h3>
        <p><% out.println(produto.getDescricao()); %></p>     
    </body>
</html>

