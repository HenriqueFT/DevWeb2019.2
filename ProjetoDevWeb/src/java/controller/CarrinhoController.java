package controller;

import DAO.CarrinhoDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Carrinho;

@WebServlet(name = "CarrinhoController", urlPatterns = {"/CarrinhoController"})
public class CarrinhoController extends HttpServlet {
    private static String BASE = "/index.jsp";
    private static String FINALIZA = "/finalizaCompra.jsp";
   
    //ID Nome Descricao Preco Imagem Estoque

    private CarrinhoDAO dao;
    
    public CarrinhoController(int id) {
        super();
        dao = new CarrinhoDAO(id);
    }
    
    public CarrinhoController() {
        super();
        dao = null;
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = BASE;
        String action = "Finaliza";
        
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            action = "Finaliza";
        }
        
        if(request.getParameter("id")!=null){
            int id = Integer.parseInt(request.getParameter("id"));
            this.dao = new CarrinhoDAO(id);
        }
        
        if(action.equalsIgnoreCase("Finaliza")){
            dao.deleteCarrinho();
            System.out.println("Carrinho deletado");
            forward = FINALIZA;
        }
        
        
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }
}

