package controller;

import crud.CrudProduto;
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

@WebServlet(name = "ProdutoController", urlPatterns = {"/ProdutoController"})
public class ProdutoController {
  /*private static final long serialVersionUID = 1L;
    private static String INSERT = "/produtoInsertForm.jsp";
    private static String UPDATE = "/produtoUpdateForm.jsp";
    private static String LIST_PRODUTO = "/ListaProdutos.jsp";
    private CrudProduto dao;
    
    public ProdutoController() {
        super();
        dao = new CrudProduto();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = "ListaProdutos";
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            System.out.println("sem action");
            action = "ListaProdutos";
        }
            
        if (action == null){   
            System.out.println("action null");
            forward = LIST_PRODUTO;
            request.setAttribute("ProdutoDAO", dao.getProdutos());
        } else if (action.equalsIgnoreCase("insert")){
            System.out.println("insert");
            forward = INSERT;
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = dao.getProduto(id);
            request.setAttribute("Produto", produto);
 
        }else if (action.equalsIgnoreCase("userList")){
            System.out.println("ProdutoList");
            forward = LIST_PRODUTO;
            request.setAttribute("ProdutoDAO", dao.getProdutos());
        } else if (action.equalsIgnoreCase("update")){
            System.out.println("update");
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            Produto user = dao.getProduto(id);
            request.setAttribute("Produto", user);  
        } else if (action.equalsIgnoreCase("delete")){
         
            System.out.println("delete");
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteProduto(id);
            forward = LIST_PRODUTO;
            request.setAttribute("ProdutoDAO", dao.getProdutos());    
        }  else {
            System.out.println("insert or edit");
            forward = INSERT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }
    */
}
