<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="util.FormataPreco"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="modelos.Produto"%>
<%@page import="modelos.Carrinho"%>
<%@page import="DAO.CarrinhoDAO"%>

<%@include file="include/checkCookieCarrinho.jsp" %>

<%
    CarrinhoDAO carrinhoDAO = new CarrinhoDAO(idCarrinho);
    Carrinho carrinho = carrinhoDAO.getCarrinho(true);
%>

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
        <a href="paginaCarrinho.jsp">Carrinho <% out.println("(" + carrinho.getQtdItens() + ")"); %></a>
        <h1><% out.println(produto.getNome()); %></h1>
        <img src="<% out.println(produto.getImagem()); %>" width="90" height="120">
        <p>Preço: <% out.println(FormataPreco.formata((float) produto.getPreco())); %></p>
        <a href='paginaCarrinho.jsp?id=<% out.println(produto.getId()); %>'>Adicionar ao carrinho</a>
        <h3>Sinopse:</h3>
        <p><% out.println(produto.getDescricao()); %></p>     
    </body>
</html>

