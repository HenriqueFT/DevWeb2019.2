<%@page import="modelos.Usuario"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/style.css">
        <title>Update usuario</title>
    </head>
    <body>
        <div class="basicPage container-fluid">
        <% 
        request.getSession().setAttribute("action", "update");
        Usuario usuario= new Usuario();

        if(request.getSession().getAttribute("usuarioLogado")!=null){
           usuario = (Usuario) request.getSession().getAttribute("usuarioLogado"); 
           Usuario tempUsu = usuario;  
           request.setAttribute("usuario", tempUsu);
           
            if(request.getAttribute("db")!=null){
               tempUsu = (Usuario) request.getAttribute("Usuario");
               request.setAttribute("usuario", tempUsu);
            }

        %>
        <form method="POST" action="UsuarioController" name="formEditUsuario" id="formEditUsuario">
            <table class="tableForm">
                 <!--Deixar certo que o que o usuario nao deveria ver nao apareca-->
                <%if(usuario.getIsAdm()==0){%>
                    <style type="text/css">
                        .admOnly {
                          visibility: hidden;
                        }
                    </style>
                <%}else{%>
                    <style type="text/css">
                        .admOnly {
                          visibility: visible;      
                        }
                    </style>
                <%}%>
                
                <tr class='admOnly'>
                    <td>ID: </td>
                    <td>
                        <input type="text" name="id"  value="<c:out value="${usuario.userId}"/>" readonly="readonly" >
                    </td>
                </tr>
                
                <tr>
                    <td>Nome completo: </td>
                    <td>
                        <input type="text" name="nome"  value="<c:out value="${usuario.nome}"/>" >
                    </td>
                </tr>

                <tr>
                    <td>Email: </td>
                    <td>
                        <input type="text" name="email" required value="<c:out value="${usuario.email}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>CPF: </td>
                    <td>
                        <input type="text" name="cpf" maxlength="11" minlength="11" required value="<c:out value="${usuario.cpf}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Senha: </td>
                    <td>
                        <input type="password" name="senha" required value="<c:out value="${usuario.senha}"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Endereço:</td>
                    <td>
                        <textarea rows="4" cols="50" name="endereco" required  form="formEditUsuario"><c:out value="${usuario.endereco}"/></textarea>
                        
                    </td>
                </tr>
                <%
                    //Esse eh tao importante que nao seja visto que nao pode nem ser carregado caso nao seja ADM
                    if(usuario.getIsAdm()==1){
                %>   
                <tr class='admOnly'>
                    <td>isAdm:</td>
                    <td>
                       <input type="text" name="isADM"  value="<c:out value="${usuario.isAdm}"/>" >
                    </td>
                </tr>
                <%}%>
                <tr>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
        <%
        }else{
        %>    
        <jsp:forward page="pleaseLogin.jsp" /> 
        <%}%>
        </div>
    </body>
</html>
