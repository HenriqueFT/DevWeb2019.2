<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>

<%@page import="util.FormataPreco"%>
<%@page import="modelos.Carrinho"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="modelos.Produto"%>
<%@page import="DAO.ProdutoDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/checkCookieCarrinho.jsp" %>

<%
    CarrinhoDAO carrinhoDAO = new CarrinhoDAO(idCarrinho);
    Carrinho carrinho = carrinhoDAO.getCarrinho(true);

    if (request.getParameter("id") != null) {
        if (request.getParameter("r") != null) {
            carrinho.removeDoCarrinho(Integer.parseInt(request.getParameter("id")));
            carrinhoDAO.removeDoCarrinho(Integer.parseInt(request.getParameter("id")));
        } else {
            carrinho.adicionarAoCarrinho(Integer.parseInt(request.getParameter("id")), 1);
            carrinhoDAO.updateCarrinho(carrinho);
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
        <table>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProdutoDAO produtoDAO = new ProdutoDAO();

                    Iterator it = carrinho.carrinho.entrySet().iterator();
                    while (it.hasNext()) {
                        HashMap.Entry pair = (HashMap.Entry)it.next();

                        Produto produto = produtoDAO.getProduto((Integer) pair.getKey());
                %>
                        <tr>
                            <td> <% out.println(produto.getNome()); %> </td>
                            <td> <% out.println(pair.getValue()); %> <a href='paginaCarrinho.jsp?id=<% out.println(produto.getId()); %>&r=1'> Remover</a> </td>
                            <td> <% out.println(FormataPreco.formata((float) produto.getPreco())); %> </td>
                        </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td>Total:</td>
                    <td></td>
                    <td><% out.println(FormataPreco.formata(carrinho.getPrecoTotal())); %></td>
                </tr>
            </tfoot>
        </table>

        <br>
        <a href='index.jsp'> Continuar comprando </a>
        <br>
        <a href='index.jsp'> Fechar compra </a>
    </body>
</html>


