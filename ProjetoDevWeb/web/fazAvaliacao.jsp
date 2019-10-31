<%@page import="DAO.UsuarioDAO"%>
<%@page import="DAO.AvaliacaoDAO"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Avaliacao"%>

<%
    Usuario usuLog = null;
    if(request.getSession().getAttribute("usuarioLogado") != null) {
        usuLog = (Usuario) request.getSession().getAttribute("usuarioLogado");
    }
    
    int nota = Integer.parseInt(request.getParameter("nota"));
    int idProduto = Integer.parseInt(request.getParameter("idProduto"));
    
    AvaliacaoDAO avaliacaoDAO = new AvaliacaoDAO();
    Avaliacao avaliacao = new Avaliacao();
    avaliacao.setIdProduto(idProduto);
    avaliacao.setNota(nota);
    avaliacao.setUserId(usuLog.getUserId());
    
    avaliacaoDAO.addAvaliacao(avaliacao);
%>

<h1>Obrigado pela avaliação!</h1>
<a href="index.jsp">Voltar à pagina inicial</a>