/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
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
public class ProdutoDAO {
    public List<Produto> getProdutos() {
        ArrayList<Produto> produtos = new ArrayList<>();
        Connection conn=Database.getConnection();
        try {
            Statement select = conn.createStatement();
            ResultSet resp = select.executeQuery("select * from produto");
            while(resp.next()){
                Produto prod = new Produto();
                prod.setNome(resp.getString("nome"));
                prod.setPreco(resp.getDouble("preco"));
                prod.setDescricao(resp.getString("descricao"));
                prod.setImagem(resp.getString("imagem"));
                prod.setId(resp.getInt("idProduto"));
                produtos.add(prod);
                
            }
            select.close();
            resp.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return produtos;
    }
    
    public Produto getProduto(int id) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from produto where idProduto = ?");
            System.out.println("vai atualizar usuario com idProduto=" + id );
            ps.setInt(1, id);
            ResultSet resp = ps.executeQuery();
            if (resp.next()) {// found  
                Produto prod = new Produto();
                prod.setId(resp.getInt("idProduto"));
                prod.setNome(resp.getString("nome"));
                prod.setPreco(resp.getDouble("preco"));
                prod.setImagem(resp.getString("imagem"));
                prod.setDescricao(resp.getString("descricao"));
                return prod;
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
        
        return null;
    }
    public void addProduto(Produto prod) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("insert into produto(nome, preco, descricao, imagem, estoque) values (?, ?, ?, ?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1, prod.getNome());
            preparedStatement.setDouble(2, prod.getPreco());
            preparedStatement.setString(3, prod.getDescricao());
            preparedStatement.setString(4, prod.getImagem());
            preparedStatement.setInt(5, prod.getEstoque());             
            preparedStatement.executeUpdate();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteProduto(int id) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("delete from produto where idProduto=?");
            // Parameters start with 1
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateProduto(Produto prod) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("update produto set nome=?, preco=?, descricao=?, imagem=?, estoque=?"
                    + " where idProduto=?");
            //System.out.println(new java.sql.Date(user.getAcesso().getTime()));
          // Parameters start with 1
            preparedStatement.setString(1, prod.getNome());
            preparedStatement.setDouble(2, prod.getPreco());
            preparedStatement.setString(3, prod.getDescricao());
            preparedStatement.setString(4, prod.getImagem());
            preparedStatement.setInt(5, prod.getEstoque()); 
            preparedStatement.setInt(6, prod.getId()); 
            preparedStatement.executeUpdate();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
