<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="crud.CrudProduto"%>
<%@page import="modelos.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
  
    <body>
        <h1>Hello mundo</h1>
        <%
            CrudProduto crudProduto = new CrudProduto();
            List<Produto> produtos = crudProduto.getProdutos();
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
            while(iProdutos.hasNext()){
                Produto produto = iProdutos.next();
        %>
            <tbody>
            <%
                out.println( "<tr>" );
                out.println( "<td><a href='paginaProduto.jsp?id=" + produto.getId() + "'>" + produto.getNome() +  "</a></td>");
                out.println( "<td>" +produto.getDescricao()+  "</td>");
                out.println( "<td>" +produto.getPreco()+  "</td>");
                out.println( "</tr>" );
            %>
            </tbody>
        <%
            }
        %>
        </table>
    </body>
</html>
