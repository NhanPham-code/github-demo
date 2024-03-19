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
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.productCart;

/**
 *
 * @author Admin
 */
@WebServlet(name = "cartList", urlPatterns = {"/cartList"})
public class cartList extends HttpServlet {

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
            out.println("<title>Servlet cartList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartList at " + request.getContextPath() + "</h1>");
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
        ProductDAO pDAO = new ProductDAO();

        Cookie[] cookies = request.getCookies();
        String user = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    user = cookie.getValue();
                }
            }
        }
        request.setAttribute("user", user);
        // set value for cart.jsp
        List<productCart> cartItems = getCartItemsFromCookies(request);

        

            request.setAttribute("list", cartItems);

            // cal total
            float total = 0;
            for (productCart cartItem : cartItems) {
                total += cartItem.getProduct().getPrice() * cartItem.getQuantityTB();
            }
            request.setAttribute("total", total);

            // get list type
            List<String> categoryList = pDAO.getAllType();
            request.setAttribute("categoryList", categoryList);

        
        request.getRequestDispatcher("cart.jsp").forward(request, response);

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
