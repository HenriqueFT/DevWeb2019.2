<%@page import="java.util.Random"%>

<%   
    Cookie[] cookies = request.getCookies();
    int idCarrinho = -1;
    
    if (cookies != null) {
        for(int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("ck_carrinho")) {
                idCarrinho = Integer.parseInt(cookies[i].getValue());
                break;
            }
        }
    }
    
    if (idCarrinho == -1) {
        Random random = new Random();
        idCarrinho = random.nextInt(10000000);
        
        Cookie ck_carrinho = new Cookie("ck_carrinho", Integer.toString(idCarrinho));
        ck_carrinho.setMaxAge(60*60);  // 1 hora

        response.addCookie(ck_carrinho);
    }
%>
