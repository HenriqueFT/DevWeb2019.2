<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--
Esta pagina nao esta feita por completo apenas para testes

-->








<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forms</title>
    </head>
    <body>
        <% if(request.getAttribute("usuario") != null || request.getAttribute("usuario") == null ){ %>
        <h1>Adicione ou inclua</h1>
        <form method="POST" action="UsuarioController" name="formAddUsuario" id="usuarioForm">
            <table class="tableForm">
                <!--ID Nome Descricao Preco Imagem Estoque-->
                <% if(request.getAttribute("action") == "update"){
                        request.getSession().setAttribute("action", "update");
                   }else if(request.getAttribute("action") == "insert"){
                        request.getSession().setAttribute("action", "insert");   
                   }
                %>
                
                <tr>
                    <td>ID: </td>
                    <td>
                        <input type="text" name="id"  value="<c:out value="${produto.id}"/>" readonly="readonly" >
                    </td>
                </tr>
                <tr>
                    <td>Nome: </td>
                    <td>
                        <input type="text" name="nome"  value="<c:out value="${produto.nome}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Descricao: </td>
                    <td>
                        <textarea rows="4" cols="50" name="descricao"  form="usuarioForm"><c:out value="${produto.descricao}"/></textarea>
                        <!--input type="textarea" name="descricao"  value="<c:out value="${produto.descricao}"/>" -->
                    </td>
                </tr>
                <tr>
                    <td>Preco: </td>
                    <td>
                        <input type="text" name="preco"  value="<c:out value="${produto.preco}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Imagem: </td>
                    <td>
                        <input type="text" name="imagem"  value="<c:out value="${produto.imagem}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Estoque: </td>
                    <td>
                        <input type="text" name="estoque"  value="<c:out value="${produto.estoque}"/>" >
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
        <%} else {  %>
        <h1>Houve um erro!!!</h1>
        <%}%>
        <a href="index.jsp">Voltar a pagina principal</a>
    </body>
</html>
