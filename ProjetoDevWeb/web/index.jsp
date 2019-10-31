<%-- 
    Document   : index
    Created on : 08/10/2019, 19:07:11
    Author     : Usuario
--%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="modelos.Usuario"%>
<%@page import="util.FormataPreco"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="modelos.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%
        int pag=0;
        if(request.getParameter("pag")!= null){
            pag = Integer.parseInt(request.getParameter("pag")); 
        }
        %>
         
        <%
            Usuario usuLog= new Usuario();
            if(request.getSession().getAttribute("usuarioLogado")!=null){
                usuLog = (Usuario) request.getSession().getAttribute("usuarioLogado") ;
            }
        %>
        
        <%
            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> produtos = produtoDAO.getPagProdutos(pag);
            Iterator<Produto> iProdutos = produtos.iterator();
        %> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loja</title>
        
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        
        <script src="https://kit.fontawesome.com/c6f434d274.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <!-- Navbar basicamente se utilizando de cosias do bootstrap, eh utilizado em quase todas as paginas do site-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top my-nav">
            <div class="container-fluid">
                <!--Parte  que fica a esquerda como titulo-->
                <div class="navbar-header"> 
                    <a class="navbar-brand" href="index.jsp">
                        <img src="img/icon.png" alt="VHS" width="55">
                        Filmes Lindos
                    </a>
                </div>
                <!--Botoes de escolhas do usuario apenas com hrefs -->
                <div class="navbar-right" >
                    <div class="collapse navbar-collapse ">
                        <div class="navbar-nav">
                            <%if(usuLog.getIsAdm()==1){%>
                            <a href="ProdutoController?show=Produtos" data-toggle="tooltip" title="Banco de Dados"><span class="nav-item nav-link fas fa-database" ></span></a>
                            <%}%>
                            <a href="UsuarioController?action=login" data-toggle="tooltip" title="Login"><span class="nav-item nav-link fas fa-door-open"></span></a>
                            <a href="UsuarioController?action=showUsuario" data-toggle="tooltip" title="Perfil"><span class="nav-item nav-link fas fa-user"></span></a>
                            <a href="paginaCarrinho.jsp" data-toggle="tooltip" title="Carrinho"><span class="nav-item nav-link fas fa-shopping-cart"></span></a>
                        </div>                   
                    </div> 
                </div>
            </div>
        </nav>
  
        <div class="midBody">
            <div class="exibeProdutos container-fluid">
                <table class="filmes">
                <!--Enquanto possuir produtos no iterator ele vai colocar em tela sua foto,Link para a pagina do produto,suadescricao,preco e possibilidade de adicionar no carrinho -->
                <%
                    while (iProdutos.hasNext()) {
                        Produto produto = iProdutos.next();
                %>
                    <tbody>
                    <%
                        out.println("<tr>");
                        out.println("<td style='min-width:50px '><img src='img/" + produto.getImagem()+ "' width='180' height='240'></td>");
                        out.println("<td style='min-width:150px; text-align:center; '><a href='paginaProduto.jsp?id=" + produto.getId() + "'>" + produto.getNome() + "</a></td>");
                        out.println("<td><p class='text-justify'>" + produto.getDescricao() + "</p></td>");
                        //out.println("<td class='col-8 text-truncate' style='min-width:250px; max-width:750px; text-align:center;'>" + produto.getDescricao() + "</td>");
                        out.println("<td style='min-width:100px;text-align:center;'>" + FormataPreco.formata((int) produto.getPreco()) + "</td>");
                        out.println("<td style='min-width:100px;text-align:center;'><a href='paginaCarrinho.jsp?id="+produto.getId() + "'>Adicionar ao carrinho</a></td>");
                        out.println("</tr>");
                    %>
                    </tbody>
                    <%
                        }
                    %>
                </table>
            </div>
            
            <!--Controle de paginacao, pega o parametro pag e se der ele continua, apenas mudando um Href-->
            <div class="pagB row container-fluid">
                <div class="col">
                <%
                    if(pag!=0){
                    int antes = pag-1; 
                    out.println("<a href=\"index.jsp?pag="+antes+"\" >");
                    out.println("<button type=\"button\" class=\"btn btn-secondary\">Anterior</button>");
                    out.println("</a>");
                    }
                %>
                </div>
                <div class="col">
                <%    
                    if(pag!=produtoDAO.ultimaPagina()){
                    int depois  = pag+1;
                    out.println("<a href=\"index.jsp?pag="+depois+"\" >");
                    out.println("<button type=\"button\" class=\"btn btn-secondary\">Proximo</button>");
                    out.println("</a>");
                    }
                %>
                </div>
            </div>   
        </div>
    </body>
</html>
