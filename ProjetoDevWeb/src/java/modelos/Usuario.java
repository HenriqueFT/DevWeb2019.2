/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class Usuario {
    
    private int userId;
    private String nome;
    private String senha;
    private String cpf;
    private int isAdm;
    private String cidade;
    private String endereco;
    private int nFuncionario;
    private ArrayList<Produto> favoritos;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIsAdm() {
        return isAdm;
    }

    public void setIsAdm(int isAdm) {
        this.isAdm = isAdm;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getnFuncionario() {
        return nFuncionario;
    }

    public void setnFuncionario(int nFuncionario) {
        this.nFuncionario = nFuncionario;
    }

    public ArrayList<Produto> getFavoritos() {
        return favoritos;
    }

    public void setFavoritos(ArrayList<Produto> favoritos) {
        this.favoritos = favoritos;
    }

    //Esta funcao deve ser inplementada para sabermos se o usuario acessando tem direto de ver e executar
    //certas tarefas
    public static boolean isADM(Usuario usuario){
        
        return true;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public String getSenha(){
        return this.senha;
    }
    
}
