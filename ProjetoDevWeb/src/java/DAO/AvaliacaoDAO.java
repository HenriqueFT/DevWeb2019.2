/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Modelos.Avaliacao;
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
public class AvaliacaoDAO {
    public List<Avaliacao> getAvaliacoes() {
        ArrayList<Avaliacao> avaliacoes = new ArrayList<>();
        Connection conn=Database.getConnection();
        try {
            Statement select = conn.createStatement();
            ResultSet resp = select.executeQuery("select * from avaliacao");
            while(resp.next()){
                Avaliacao aval = new Avaliacao();
                aval.setUserId(resp.getInt("UserID"));
                aval.setIdProduto(resp.getInt("idProduto"));
                aval.setNota(resp.getInt("Nota"));
                avaliacoes.add(aval);
                
            }
            select.close();
            resp.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(AvaliacaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return avaliacoes;
    }
    public List<Avaliacao> getAvaliacoesByProduto(int id) {
        ArrayList<Avaliacao> avaliacoes = new ArrayList<>();
        Connection conn=Database.getConnection();
        try {
            Statement select = conn.createStatement();
            PreparedStatement ps = conn.prepareStatement("select * from avaliacao where idProduto = ?");
            ps.setInt(1, id);
            ResultSet resp = ps.executeQuery();
            while(resp.next()){
                Avaliacao aval = new Avaliacao();
                aval.setUserId(resp.getInt("UserID"));
                aval.setIdProduto(resp.getInt("idProduto"));
                aval.setNota(resp.getInt("Nota"));
                avaliacoes.add(aval);
                
            }
            select.close();
            resp.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(AvaliacaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return avaliacoes;
    }
    
    
    public Avaliacao getAvaliacao(int id,int idUser) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from valiacao where idProduto = ?, UserID=?");
            ps.setInt(1, id);
            ps.setInt(2,idUser);
            ResultSet resp = ps.executeQuery();
            if (resp.next()) {// found  
                 Avaliacao aval = new Avaliacao();
                aval.setUserId(resp.getInt("UserID"));
                aval.setIdProduto(resp.getInt("idProduto"));
                aval.setNota(resp.getInt("Nota"));
                return aval;
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
        
        return null;
    }
    
    public void addAvaliacao(Avaliacao aval) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("insert into avaliacao(UserID, idProduto, Nota) values (?, ?, ?)");
            // Parameters start with 1
            
            preparedStatement.setInt(1, aval.getUserId());
            preparedStatement.setInt(2, aval.getIdProduto());
            preparedStatement.setInt(3, aval.getNota());
            preparedStatement.executeUpdate();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteAvaliacao(int id,int idUser) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("delete from avaliacao where idProduto = ?, UserID=?");
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2,idUser);
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateAvaliacao(Avaliacao aval) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("update avaliacao set Nota=?"
                    + " where idProduto = ?, UserID=?");
            preparedStatement.setInt(1, aval.getNota());
            preparedStatement.setInt(2, aval.getIdProduto());
            preparedStatement.setInt(3, aval.getUserId());
            preparedStatement.executeUpdate();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
