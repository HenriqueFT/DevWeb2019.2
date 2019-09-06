
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
@WebServlet(name = "LoginCheck", urlPatterns = {"/LoginCheck"})
public class LoginCheck extends HttpServlet {
    
    Connection conection = null;

    @Override
    public void init() throws ServletException {
    try {
        conection = DriverManager.getConnection("jdbc:derby://localhost:1527/Loja", "HenriqueFT", "asdf");
        } catch (Exception ex) {
         System.out.println(ex);
        }
    }
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome_user = request.getParameter("nome");
        String senha_user = request.getParameter("senha");
        String nome_correto="";
        String senha_correta="";
        
        try (PreparedStatement sql = conection.prepareStatement("SELECT * FROM ADMINISTRADOR")){
            ResultSet resultado = sql.executeQuery();
            resultado.next();
            nome_correto = resultado.getString("LOGIN");
            senha_correta = resultado.getString("SENHA");
        }catch (SQLException ex){
            System.out.println(ex);
        }
        
            //out.println("<h1>Esse eh o nome correto : "  + nome_correto + "\n Essa eh a senha correta : " + senha_correta +"<h1>.");
        if (nome_user.equals(nome_correto) && senha_user.equals(senha_correta)) {
            HttpSession session = request.getSession();
            session.setAttribute("logado", "ok");
            
            RequestDispatcher resposta = request.getRequestDispatcher("restrita.jsp");
            resposta.forward(request, response);
        } else {
            response.sendRedirect("erroLogin.html");
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
    
}
