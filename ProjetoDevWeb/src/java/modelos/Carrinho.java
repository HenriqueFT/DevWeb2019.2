package modelos;

import java.util.HashMap;
import java.util.Iterator;
import DAO.ProdutoDAO;

public class Carrinho {
    private int id;
    public HashMap<Integer, Integer> carrinho;
    
    public Carrinho(int id) {
        this.id = id;
        this.carrinho = new HashMap<>();
    }
    
    public int getId() {
        return this.id;
    }
    
    public void adicionarAoCarrinho(Produto produto, int quantidade) {
        this.adicionarAoCarrinho(produto.getId(), quantidade);
    }
    
    public void adicionarAoCarrinho(int idProduto, int quantidade) {
        boolean hasKey = false;
        Iterator it = this.carrinho.entrySet().iterator();
        
        while (it.hasNext()) {
            HashMap.Entry pair = (HashMap.Entry)it.next();
            
            if (((Integer) pair.getKey()) == idProduto) {
                pair.setValue(((Integer) pair.getValue()) + quantidade);
                
                hasKey = true;
                break;
            }
        }
        
        if (!hasKey) {
            this.carrinho.put(idProduto, quantidade);
        }
    }
    
    public void removeDoCarrinho(int idProduto) {
        this.carrinho.remove(idProduto);
    }

    public int getQtdItens() {
        int qtd = 0;
        
        HashMap<String, HashMap> selects = new HashMap<>();
        qtd = this.carrinho.entrySet().stream().map((entry) -> entry.getValue()).reduce(qtd, Integer::sum);
        
        return qtd;
    }

    public float getPrecoTotal() {
        float preco = 0;

        Iterator it = this.carrinho.entrySet().iterator();

        ProdutoDAO produtoDAO = new ProdutoDAO();
        while (it.hasNext()) {
            HashMap.Entry pair = (HashMap.Entry)it.next();

            preco += produtoDAO.getProduto((Integer) pair.getKey()).getPreco() * ((Integer) pair.getValue());
        }

        return preco;
    }
}
