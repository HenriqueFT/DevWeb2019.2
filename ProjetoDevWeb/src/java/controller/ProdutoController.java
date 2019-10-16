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
    private static final long serialVersionUID = 1L;
    private static String INSERT = "/paginaInsert.jsp";
    private static String UPDATE = "/paginaInsert.jsp";
    private static String LIST_PRODUTOS = "/index.jsp";
    
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
        System.out.println("EU COMO CU");
            
        if (action == null){   
            forward = LIST_PRODUTOS;
            request.setAttribute("ProdutoDAO", dao.getProdutos());
        } else if (action.equalsIgnoreCase("insert")){
            forward = INSERT;
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = dao.getProduto(id);
            request.setAttribute("Produto", produto);
        }else if (action.equalsIgnoreCase("listaProdutos")){
            forward = LIST_PRODUTOS;
            request.setAttribute("ProdutoDAO", dao.getProdutos());
        } else if (action.equalsIgnoreCase("update")){
            System.out.println("UPDATE");
            forward = UPDATE;
            request.setAttribute("action", "update");
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = dao.getProduto(id);
            request.setAttribute("Produto", produto);  
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
               
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch(Exception e){
            e.printStackTrace();
            id = -1;
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
        if(request.getAttribute("action") == "update"){
            dao.updateProduto(produto);
        }else{
            dao.addProduto(produto);//Por enquanto nao tem protecao de quem faz isso 
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_PRODUTOS);
        request.setAttribute("produtoDAO", dao.getProdutos());
        view.forward(request, response);
        
     }
    
}
