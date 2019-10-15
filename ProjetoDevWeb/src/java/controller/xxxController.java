package controller;



//import crud.xxxDAO; <- DESCOMENTE AQUI E MUDE O XXX
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
//import modelos.xxx;  <- DESCOMENTE AQUI E MUDE O XXX

//
//------------------Todos os controllers com formato de CRUD podem ser assim,-----------------------
//------------------substitua o xxx com o  nome correto | Use CRTL-F         -----------------------
//


@WebServlet(name = "xxxController", urlPatterns = {"/xxxController"})
public class xxxController {
 /* private static final long serialVersionUID = 1L;
    private static String INSERT = "/xxxInsertForm.jsp";
    private static String UPDATE = "/xxxUpdateForm.jsp";
    private static String LIST_xxx = "/userList.jsp";
    private Crudxxx dao;
    
    public xxxController() {
        super();
        dao = new xxxDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = "xxxList";
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            System.out.println("sem action");
            action = "ProductList";
        }
            
        if (action == null){   
            System.out.println("action null");
            forward = LIST_xxx;
            request.setAttribute("xxxDAO", dao.getxxxs());
        } else if (action.equalsIgnoreCase("insert")){
            System.out.println("insert");
            forward = INSERT;
            int id = Integer.parseInt(request.getParameter("id"));
            xxx xxx = dao.getxxx(id);
            request.setAttribute("xxx", xxx);
 
        }else if (action.equalsIgnoreCase("userList")){
            System.out.println("xxxList");
            forward = LIST_xxx;
            request.setAttribute("xxxDAO", dao.getxxxs());
        } else if (action.equalsIgnoreCase("update")){
            System.out.println("update");
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            xxx user = dao.getxxx(id);
            request.setAttribute("xxx", user);  
        } else if (action.equalsIgnoreCase("delete")){
         
            System.out.println("delete");
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deletexxx(id);
            forward = LIST_xxx;
            request.setAttribute("xxxDAO", dao.getxxxs());    
        }  else {
            System.out.println("insert or edit");
            forward = INSERT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }
    */
}
