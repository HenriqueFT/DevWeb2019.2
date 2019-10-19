/*



-Recomendo editar em algo ais robusto como Notepad++
-Procure por xxx e troque todos pelo nome da classe com a primeira letra minuscula (ex:produto)
-procure por Xxx e troque todas as ocorrencias pelo nome da classe com a primeira letra sendo maiuscula (ex:Produto)



*/

//Descomente esse bloco todo aqui embaixo de  uma vez


/*


package controller;

import DAO.XxxDAO;
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
import modelos.Xxx;
import modelos.Usuario;

@WebServlet(name = "XxxController", urlPatterns = {"/XxxController"})


public class XxxController extends HttpServlet {
    private static String INSERT = "/paginaInsert.jsp";
    private static String UPDATE = "/paginaInsert.jsp";
    private static String LIST_PRODUTOS = "/bancoDeDados.jsp";
    
    //ID Nome Descricao Preco Imagem Estoque
    private static String NOME ="nome";
    private static String DESCRICAO ="descricao";
    private static String PRECO ="preco";
    private static String IMAGEM ="imagem";
    private static String ESTOQUE ="estoque";
    
    private XxxDAO dao;
    
    public XxxController() {
        super();
        dao = new XxxDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = "ListaXxxs";
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            action = "ListaXxxs";
        }
        System.out.println("Cheguei aqui");
            
        if (action == null){   
            forward = LIST_PRODUTOS;
            request.setAttribute("XxxDAO", dao.getXxxs());
        } else if (action.equalsIgnoreCase("insert")){
            forward = INSERT;
            int id = Integer.parseInt(request.getParameter("id"));
            Xxx xxx = dao.getXxx(id); 
            request.setAttribute("action", "insert");
            request.setAttribute("xxx", xxx);
        }else if (action.equalsIgnoreCase("listaXxxs")){
            forward = LIST_PRODUTOS;
            request.setAttribute("XxxDAO", dao.getXxxs());
        } else if (action.equalsIgnoreCase("update")){
            System.out.println("UPDATE");
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            Xxx xxx = dao.getXxx(id);
            request.setAttribute("action", "update");
            request.setAttribute("xxx", xxx);  
        } else if (action.equalsIgnoreCase("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteXxx(id);
            forward = LIST_PRODUTOS;
            request.setAttribute("XxxDAO", dao.getXxxs());    
        }  else {
            forward = INSERT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Xxx xxx = new Xxx();
         
        String s ="";
        if(request.getSession().getAttribute("action") != null){
            s = (String) request.getSession().getAttribute("action");
        }
         
         
        int id = 0;
        
        if(s.equals("update")){
            try {
                id = Integer.parseInt(request.getParameter("id"));
                System.out.println("O id deveria ter valor"+id);
            } catch(Exception e){
                e.printStackTrace();
                id = -1;
            }
        } 
         
        //------------------------------------Essa parte deve ser mudada de acordo com a Classe e seus parametros 

		
        //ID Nome Descricao Preco Imagem Estoque
        xxx.setId(id);
        xxx.setNome(request.getParameter(NOME));
        xxx.setDescricao(request.getParameter(DESCRICAO));
        xxx.setPreco(Double.parseDouble(request.getParameter(PRECO)));
        xxx.setImagem(request.getParameter(IMAGEM));
        xxx.setEstoque(Integer.parseInt(request.getParameter(ESTOQUE)));
        


        
        if(s.equals("update")){
            dao.updateXxx(xxx);
        }else{
            dao.addXxx(xxx);//Por enquanto nao tem protecao de quem faz isso 
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_PRODUTOS);
        request.setAttribute("XxxDAO", dao.getXxxs());
        view.forward(request, response);
        
     }
    
}

*/