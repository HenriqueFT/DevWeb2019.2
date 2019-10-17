<%-- 
    Document   : index
    Created on : 08/10/2019, 19:07:11
    Author     : Usuario
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="modelos.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loja</title>
    </head>

    <body>
        <h1>Loja</h1>
        <br>
        <a href="ProdutoController?">Banco de  Dados</a>
        <br><br>
        <%
            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> produtos = produtoDAO.getProdutos();
            Iterator<Produto> iProdutos = produtos.iterator();
        %>
        <table>
            <!--- <thead>
                <tr>
                    <th>Nome</th>
                    <th>Descricao</th>
                    <th>Preço</th>
                </tr>
            </thead> --->
        <%
            while (iProdutos.hasNext()) {
                Produto produto = iProdutos.next();
        %>
            <tbody>
            <%
                out.println("<tr>");
                out.println("<td style='min-width:50px'><img src='" + produto.getImagem() + "' width='40' height='60'></td>");
                out.println("<td style='min-width:150px'><a href='paginaProduto.jsp?id=" + produto.getId() + "'>" + produto.getNome() + "</a></td>");
                out.println("<td style='min-width:250px'>" + produto.getDescricao() + "</td>");
                out.println("<td style='min-width:50px'>R$" + produto.getPreco() + "</td>");
                out.println("<td style='min-width:100px'><a href='paginaCarrinho.jsp?id="+produto.getId() + "'>Adicionar ao carrinho</a></td>");
                out.println("</tr>");
            %>

                <%
                    }
                %>
        </table>
        <% 

        
        %>

    </body>
</html>
