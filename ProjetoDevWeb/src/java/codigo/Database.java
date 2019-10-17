/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;


import java.sql.*;
import java.sql.DriverManager;

public class Database {

    public static Connection getConnection() {
        try {
            //*connect to DB MySQL veja SQL ao final da pagina
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/projeto", "root", "");
            //*/
            /*
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String url = "jdbc:derby://localhost:1527/projeto;create=true;user=APP;password=APP";
            Connection con = DriverManager.getConnection(url);
            //*/
            return con;
        } catch (Exception ex) {
            System.out.println("Database.getConnection() Error -->" + ex.getMessage());
            return null;
        }
    }

    public static void close(Connection con) {
        try {
            con.close();
        } catch (Exception ex) {
        }
    }
}
