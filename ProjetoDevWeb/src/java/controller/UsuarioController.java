package controller;



import DAO.UsuarioDAO; 
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
import modelos.Usuario; 


//
//------------------Todos os controllers com formato de CRUD podem ser assim,-----------------------
//------------------substitua o xxx com o  nome correto | Use CRTL-F         -----------------------
//


@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController {
    //ID Nom//ID Nome CPF isADM Cidade Endereco NFUncionarioe CPF isADM Cidade Endereco NFUncionario
    private static String INSERT = "/paginaLoginOuCadastro.jsp";
    private static String UPDATE = "/xxxUpdateForm.jsp";
    private static String LIST_USUARIO = "/index.jsp";
    private UsuarioDAO dao;
    
    private static String NOME="nome";
    private static String CPF="cpf";
    private static String ISADM="isADM";
    private static String CIDADE="cidade";
    private static String ENDERECO="endereco";
    private static String NFUNCIONARIOS="nfuncionarios";
           
    
    public UsuarioController() {
        super();
        dao = new UsuarioDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = "ListaUsuarios";
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            action = "ListaUsuarios";
        }
            
        if (action == null){   
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());
        } else if (action.equalsIgnoreCase("insert")){
            forward = INSERT;
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario usuario = dao.getUsuario(id);
            request.setAttribute("Usuario", usuario);
        }else if (action.equalsIgnoreCase("ListaUsuarios")){
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());
        } else if (action.equalsIgnoreCase("update")){
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario usuario = dao.getUsuario(id);
            request.setAttribute("Usuario", usuario);  
        } else if (action.equalsIgnoreCase("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteUsuario(id);
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());    
        }  else {
            forward = INSERT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = new Usuario();
               
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch(Exception e){
            e.printStackTrace();
            id = -1;
        } 
        
        //ID Nome CPF isADM Cidade Endereco NFUncionario
        usuario.setUserId(id);
        usuario.setNome(request.getParameter(NOME));
        usuario.setCpf(Integer.parseInt(request.getParameter(CPF)));
        usuario.setIsAdm(Integer.parseInt(request.getParameter(ISADM)));
        usuario.setCidade(request.getParameter(CIDADE));
        usuario.setEndereco(request.getParameter(ENDERECO));
        
        
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
       
        dao.addUsuario(usuario);//Por enquanto nao tem protecao de quem faz isso
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_USUARIO);
        request.setAttribute("UsuarioDAO", dao.getUsuarios());
        view.forward(request, response);
        
     }
    
    
}
