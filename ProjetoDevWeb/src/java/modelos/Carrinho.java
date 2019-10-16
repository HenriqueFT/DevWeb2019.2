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
public class Carrinho {
    
    private int id;
    private ArrayList<Produto> listaProdutos;
    private ArrayList<Integer>  numeroProdutos;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<Produto> getListaProdutos() {
        return listaProdutos;
    }

    public void setListaProdutos(ArrayList<Produto> listaProdutos) {
        this.listaProdutos = listaProdutos;
    }

    public ArrayList<Integer> getNumeroProdutos() {
        return numeroProdutos;
    }

    public void setNumeroProdutos(ArrayList<Integer> numeroProdutos) {
        this.numeroProdutos = numeroProdutos;
    }

}
