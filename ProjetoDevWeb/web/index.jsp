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
        
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        
        <script src="https://kit.fontawesome.com/c6f434d274.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top my-nav">
            <div class="container-fluid">
                <div class="navbar-header"> 
                    <a class="navbar-brand" href="#">
                        <img src="img/icon.png" alt="VHS" width="55">
                        Filmes Lindos
                    </a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon bg-light"></span>
                </button>
                <div class="navbar-right">
                    <div class="collapse navbar-collapse ">
                        <div class="navbar-nav">
                            <a href="ProdutoController?show=Produtos" data-toggle="tooltip" title="Banco de Dados"><span class="nav-item nav-link fas fa-database" ></span></a>
                            <a href="paginaLogin.jsp" data-toggle="tooltip" title="Login"><span class="nav-item nav-link fas fa-door-open"></span></a>
                            <a href="#" data-toggle="tooltip" title="Perfil"><span class="nav-item nav-link fas fa-user"></span></a>
                            <a href="#" data-toggle="tooltip" title="Carrinho"><span class="nav-item nav-link fas fa-shopping-cart"></span></a>
                        </div>                   
                    </div> 
                </div>
            </div>
        </nav>
        
        <div class="midBody">
            <div class="exibeProdutos">
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
                        out.println("<td style='min-width:50px'><img src='img/" + produto.getImagem() + "' width='40' height='60'></td>");
                        out.println("<td style='min-width:150px'><a href='paginaProduto.jsp?id=" + produto.getId() + "'>" + produto.getNome() + "</a></td>");
                        out.println("<td style='min-width:250px'>" + produto.getDescricao() + "</td>");
                        out.println("<td style='min-width:50px'>R$" + produto.getPreco() + "</td>");
                        out.println("<td style='min-width:100px'><a href='paginaCarrinho.jsp?id="+produto.getId() + "'>Adicionar ao carrinho</a></td>");
                        out.println("</tr>");
                    %>
                    <tbody>
                        <%
                            }
                        %>
                </table>
                <% 


                %>

            </div>
        </div>
        
        
        <script src="style/jquery-3.4.1.min.js"></script>
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
