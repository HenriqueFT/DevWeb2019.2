
package control.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class Conection {
    
    
    private Connection conection;
    
    
    public Conection(){
        
    
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conection = DriverManager.getConnection("jdbc:derby://localhost:1527/Loja", "HenriqueFT", "asdf");
        } catch (Exception ex) {
         System.out.println(ex);
        }
    }
    
        public Connection getConexao(){
        return this.conection;
    }
    
    public void closeConexao(){
        try {
            this.conection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
