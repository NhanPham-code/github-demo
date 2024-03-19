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
import jakarta.servlet.http.HttpSession;
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
 * @author ADMIN
 */
@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
public class addToCart extends HttpServlet {

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
            out.println("<title>Servlet addToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addToCart at " + request.getContextPath() + "</h1>");
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
        String productId = request.getParameter("id");
        String quantity_raw = request.getParameter("quantity");

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

        int quantity = 0;
        if (quantity_raw != null) {
            quantity = Integer.parseInt(quantity_raw);
        }

        // Assume getProductById retrieves product details from database based on ID
        Product product = pDAO.getProductbyID(productId);

        if (product == null) {
            // Xử lý trường hợp không tìm thấy sản phẩm
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }

        // Retrieve existing cart items from cookies
        List<productCart> cartItems = getCartItemsFromCookies(request);

        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        boolean productExists = false;
        for (productCart cartItem : cartItems) {
            if (cartItem.getProduct().getProductID().equals(productId)) {
                // Nếu sản phẩm đã tồn tại, cập nhật số lượng
                cartItem.setQuantityTB(cartItem.getQuantityTB() + quantity);
                productExists = true;
                break;
            }
        }

        if (!productExists && quantity > 0) {
            // create product cart
            productCart pCart = new productCart();
            pCart.setQuantityTB(quantity);
            pCart.setProduct(product);
            // Nếu sản phẩm chưa tồn tại trong list, thêm mới vào giỏ hàng
            cartItems.add(pCart);
        }

        // Save the updated cart items in cookies
        if (quantity > 0) {
            saveCartItemsToCookies(cartItems, response, request);
        }

        // set value for cart.jsp
        request.setAttribute("list", cartItems);

        // cal total
        float total = 0;
        for (productCart cartItem : cartItems) {
            total += cartItem.getProduct().getPrice() * cartItem.getQuantityTB();
        }
        request.setAttribute("total", total);

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
                Logger.getLogger(addToCart.class.getName()).log(Level.SEVERE, null, ex);
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
