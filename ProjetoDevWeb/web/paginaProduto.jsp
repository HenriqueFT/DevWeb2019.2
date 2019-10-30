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
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        
        <script src="https://kit.fontawesome.com/c6f434d274.js" crossorigin="anonymous"></script>
        
        <% out.println("<title>Produto - " + produto.getNome() + "</title>"); %>
    </head>

    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top my-nav">
            <div class="container-fluid">
                <div class="navbar-header"> 
                    <a class="navbar-brand" href="index.jsp">
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
                            <a href="UsuarioController?action=login" data-toggle="tooltip" title="Login"><span class="nav-item nav-link fas fa-door-open"></span></a>
                            <a href="paginaInfoUsuario.jsp" data-toggle="tooltip" title="Perfil"><span class="nav-item nav-link fas fa-user"></span></a>
                            <a href="paginaCarrinho.jsp" data-toggle="tooltip" title="Carrinho"><span class="nav-item nav-link fas fa-shopping-cart"></span></a>
                        </div>                   
                    </div> 
                </div>
            </div>
        </nav>
        
        <div class="options container">
            <a href="paginaCarrinho.jsp">
                <button type="button" class="btn btn-secondary">Carrinho <% out.println("(" + carrinho.getQtdItens() + ")"); %></button>
            </a>
        </div>
        
        
        <div class="midBody container-fluid">
            <h1 class="tituloFilme"><% out.println(produto.getNome()); %></h1>
            <div class="row">
                <div class="col-sm-2">
                    <img src="img/<% out.println(produto.getImagem()); %>">
                </div>
                
                <div class="col-sm-8">
                    <p class="text-justify"><% out.println(produto.getDescricao()); %></p>
                </div>
                
            </div>
            <p>Preço: <% out.println(FormataPreco.formata((float) produto.getPreco())); %></p>
            <a href='paginaCarrinho.jsp?id=<% out.println(produto.getId()); %>'>
                <button type="button" class="btn btn-secondary">Adicionar ao carrinho</button>
            </a>
        </div>
        

        
        <script src="style/jquery-3.4.1.min.js"></script>
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

