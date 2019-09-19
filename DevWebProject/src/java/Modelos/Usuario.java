/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class Usuario {
    
    private int id;
    private String nome;
    private int admin;
    private ArrayList<Produto> favoritos;

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

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public ArrayList<Produto> getFavoritos() {
        return favoritos;
    }

    public void setFavoritos(ArrayList<Produto> favoritos) {
        this.favoritos = favoritos;
    }
    
    
    
    
}
