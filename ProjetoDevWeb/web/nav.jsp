    <%@page import="modelos.Usuario"%>
<%
        Usuario usuLog= new Usuario();
        if(request.getSession().getAttribute("usuarioLogado")!=null){
            usuLog = (Usuario) request.getSession().getAttribute("usuarioLogado") ;
        }
    %>

<% out.println("<nav class='navbar navbar-expand-md navbar-dark bg-dark fixed-top my-nav'><div class='container-fluid'><div class='navbar-header'> <a class='navbar-brand' href='index.jsp'> <img src='img/icon.png' alt='VHS' width='55'>Seu Perfil Lindo</a></div><button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'><span class='navbar-toggler-icon bg-light'></span></button><div class='navbar-right'><div class='collapse navbar-collapse '><div class='navbar-nav'>");%>
                        
                            <%if(usuLog.getIsAdm()==1){%>
<% out.println("<a href='ProdutoController?show=Produtos' data-toggle='tooltip' title='Banco de Dados'><span class='nav-item nav-link fas fa-database' ></span></a>");%>
                            <%}%>
                          
<%out.println("<a href='UsuarioController?action=login' data-toggle='tooltip' title='Login'><span class='nav-item nav-link fas fa-door-open'></span></a><a href='UsuarioController?action=showUsuario' data-toggle='tooltip' title='Perfil'><span class='nav-item nav-link fas fa-user'></span></a><a href='paginaCarrinho.jsp' data-toggle='tooltip' title='Carrinho'><span class='nav-item nav-link fas fa-shopping-cart'></span></a></div></div></div></div></nav>");%>