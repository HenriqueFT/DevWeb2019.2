/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crud;
import java.util.ArrayList;
import java.util.List;
import modelos.Produto;
import java.sql.*;
import codigo.Database;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class CrudProduto {
    public List<Produto> getProdutos() {
        ArrayList<Produto> produtos = new ArrayList<>();
        Connection conn=Database.getConnection();
        try {
            Statement select = conn.createStatement();
            ResultSet resp = select.executeQuery("select * from produto");
            while(resp.next()){
                Produto prod = new Produto();
                prod.setId(resp.getInt("id"));
                prod.setNome(resp.getString("nome"));
                prod.setPreco(resp.getDouble("preco"));
                prod.setDescricao(resp.getString("descricao"));
                produtos.add(prod);
                
            }
            select.close();
            resp.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(CrudProduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return produtos;
    }
    
    public Produto getProduto(int ID) {
        Produto produto = null;
        
        Connection conn=Database.getConnection();
        try {
            Statement select = conn.createStatement();
            ResultSet resp = select.executeQuery("SELECT * FROM produto WHERE id=" + Integer.toString(ID));
            
            resp.first();
            
            produto = new Produto(resp);
            
            select.close();
            resp.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(CrudProduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return produto;
    }
    
}
