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
        <title>Sociedade</title>
    </head>

    <body>
        <h1>1001 filmes para ver antes de morrermos numa guerra nuclear</h1>
        <%
            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> produtos = produtoDAO.getProdutos();
            Iterator<Produto> iProdutos = produtos.iterator();
        %>
        <table>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Descricao</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <%
                while (iProdutos.hasNext()) {
                    Produto produto = iProdutos.next();
            %>
            <tbody>
                <%out.println("<tr>");
                    out.println("<td>" + produto.getNome() + "</td>");
                    out.println("<td>" + produto.getDescricao() + "</td>");
                    out.println("<td>" + produto.getPreco() + "</td>");
            out.println("</tr>");%>

                <%
                    }
                %>
        </table>
        <% 

        
        %>
        <a href="paginaInsert.jsp">Inserir Item</a>
    </body>
</html>
