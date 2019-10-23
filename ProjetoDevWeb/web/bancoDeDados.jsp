<%-- 
    Document   : BancoDeDados
    Created on : Oct 16, 2019, 8:27:36 PM
    Author     : Henrique
--%>
<%@page import="java.util.Enumeration"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco</title>
        
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        
        <script src="https://kit.fontawesome.com/c6f434d274.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="topBody ">
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
                                <a href="#" data-toggle="tooltip" title="Login"><span class="nav-item nav-link fas fa-door-open"></span></a>
                                <a href="#" data-toggle="tooltip" title="Perfil"><span class="nav-item nav-link fas fa-user"></span></a>
                                <a href="#" data-toggle="tooltip" title="Carrinho"><span class="nav-item nav-link fas fa-shopping-cart"></span></a>
                            </div>                   
                        </div> 
                    </div>
                </div>
            </nav>
            <div class="options container">
                <a href="ProdutoController?show=Produtos">
                    <button type="button" class="btn btn-secondary">Produtos</button>
                </a>
                <a href="ProdutoController?show=Usuarios">
                    <button type="button" class="btn btn-secondary">Usuarios</button>
                </a>
            </div>
        </div>

        <%
            String show = "";

            if(request.getAttribute("show")==null){
                System.out.println("Cuidado Show estava nulo");
                show = "Produtos";
            }else{
                show = (String) request.getAttribute("show");
                System.out.println("Show possuia: "+show);
            }
            
            if(show.equalsIgnoreCase("Produtos")){
        %>
        
        
        <div class="tabelasBanco container-fluid">
            <a href="ProdutoController?action=insert&id=0">
                  <button type="button" class="btn btn-warning btn-thin btn-insert">Inserir Item</button>
            </a><br>
            <table class='tableList'>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Descricao</th>
                        <th>Preço</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ProdutoDAO}" var="produto">
                        <tr>
                            <th><c:out value="${produto.nome}" /></th>
                            <th><c:out value="${produto.descricao}" /></th>
                            <th><c:out value="${produto.preco}" /></th>
                            <!--TEM QUE  ATUALIZAR AQUI PARA VER O ID PRA VERSE EH ADM,olhando a sessao-->
                            <th><a href="ProdutoController?action=update&id=<c:out value="${produto.id}"/>">Update</a></th>
                            <th><a href="ProdutoController?action=delete&id=<c:out value="${produto.id}"/>">Delete</a></th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%
        }else if(show.equalsIgnoreCase("Usuarios")){
        %>
            <div class="tabelasBanco container-fluid">
                <h1>Exibe Usuario ainda nao implementado</h1>
            </div>
        <%
        }else{
            System.out.println("ERRO: Show possuia algo nao implementado");
        }
        %>
        <script src="style/jquery-3.4.1.min.js"></script>
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
