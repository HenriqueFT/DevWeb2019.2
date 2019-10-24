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
<<<<<<< HEAD
import modelos.Usuario; 
import modelos.Usuario;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
=======
import modelos.Usuario;
import DAO.UsuarioDAO;
>>>>>>> feature/carrinho

//
//------------------Todos os controllers com formato de CRUD podem ser assim,-----------------------
//------------------substitua o xxx com o  nome correto | Use CRTL-F         -----------------------
//

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})

public class UsuarioController extends HttpServlet {
    //ID Nom//ID Nome CPF isADM Cidade Endereco NFUncionarioe CPF isADM Cidade Endereco NFUncionario
<<<<<<< HEAD
    private static String INSERT = "/paginaLoginOuCadastro.jsp";
    private static String UPDATE = "/xxxUpdateForm.jsp";            //<-- Essas3 ainda nao estao corretas
    private static String LIST_USUARIO = "/bancoDeDados.jsp";
=======
    private static String INSERT = "/paginaInsert.jsp";
    private static String UPDATE = "/xxxUpdateForm.jsp";
    private static String LIST_USUARIO = "/index.jsp";
>>>>>>> feature/carrinho
    private UsuarioDAO dao;
    
    private static String NOME="nome";
    private static String SENHA="senha";
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
            request.setAttribute("action", "insert");
            request.setAttribute("Usuario", usuario);
        }else if (action.equalsIgnoreCase("ListaUsuarios")){
            forward = LIST_USUARIO;
            request.setAttribute("UsuarioDAO", dao.getUsuarios());
        } else if (action.equalsIgnoreCase("update")){
            forward = UPDATE;
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario usuario = dao.getUsuario(id);
            request.setAttribute("action", "update");
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
               
        String s ="";
        
        if(request.getSession().getAttribute("action") != null){
            s = (String) request.getSession().getAttribute("action");
        }
         
        int id = 0;

        //ID Nome CPF isADM Cidade Endereco NFUncionario
<<<<<<< HEAD
        if(s.equals("update") || s.equals("login")){
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch(Exception e){
                e.printStackTrace();
                id = -1;
            } 
        }
        

                
        usuario.setUserId(id);
        usuario.setNome(request.getParameter(NOME));
        usuario.setCpf(Integer.parseInt(request.getParameter(CPF)));
        usuario.setIsAdm(Integer.parseInt(request.getParameter(ISADM)));
       usuario.setCidade(request.getParameter(CIDADE));
        usuario.setEndereco(request.getParameter(ENDERECO));
=======
        //usuario.setId(id);
        //usuario.setNome(request.getParameter(NOME));
        //usuario.setCPF(Integer.parseInt(request.getParameter(CPF)));
        //usuario.setAdmin(Integer.parseInt(request.getParameter(ISADM)));
        usuario.setCidade(request.getParameter(CIDADE));
        //usuario.setEndereco(Integer.parseInt(request.getParameter(ENDERECO)));
>>>>>>> feature/carrinho
        
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
           
        //usuario.setSenha(senhaEncriptada);
        
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
        if(s.equals("login")){
            
        }else if(s.equals("update")){
            dao.updateUsuario(usuario);
        }else{
            dao.addUsuario(usuario);//Por enquanto nao tem protecao de quem faz isso
        }
        
        //!!!!!!!!!!!!!!!!!!!!!!!NAO COMPLETO CORRETAMENTE!!!!!!!!!!!!!!!!!!!!!!!
        //----------------------------------- OBS !!!!!!!!!!!!!!!
        //Dependendo do usuario e da acao ele nao deve ir para o banco de dados depois 
        //do Login,criar conta ou modificar conta
        
        //String previousPage = request.getHeader("referer"); 
        String previousPage = (String) request.getAttribute("javax.servlet.forward.request.url");
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_USUARIO);
<<<<<<< HEAD
        //RequestDispatcher view = request.getRequestDispatcher(previousPage);
        request.setAttribute("UsuarioDAO", dao.getUsuarios());
=======
        //request.setAttribute("usuarioDAO", dao.getUsuario());
>>>>>>> feature/carrinho
        view.forward(request, response);
        
     }
    
    
}
