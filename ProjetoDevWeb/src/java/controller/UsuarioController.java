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
import modelos.Usuario;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.Cookie;

//
//------------------Todos os controllers com formato de CRUD podem ser assim,-----------------------
//------------------substitua o xxx com o  nome correto | Use CRTL-F         -----------------------
//

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})

public class UsuarioController extends HttpServlet {
    private static String BASE = "/index.jsp";
    private static String INSERT = "/paginaCadastro.jsp";
    private static String UPDATE = "/paginaUsuarioUpdate.jsp";            //<-- Essas3 ainda nao estao corretas
    private static String LOGIN = "/paginaLogin.jsp";
    private static String LOGINMESSAGE ="/loginMessage.jsp";
    private static String LIST_USUARIO = "/bancoDeDados.jsp";
    private static String SHOW_CURRENT_USUARIO = "/paginaInfoUsuario.jsp";
    private UsuarioDAO dao;
    
    private static String NOME="nome";
    private static String SENHA="senha";
    private static String CPF="cpf";
    private static String ISADM="isADM";
    private static String EMAIL="email";
    private static String ENDERECO="endereco";
           
    
    public UsuarioController() {
        super();
        dao = new UsuarioDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = "ListaUsuarios";
        String show = "Usuarios";
        
        try {
            action = request.getParameter("action");
        } catch(Exception e){
            action = "ListaUsuarios";
        }
        
        try {
            show = request.getParameter("show");
        } catch(Exception e){
            show = "Usuarios";
        }

        request.setAttribute("show", show);
        
        if(dao.getUsuarios()!=null){
            System.out.println("");
        }
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Cookie[] cookies = request.getCookies();
            String usur=null;
            if(cookies!=null){
            
            for (int i = 0; i < cookies.length; i++) {
                if(cookies[i].getName().equals("idUsuario")){
                    usur = cookies[i].getValue();
                }
            }
            }
            Usuario usuario = null;
            if(usur!=null){
            usuario = dao.getUsuario(Integer.parseInt(usur));
            }
        if (action == null){   
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());
        } else if (action.equalsIgnoreCase("insert")){
            forward = INSERT;
            request.setAttribute("action", "insert");
        }else if (action.equalsIgnoreCase("ListaUsuarios")){
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());
        } else if (action.equalsIgnoreCase("update")){
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            usuario = dao.getUsuario(id);
            request.setAttribute("action", "update");
            request.setAttribute("Usuario", usuario);  
        } else if (action.equalsIgnoreCase("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteUsuario(id);
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());    
        }  else if(action.equalsIgnoreCase("login")){
            forward = LOGIN;
            request.setAttribute("action", "login");
        }else if (action.equalsIgnoreCase("showUsuario")){
            forward = SHOW_CURRENT_USUARIO;
            request.setAttribute("usuarioLogado", usuario);
        }  else{
            forward = INSERT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
                
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = new Usuario();
               
        String s ="";
        
        if(request.getSession().getAttribute("action") != null){
            s = (String) request.getSession().getAttribute("action");
        }
         
        int id = 0;

        if(s.equals("update")){
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch(Exception e){
                e.printStackTrace();
                id = -1;
            } 
        }
        
        usuario.setUserId(id);
        usuario.setNome(request.getParameter(NOME));
        usuario.setEmail(request.getParameter(EMAIL));
        usuario.setCpf(request.getParameter(CPF));
        usuario.setEndereco(request.getParameter(ENDERECO));

        if(request.getParameter(ISADM)==null){
            usuario.setIsAdm(0);
        }else{
            usuario.setIsAdm(Integer.parseInt(request.getParameter(ISADM)));
        }
        
        String senha = request.getParameter(SENHA);
        String senhaEncriptada="";
        try {
            //ID Nome CPF isADM Cidade Endereco NFUncionario
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(senha.getBytes());
            senhaEncriptada = new String(md.digest());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
      
        
        usuario.setSenha(senhaEncriptada);
        
        
        RequestDispatcher view = request.getRequestDispatcher(BASE);
        
        if(s.equals("login")){
            usuario=dao.loginUsuario(usuario.getEmail(), usuario.getSenha());
            Cookie idUser = new Cookie("idUsuario",""+usuario.getUserId());
            
            request.getSession().setAttribute("usuarioLogado", usuario);
            
            view = request.getRequestDispatcher(LOGINMESSAGE);
            
            if(usuario.getCpf()!=null){
                System.out.println("LOGIN FUNCIONOU");
                request.setAttribute("loginSucess", "true");
            }else{
                System.out.println("LOGIN INCORRETO");
                request.setAttribute("loginSucess", "false");
            }
            response.addCookie(idUser);
            
        }else if(s.equals("update")){
            dao.updateUsuario(usuario);
        }else{
            dao.addUsuario(usuario);//Por enquanto nao tem protecao de quem faz isso
        }
        

        request.setAttribute("UsuarioDAO", dao.getUsuarios());
        view.forward(request, response);
        
     }
    
    
}
