/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.productCart;

/**
 *
 * @author Admin
 */
@WebServlet(name = "deleteCart", urlPatterns = {"/deleteCart"})
public class deleteCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet deleteCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get id
        String id = request.getParameter("id");

        Cookie[] cookies = request.getCookies();
        String username = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }

        // create list items from cookie
        List<productCart> cartItems = getCartItemsFromCookies(request);

        // delete 1st product with id
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getProduct().getProductID().equals(id)) {
                cartItems.remove(i);
                break;
            }
        }

        // set size of list product in cart
        String size = String.valueOf(cartItems.size());

        if (!cartItems.isEmpty()) {
            // save items list to cookie
            saveCartItemsToCookies(cartItems, response, request);
            //size cart
            Cookie cartSize = new Cookie("cartSize-" + username, size);

            cartSize.setMaxAge(60 * 60 * 24 * 60); // set 60 days

            response.addCookie(cartSize);
            // respone to cart
            response.sendRedirect("cartList");
        } else {
            Cookie cartCookie = new Cookie("cart-" + username, username); // format cart-username
            cartCookie.setMaxAge(0); // Cookie expires in 60 days
            cartCookie.setPath("/");
            response.addCookie(cartCookie);
            //delete size
            Cookie cartSize = new Cookie("cartSize-" + username, size);

            cartSize.setMaxAge(0); // set 60 days

            response.addCookie(cartSize);
            
            response.sendRedirect("cartList");
        }

    }

    private List<productCart> getCartItemsFromCookies(HttpServletRequest request) {
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
                    if (cookie.getValue() == null) {
                        return null;
                    }
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

    private void saveCartItemsToCookies(List<productCart> cartItems, HttpServletResponse response, HttpServletRequest request) {
        // get username
        Cookie[] cks = request.getCookies();
        String username = "";
        for (Cookie ck : cks) {
            if (ck.getName().equals("username")) {
                username = ck.getValue();
                break;
            }
        }

        StringBuilder cartItemsString = new StringBuilder();
        for (productCart productCart : cartItems) {
            try {
                cartItemsString.append(URLEncoder.encode(productCart.getProduct().getProductID(), "UTF-8")).
                        append("_").append(URLEncoder.encode(productCart.getQuantityTB() + "", "UTF-8")).append("-");

            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(addToCart.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Remove trailing comma
        if (cartItemsString.length() > 0) {
            cartItemsString.deleteCharAt(cartItemsString.length() - 1);
        }

        Cookie cartCookie = new Cookie("cart-" + username, cartItemsString.toString()); // format cart-username
        cartCookie.setMaxAge(60 * 60 * 24 * 60); // Cookie expires in 60 days
        cartCookie.setPath("/");
        response.addCookie(cartCookie);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
