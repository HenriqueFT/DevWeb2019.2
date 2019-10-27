package util;


public class FormataPreco {
    public static String formata(float preco) {
        String parte_inteira = Integer.toString((int) preco / 1);
        String parte_decimal = Integer.toString((int) (preco % 1) * 100);
        
        if (parte_decimal.length() == 1) {
            parte_decimal += "0";
        }
        
        return "R$ " + parte_inteira + "," + parte_decimal;
    }
}
