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
                usu.setCpf(resp.getString("CPF"));
                usu.setIsAdm(resp.getInt("IsADM"));
                usu.setUserId(resp.getInt("UserID"));
                usu.setEndereco(resp.getString("Endereco"));
                usu.setEmail(resp.getString("Email"));
                usu.setSenha(resp.getString("Senha"));
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
                usu.setCpf(resp.getString("CPF"));
                usu.setIsAdm(resp.getInt("IsADM"));
                usu.setUserId(resp.getInt("UserID"));
                usu.setEmail(resp.getString("Email"));
                usu.setSenha(resp.getString("Senha"));
                usu.setEndereco(resp.getString("Endereco"));
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
<<<<<<< HEAD
            PreparedStatement preparedStatement = conn.prepareStatement("insert into usuario (Nome, Email, Senha, CPF, IsADM, Endereco) values (?, ?, ?, ?, ?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1, usu.getNome());
            preparedStatement.setString(2, usu.getEmail());
            preparedStatement.setString(3, usu.getSenha());
            preparedStatement.setString(4, usu.getCpf());
            preparedStatement.setInt(5, usu.getIsAdm());
            preparedStatement.setString(6, usu.getEndereco());           
            preparedStatement.executeUpdate();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteUsuario(int id) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("delete from usuario where UserID=?");
            // Parameters start with 1
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateUsuario(Usuario usu) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("update usuario set Nome=?, Email=?, Senha=?, CPF=?, IsADM=?, Endereco=?,"
                    + " where UserID=?");
            //System.out.println(new java.sql.Date(user.getAcesso().getTime()));
          // Parameters start with 1
             preparedStatement.setString(1, usu.getNome());
<<<<<<< HEAD
             preparedStatement.setString(2, usu.getEmail());
            preparedStatement.setString(3, usu.getSenha());
            preparedStatement.setString(4, usu.getCpf());
            preparedStatement.setInt(5, usu.getIsAdm());
            preparedStatement.setString(6, usu.getEndereco());          
            preparedStatement.setInt(7, usu.getUserId());  
            preparedStatement.executeUpdate();
            
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
