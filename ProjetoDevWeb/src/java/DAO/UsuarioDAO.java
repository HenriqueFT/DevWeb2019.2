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
import modelos.Usuario;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {
    public List<Usuario> getUsuarios() {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        Connection conn=Database.getConnection();
        try {
            Statement select = conn.createStatement();
            ResultSet resp = select.executeQuery("select * from usuario");
            while(resp.next()){
                Usuario usu= new Usuario();
                usu.setNome(resp.getString("Nome"));
                usu.setCpf(resp.getInt("CPF"));
                usu.setIsAdm(resp.getInt("IsADM"));
                usu.setUserId(resp.getInt("UserID"));
                usu.setCidade(resp.getString("Cidade"));
                usu.setEndereco(resp.getString("Endereco"));
                usu.setnFuncionario(resp.getInt("NFuncionario"));
                usuarios.add(usu);
                
            }
            select.close();
            resp.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return usuarios;
    }
    
    public Usuario getUsuario(int id) {
        Usuario usu= new Usuario();
        try {
            Connection conn=Database.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from usuario where UserID = ?");
            ps.setInt(1, id);
            ResultSet resp = ps.executeQuery();
            if (resp.next()) {// found  
                usu.setNome(resp.getString("Nome"));
                usu.setCpf(resp.getInt("CPF"));
                usu.setIsAdm(resp.getInt("IsADM"));
                usu.setUserId(resp.getInt("UserID"));
                usu.setCidade(resp.getString("Cidade"));
                usu.setEndereco(resp.getString("Endereco"));
                usu.setnFuncionario(resp.getInt("NFuncionario"));
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
        
        return usu;
    }
    public void addUsuario(Usuario usu) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("insert into produto(nome, preco, descricao, imagem, estoque) values (?, ?, ?, ?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1, usu.getNome());
            preparedStatement.setInt(2, usu.getCpf());
            preparedStatement.setInt(3, usu.getIsAdm());
            preparedStatement.setString(4, usu.getCidade());
            preparedStatement.setString(4, usu.getImagem());
            preparedStatement.setInt(5, usu.getEstoque());             
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
    
    public void updateProduto(Produto usu) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("update produto set nome=?, preco=?, descricao=?, imagem=?, estoque=?"
                    + " where idProduto=?");
            //System.out.println(new java.sql.Date(user.getAcesso().getTime()));
          // Parameters start with 1
            preparedStatement.setString(1, usu.getNome());
            preparedStatement.setDouble(2, usu.getPreco());
            preparedStatement.setString(3, usu.getDescricao());
            preparedStatement.setString(4, usu.getImagem());
            preparedStatement.setInt(5, usu.getEstoque()); 
            preparedStatement.setInt(6, usu.getId()); 
            preparedStatement.executeUpdate();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
