package DAO;
import modelos.Produto;
import java.sql.*;
import codigo.Database;
import java.util.HashMap;
import java.util.Iterator;
import modelos.Carrinho;

public class CarrinhoDAO {
    
    public Carrinho addCarrinho(int idCarrinho, Carrinho carrinho) {
        // TODO: Checar se já existe esse id
        Connection conn = Database.getConnection();
        HashMap.Entry pair;

        Iterator it = carrinho.carrinho.entrySet().iterator();
        while (it.hasNext()) {
            pair = (HashMap.Entry)it.next();
            
            try {
                PreparedStatement preparedStatement = conn.prepareStatement("insert into carrinho values(?, ?, ?)");
                preparedStatement.setInt(1, idCarrinho);
                preparedStatement.setInt(2, ((Produto) pair.getKey()).getId());
                preparedStatement.setInt(3, ((Integer) pair.getValue()));

                preparedStatement.execute();

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return null;
    }
        
    public Carrinho getCarrinho(int id, boolean criarSeInexistente) {
        Carrinho carrinho = new Carrinho(id);
        int counter = 0;
        
        try {
            Connection conn = Database.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from carrinho where idCarrinho=?");
            ps.setInt(1, id);
            ResultSet resp = ps.executeQuery();
            
            ProdutoDAO produtoDAO = new ProdutoDAO();
            while (resp.next()) {
                counter += 1;
                carrinho.adicionarAoCarrinho(resp.getInt("idProduto"), resp.getInt("quantidade"));
            }
            
            conn.close();
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        }
        
        if (counter == 0) {
            if (criarSeInexistente) {
                this.addCarrinho(id, carrinho);
            } else {
                return null;
            }
        }
        
        return carrinho;
    }
    
    public void deleteCarrinho(int id) {
        try {
            Connection conn=Database.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement("delete from carrinho where idCarrinho=?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateCarrinho(Carrinho carrinho) {
        HashMap.Entry pair;

        Iterator it = carrinho.carrinho.entrySet().iterator();
        while (it.hasNext()) {
            pair = (HashMap.Entry)it.next();
            
            try {
                Connection conn = Database.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from carrinho where idCarrinho=? and idProduto=?");
                ps.setInt(1, carrinho.getId());
                ps.setInt(2, ((Integer) pair.getKey()));
                ResultSet resp = ps.executeQuery();

                int quantidade = -1;
                int counter = 0;
                ProdutoDAO produtoDAO = new ProdutoDAO();
                while (resp.next()) {
                    quantidade = resp.getInt("quantidade");
                    counter += 1;
                }

                if (counter == 0) {
                    PreparedStatement preparedStatement = conn.prepareStatement("insert into carrinho values(?, ?, ?)");
                    preparedStatement.setInt(1, carrinho.getId());
                    preparedStatement.setInt(2, ((Integer) pair.getKey()));
                    preparedStatement.setInt(3, ((Integer) pair.getValue()));

                    preparedStatement.execute();
                } else if (quantidade != ((Integer) pair.getValue())) {
                    PreparedStatement preparedStatement = conn.prepareStatement("update carrinho set quantidade=? where idCarrinho=? and idProduto=?");
                    preparedStatement.setInt(1, ((Integer) pair.getValue()));
                    preparedStatement.setInt(2, carrinho.getId());
                    preparedStatement.setInt(3, ((Integer) pair.getKey()));

                    preparedStatement.execute();
                }
                
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
