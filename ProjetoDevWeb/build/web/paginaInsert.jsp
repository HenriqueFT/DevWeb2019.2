<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserindo 8======D~~</title>
    </head>
    <body>
        
        <h1>Insira um Produto</h1>
        <form method="POST" action="ProdutoController" name="formAddProduto" id="produtoForm">
            <table class="tableForm">
                <!--ID Nome Descricao Preco Imagem Estoque-->
                <% if(request.getAttribute("action") == "update"){%>
                <tr>
                    <td>ID: </td>
                    <td>
                        <input type="text" name="nome"  value="<c:out value="${produto.id}"/>" >
                    </td>
                </tr>
                <% }%>
                <tr>
                    <td>Nome: </td>
                    <td>
                        <input type="text" name="nome"  value="<c:out value="${produto.nome}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Descricao: </td>
                    <td>
                        <textarea rows="4" cols="50" name="descricao"  form="produtoForm"></textarea>
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
        <a href="index.jsp">Voltar a pagina principal</a>
    </body>
</html>
