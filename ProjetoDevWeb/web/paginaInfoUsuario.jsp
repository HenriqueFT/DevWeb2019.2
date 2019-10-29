<%-- 
    Document   : paginaInfoUsuario
    Created on : 29/10/2019, 19:06:55
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Produto"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="modelos.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
        UsuarioDAO crudUsuario = new UsuarioDAO();
        Usuario usuario = crudUsuario.getUsuario(1);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% out.println("<title>Perfil do Usuario: - " + usuario.getNome() + "</title>"); %>
    </head>
    <body>
        <h1><% out.println(usuario.getNome()); %></h1>
        <h1><% out.println(usuario.getEmail()); %></h1>
        <h1><% out.println(usuario.getEndereco()); %></h1>
        
        <div class="midBody">
            <div class="container-fluid">
                <%
                    ProdutoDAO produtoDAO = new ProdutoDAO();
                    List<Produto> produtos = produtoDAO.getProdutos();
                    Iterator<Produto> iProdutos = produtos.iterator();
                %>
                <table class="filmes">
                <%
                    while (iProdutos.hasNext()) {
                        Produto produto = iProdutos.next();
                %>
                    <tbody>
                    <%
                        out.println("<tr>");
                        out.println("<td style='min-width:50px'><img src='img/" + produto.getImagem()+ "' width='120' height='180'></td>");
                        out.println("<td style='min-width:150px '><a href='paginaProduto.jsp?id=" + produto.getId() + "'>" + produto.getNome() + "</a></td>");
                        out.println("</tr>");
                    %>
                    </tbody>
                        <%
                            }
                        %>
                </table>
                <% 


                %>

            </div>
        </div>
    </body>
</html>