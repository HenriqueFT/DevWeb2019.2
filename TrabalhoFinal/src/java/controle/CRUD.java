/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Henrique
 */
@WebServlet(name = "CRUD", urlPatterns = {"/CRUD"})
public class CRUD extends HttpServlet {
    
    Connection conection = null;
    
    @Override
    public void init() throws ServletException {
     //fazer coneccao
     
    }

    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String operacao = request.getParameter("operacao");
        String tabela= request.getParameter("tabela");
        String nome,descricao,statement,idString = "";
        String id;
       
        switch(operacao){
            case "Create":
                String strParametros = request.getParameter("parametros");
                String[] par = strParametros.split(",");
                id = par[0];
                switch(tabela) {
                    case "ADMINISTRADOR":
                        String login = par[1];
                        String senha = par[2];
                        try (PreparedStatement sql = conection.prepareStatement("INSERT INTO " + tabela + " VALUES (" + id + ",'" + login + "','" + senha +"')")){
                            sql.executeUpdate();
                        }catch (SQLException ex){
                            response.sendRedirect("errorDB.html");
                        } 
                        break;
                    case "CATEGORIA":
                        descricao = par[1];
                        try (PreparedStatement sql = conection.prepareStatement("INSERT INTO " + tabela + " VALUES (" + id + ",'" + descricao + "')")){
                            sql.executeUpdate();
                        }catch (SQLException ex){
                            response.sendRedirect("errorDB.html");
                        } 
                        break;
                    case "CLIENTE":
                        nome = par[1];
                        String endereco = par[2];
                        String bairro = par[3];
                        String cidade = par[4];
                        String cep = par[5];
                        String estado = par[6];
                        String referencia = par[7];
                        String cpf = par[8];
                        String ri = par[9];
                        String telefone = par[10];
                        String celular = par[11];
                        String numerocartao = par[12];
                        String bandeiracartao = par[13];
                        
                        try (PreparedStatement sql = conection.prepareStatement("INSERT INTO " + tabela + " VALUES (" + id + ",'" + nome+ "','" + endereco + "','" + bairro + "','" + cidade + "','" + cep + "','" + estado + "','" + referencia + "','" + cpf + "','" + ri + "','" + telefone + "','" + celular + "','" + numerocartao + "','" + bandeiracartao +"')")){
                            sql.executeUpdate();
                        }catch (SQLException ex){
                            response.sendRedirect("errorDB.html");
                        } 
                         break;
                    case "COMPRAS":
                        int idcliente = Integer.parseInt(par[1]);
                        int idproduto = Integer.parseInt(par[2]);
                        try (PreparedStatement sql = conection.prepareStatement("INSERT INTO " + tabela + " VALUES (" + id + ",'" + idcliente + "','" + idproduto +"')")){
                            sql.executeUpdate();
                        }catch (SQLException ex){
                            response.sendRedirect("errorDB.html");
                        } 
                        break;
                    case "PRODUTO":
                        nome = par[1];
                        descricao = par[2];
                        String valor =  par[3];
                        try (PreparedStatement sql = conection.prepareStatement("INSERT INTO " + tabela + " VALUES (" + id + ",'" + nome + "','" + descricao + "','" + valor +"')")){
                            sql.executeUpdate();
                        }catch (SQLException ex){
                            response.sendRedirect("errorDB.html");
                        } 
                         break;
                }
                 readTable(response,tabela);
                 break;
            case "Read": 
                 readTable(response,tabela);
                 break;
            case "Update":
                idString = request.getParameter("identidade");
                
                String novoValor=request.getParameter("novoValor");
                String coluna=request.getParameter("coluna");
                PrintWriter out = response.getWriter();
               
                
                statement= "UPDATE " + tabela + "\n\t SET " + coluna + " = '" + novoValor + "' \n \t WHERE ID = " + idString;
                try (PreparedStatement sql = conection.prepareStatement(statement)){
                    sql.executeUpdate();
                }catch (SQLException ex){
                    response.sendRedirect("errorDB.html");
                } 
                readTable(response,tabela);
                break;
            case "Delete":
                idString = request.getParameter("indice");
                if (idString == null){
                    System.out.println(idString);
                }
                //id = Integer.parseInt(idString);
                statement = "DELETE FROM " + tabela + " WHERE ID = " + idString; 
                try (PreparedStatement sql = conection.prepareStatement(statement)){
                    sql.executeUpdate();
                }catch (SQLException ex){
                    response.sendRedirect("errorDB.html");
                } 
                readTable(response,tabela);
                break;
        }
    }
    
    
       @Override
    public void destroy(){
        try {
            conection.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
    }
        
    //Metodo ira criar a parte da table que dira o nome das colunas,sendo que a primeira coluna eh 1 e termina em colCount\
    //Em caso de erro o problema pode ser getColumnLabel em vez de NAME
    public String makeTableHeader(int colCount,ResultSetMetaData resMD) throws SQLException{
        String resp="";
        resp+="<table style=\"width:100%\">\n";
        resp+="<tr>\n";
        for(int i=1;i<=colCount;i++){
            resp+="<th>"+resMD.getColumnName(i)+"</th>\n";
        }
        resp+="</tr>\n";
        return resp;
    }
    
    //Cria uma linha da tabela ao recuperar os dados de qual tabela esta lidando. Sera chamado linha a linha.
    //Em caso de erro o problema pode ser getColumnLabel em vez de NAME
    public String makeRow(int colCount, ResultSetMetaData resMD, ResultSet res) throws SQLException {
         String resp="";
         resp+="<tr>\n";
         String colName = "";
         //dessa forma pegaremos cada item de cada coluna
        for(int i=1;i<=colCount;i++){
            colName = resMD.getColumnName(i);
            resp+="<td>"+res.getString(colName)+"</td>\n";
        }
        resp+="</tr>\n";
        return resp;
    }
    
    private void readTable(HttpServletResponse response,String tabela) throws IOException{
         try (PreparedStatement sql = conection.prepareStatement("SELECT * FROM " + tabela)){
            ResultSet resultado = sql.executeQuery();
            ResultSetMetaData resultadoMD = resultado.getMetaData();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            int numbColumn = resultadoMD.getColumnCount();
            String htmlResp="<html>\n";
            htmlResp+="<head>\n";
            htmlResp+="<style>\n";
            htmlResp+="table, th, td {\n" +
                       "    border: 2px solid purple;\n" +
                        "}\n"+
                        "a{   margin: auto;\n" +
                        "    width: 50%;\n" +
                        "    padding: 10px;\n" +
                        "border: 1px solid red;"+
                        "    font-size : 150%;\n"
                        + "text-align: center;}";
            htmlResp+= "th {background-color:pink;}";
            htmlResp+="</style>\n <title>Tabela</title>";
            htmlResp+="</head>\n";
            htmlResp+="<body>\n";
            //Cria o cabecalho da table
            htmlResp += makeTableHeader(numbColumn,resultadoMD);
            //agora iremos encrever todas as linhas de cada row
            while(resultado.next()){
                htmlResp += makeRow(numbColumn,resultadoMD,resultado);
            }
            htmlResp +="</body></html>";

            out.println(htmlResp);
            out.println("<br><a href=\"restrita.jsp\">Voltar</a><br><br><br>");
        }catch (SQLException ex ){
            response.sendRedirect("errorDB.html");
        } 
    }
}
