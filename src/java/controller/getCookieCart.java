/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ProductDAO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.productCart;

/**
 *
 * @author ADMIN
 */
public class getCookieCart {
     public List<productCart> getCartItemsFromCookies(HttpServletRequest request) {
        // get username
        Cookie[] cks = request.getCookies();
        String username = "";
        for (Cookie ck : cks) {
            if (ck.getName().equals("username")) {
                username = ck.getValue();
                break;
            }
        }

        ProductDAO pDAO = new ProductDAO();
        Cookie[] cookies = request.getCookies();
        List<productCart> cartItems = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart-" + username)) { // format cart-username
                    String[] cartItem = cookie.getValue().split("-");
                    //
                    for (int i = 0; i < cartItem.length; i++) {
                        String[] cart = cartItem[i].split("_");
                        Product product = pDAO.getProductbyID(cart[0]);
                        productCart pCart = new productCart();
                        pCart.setProduct(product);
                        pCart.setQuantityTB(Integer.parseInt(cart[1]));
                        if (product != null) {
                            cartItems.add(pCart);
                        }
                    }
                    break; // Assuming there's only one "cart" cookie
                }
            }
        }
        return cartItems;
    }
}
