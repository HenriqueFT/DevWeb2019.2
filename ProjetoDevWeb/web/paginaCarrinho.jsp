<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>

<%@page import="modelos.Carrinho"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="modelos.Produto"%>
<%@page import="DAO.ProdutoDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/checkCookieCarrinho.jsp" %>

<%
    CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
    Carrinho carrinho = carrinhoDAO.getCarrinho(idCarrinho, true);

    carrinho.adicionarAoCarrinho(Integer.parseInt(request.getParameter("id")), 1);
    carrinhoDAO.updateCarrinho(carrinho);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
        <h1> <% out.println(idCarrinho); %> </h1>
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
                            <% out.println("<td>" + produto.getNome() + "</td>"); %>
                            <% out.println("<td>" + pair.getValue() + "</td>"); %>
                            <% out.println("<td>" + produto.getPreco() + "</td>"); %>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>


