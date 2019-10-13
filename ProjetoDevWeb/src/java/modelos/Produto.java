/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class Produto {
    private int id;
    private String nome;
    private double preco;    
    private String descricao;
    private String imagem;
    private int estoque;
    
    public Produto() {}
    
    public Produto(ResultSet result) {
        try {
            this.id = result.getInt("id");
            this.nome = result.getString("nome");
            this.preco = result.getDouble("preco");
            this.descricao = result.getString("descricao");
            this.imagem = "img/" + result.getString("imagem");
            this.estoque = result.getInt("estoque");
        } catch (SQLException ex) {
            Logger.getLogger(Produto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }
    
    public String getPrecoFormatado() {
        String integer_part = Integer.toString((int) Math.round(this.preco));
        String decimal_part = Integer.toString((int) ((this.preco % 1) * 100));
        
        if (decimal_part.length() == 1) {
            decimal_part += "0";
        }
        
        return integer_part + ',' + decimal_part;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }
    
    
}
