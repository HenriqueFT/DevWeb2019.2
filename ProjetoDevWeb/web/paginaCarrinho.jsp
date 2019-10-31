<%@page import="modelos.Usuario"%>
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
    <%
        Usuario usuLog= new Usuario();
        if(request.getSession().getAttribute("usuarioLogado")!=null){
            usuLog = (Usuario) request.getSession().getAttribute("usuarioLogado") ;
        }
    %>
    
    <head>
        <title>Carrinho</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        
        <script src="https://kit.fontawesome.com/c6f434d274.js" crossorigin="anonymous"></script>
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
                           <%if(usuLog.getIsAdm()==1){%>
                           <a href="ProdutoController?show=Produtos" data-toggle="tooltip" title="Banco de Dados"><span class="nav-item nav-link fas fa-database" ></span></a>
                           <%}%>
                           <a href="UsuarioController?action=login" data-toggle="tooltip" title="Login"><span class="nav-item nav-link fas fa-door-open"></span></a>
                           <a href="paginaInfoUsuario.jsp" data-toggle="tooltip" title="Perfil"><span class="nav-item nav-link fas fa-user"></span></a>
                           <a href="paginaCarrinho.jsp" data-toggle="tooltip" title="Carrinho"><span class="nav-item nav-link fas fa-shopping-cart"></span></a>
                       </div>                   
                   </div> 
               </div>
           </div>
       </nav>
                           
        <div class="carStyle midBody container-fluid">                   
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
            <%
                if(usuLog.getCpf()!=null){
                    out.println("<a href=\"CarrinhoController?action=finaliza&id=" + idCarrinho + "\"> Fechar compra </a>");
                }else{
                    out.println("<h4>Por favor faca login para finalizar acompra, depois volte aqui</h4>");
                }
            %>

            
        </div> 
         
        
    </body>
</html>


