<%-- 
    Document   : restrita
    Created on : Nov 6, 2017, 5:40:43 PM
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script type="text/javascript">
       
        function opC() {
            document.getElementById("editavel").innerHTML = "<br><select id=\"tabela\" onchange=\"teste(this.selectedIndex)\" name=\"tabela\" required>\n" +
"                    <option value=\"nada\" disabled selected>Escolha a tabela</option>\n" +
"                    <option value=\"ADMINISTRADOR\">ADMINISTRADOR</option>\n" +
"                    <option value=\"CATEGORIA\">CATEGORIA</option>\n" +
"                    <option value=\"CLIENTE\">CLIENTE</option>\n" +
"                    <option value=\"COMPRAS\">COMPRAS</option>\n" +
"                    <option value=\"PRODUTO\">PRODUTO</option>\n" +
"                </select>" + "<br><br><textarea id=\"parametros\" rows=\"2\" cols=\"69\" name=\"parametros\" placeholder=\"Insira os parametros separados por ','\"></textarea>"+
                 "                <br><br> <input type=\"submit\" value=\"Submit\">";
        } 
        
        
        
        function opR(){
            document.getElementById("editavel").innerHTML = "<br><select id=\"tabela\" onchange=\"teste()\" name=\"tabela\" required >\n" +
"                    <option value=\"nada\" disabled selected>Escolha a tabela</option>\n" +
"                    <option value=\"ADMINISTRADOR\">ADMINISTRADOR</option>\n" +
"                    <option value=\"CATEGORIA\">CATEGORIA</option>\n" +
"                    <option value=\"CLIENTE\">CLIENTE</option>\n" +
"                    <option value=\"COMPRAS\">COMPRAS</option>\n" +
"                    <option value=\"PRODUTO\">PRODUTO</option>\n" +
"                </select>\n"+
                 "                <br><br> <input type=\"submit\" value=\"Submit\">";
        }
        
        function opU(){
            document.getElementById("editavel").innerHTML= "<br><select id=\"tabela\" onchange=\"teste()\" name=\"tabela\" required >\n" +
"                    <option value=\"nada\" disabled selected>Escolha a tabela</option>\n" +
"                    <option value=\"ADMINISTRADOR\">ADMINISTRADOR</option>\n" +
"                    <option value=\"CATEGORIA\">CATEGORIA</option>\n" +
"                    <option value=\"CLIENTE\">CLIENTE</option>\n" +
"                    <option value=\"COMPRAS\">COMPRAS</option>\n" +
"                    <option value=\"PRODUTO\">PRODUTO</option>\n" +
"                </select><br>\n"+
"               <br> ID : <input type=\"text\" name=\"identidade\" id=\"identidade\" placeholder=\"Insira o ID do elemento \" required><br>\n" +
"               <br> Coluna : <input type=\"text\" name=\"coluna\" id=\"coluna\" placeholder=\"Nome da coluna \" required><br>\n" +
"               <br> Novo valor : <input type=\"text\" name=\"novoValor\" id=\"novoValor\" placeholder=\"Valor desejado\" required><br>\n"+
                 "                <br><br> <input type=\"submit\" value=\"Submit\">";
            
        }
         
        function opD(){
            document.getElementById("editavel").innerHTML= "<br><select id=\"tabela\" onchange=\"teste()\" name=\"tabela\" required >\n" +
"                    <option value=\"nada\" disabled selected>Escolha a tabela</option>\n" +
"                    <option value=\"ADMINISTRADOR\">ADMINISTRADOR</option>\n" +
"                    <option value=\"CATEGORIA\">CATEGORIA</option>\n" +
"                    <option value=\"CLIENTE\">CLIENTE</option>\n" +
"                    <option value=\"COMPRAS\">COMPRAS</option>\n" +
"                    <option value=\"PRODUTO\">PRODUTO</option>\n" +
"                </select><br>\n"+
"                <br>ID : <input type=\"text\" name=\"indice\" id=\"identidade\" placeholder=\"Insira o ID do elemento\" required><br>\n"+
                 "                <br><br> <input type=\"submit\" value=\"Submit\">";
        }
    </script>
    <style>
        body{
            background-color: lightpink;
        }
        title, h1{
            text-align: center;
            color: solid blue;
            font-size: 150%;
            margin: 10px;
            padding: 10px;
        }
        .formulario{
            text-align: center;
            font-size: 125%;
            padding: 20px;
            margin-left: 20px;
            margin-bottom: 30px;
        }
     
    </style>
    <head>
        <title>Area Restrita</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="theme.css">
    </head>
    <body>
        <%
         Object logado = session.getAttribute("logado");
         if (logado != null) {
            String aux = (String) logado;
            if (aux.equals("ok")) { %>
            
            <h1>Area Restrita</h1>
            <div class="formulario">
              
            <form action="CRUD" method="post" name="form" id="form">
                <input id="typeOP" type="radio" name="operacao" value="Create" onclick="opC()" required>Create
                <input id="typeOP" type="radio" name="operacao" value="Read" onclick="opR()">Read
                <input id="typeOP" type="radio" name="operacao" value="Update" onclick="opU()">Update
                <input id="typeOP" type="radio" name="operacao"  value="Delete" onclick="opD()">Delete
                
                <br> <div id="editavel" ></div>

            </form>   
                
            </div>
            
            <%} else {response.sendRedirect("erro_login.html");}
      } else { response.sendRedirect("erro_login.html"); }%>
    </body>
</html>
