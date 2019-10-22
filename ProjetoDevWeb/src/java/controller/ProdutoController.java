package controller;

import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Produto;
import modelos.Usuario;

@WebServlet(name = "ProdutoController", urlPatterns = {"/ProdutoController"})

public class ProdutoController extends HttpServlet {
    private static String INSERT = "/paginaInsert.jsp";
    private static String UPDATE = "/paginaInsert.jsp";
    private static String LIST_PRODUTOS = "/bancoDeDados.jsp";
    
    //ID Nome Descricao Preco Imagem Estoque
    private static String NOME ="nome";
    private static String DESCRICAO ="descricao";
    private static String PRECO ="preco";
    private static String IMAGEM ="imagem";
    private static String ESTOQUE ="estoque";
    
    private ProdutoDAO dao;
    
    public ProdutoController() {
        super();
        dao = new ProdutoDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = "ListaProdutos";
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            action = "ListaProdutos";
        }
            
        if (action == null){   
            forward = LIST_PRODUTOS;
            request.setAttribute("ProdutoDAO", dao.getProdutos());
        } else if (action.equalsIgnoreCase("insert")){
            forward = INSERT;
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = dao.getProduto(id); 
            request.setAttribute("action", "insert");
            request.setAttribute("produto", produto);
        }else if (action.equalsIgnoreCase("listaProdutos")){
            forward = LIST_PRODUTOS;
            request.setAttribute("ProdutoDAO", dao.getProdutos());
        } else if (action.equalsIgnoreCase("update")){
            System.out.println("UPDATE");
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = dao.getProduto(id);
            request.setAttribute("action", "update");
            request.setAttribute("produto", produto);  
        } else if (action.equalsIgnoreCase("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteProduto(id);
            forward = LIST_PRODUTOS;
            request.setAttribute("ProdutoDAO", dao.getProdutos());    
        }  else {
            forward = INSERT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Produto produto = new Produto();
        System.out.println("Parametro ID :"+request.getParameter("id"));
         
        String s ="";
        if(request.getSession().getAttribute("action") != null){
            s = (String) request.getSession().getAttribute("action");
        }
        
        System.out.println("ACTION : "+s);
         
        int id = 0;
        
        if(s.equals("update")){
            try {
                id = Integer.parseInt(request.getParameter("id"));
                System.out.println("O id deveria ter valor "+id);
            } catch(Exception e){
                e.printStackTrace();
                id = -1;
            }
        } 
        
        
        //ID Nome Descricao Preco Imagem Estoque
        produto.setId(id);
        produto.setNome(request.getParameter(NOME));
        produto.setDescricao(request.getParameter(DESCRICAO));
        produto.setPreco(Double.parseDouble(request.getParameter(PRECO)));
        produto.setImagem(request.getParameter(IMAGEM));
        produto.setEstoque(Integer.parseInt(request.getParameter(ESTOQUE)));
        
        
        //--------------------Fazer checagem se eh adm depois------------------
        /*CODIGO  DO PROFESSOR
        String administrador = request.getParameter("admin");
        if (administrador == null || "".equals(administrador)){
            administrador = "0";
        }
        user.setAdmin(Integer.parseInt(administrador));
        // data de acesso eh controlada pelo BD
        dao.checkUser(user);
        */
        
        //--------------------O que estou incluindo
        /*Temos que ver qual o usuario da sessao e ver se eh adm
            if(Usuario.isADM(usuario)){
             dao.addProduto(produto);
            }
        */

        
        if(s.equals("update")){
            System.out.println("Updating produto "+produto.getId());
            dao.updateProduto(produto);
        }else{
            System.out.println("Adding produto");
            dao.addProduto(produto);//Por enquanto nao tem protecao de quem faz isso 
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_PRODUTOS);
        request.setAttribute("ProdutoDAO", dao.getProdutos());
        view.forward(request, response);
        
     }
    
}
