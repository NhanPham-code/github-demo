/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dao.invoiceDAO;
import dao.loginDAO;
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
import model.Account;
import model.Product;
import model.invoice;
import model.invoiceDetail;
import model.productCart;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "orderConfirm", urlPatterns = {"/orderConfirm"})
public class orderConfirm extends HttpServlet {

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
            out.println("<title>Servlet orderConfirm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderConfirm at " + request.getContextPath() + "</h1>");
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
        Account acc = new Account();
        loginDAO ldao = new loginDAO();
        boolean checkCartEmpty = true;
        Cookie[] cookies = request.getCookies();

        String user = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    user = cookie.getValue();
                }
            }
        }

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart-" + user)) {
                    checkCartEmpty = false;
                }
            }
        }

        if (checkCartEmpty == false) {
            request.setAttribute("username", user);

            acc = ldao.getAccountByUsername(user);
            request.setAttribute("acc", acc);

            request.getRequestDispatcher("orderConfirm.jsp").forward(request, response);
        } else {
            request.setAttribute("emptyCart", "Your cart is empty now! Please add to cart before confirm order!");
            request.getRequestDispatcher("cartList").forward(request, response);
        }

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

        String cusName = request.getParameter("customerName");
        String cusAddress = request.getParameter("cusAddress");
        String cusPhone = request.getParameter("cusPhone");
        Cookie[] cks = request.getCookies();
        invoice order = new invoice();
        String username = "";
        for (Cookie ck : cks) {
            if (ck.getName().equals("username")) {
                username = ck.getValue();
                break;
            }
        }
        List<productCart> cartItems = getCartItemsFromCookies(request);
        float total = 0;
        for (productCart cartItem : cartItems) {
            total += cartItem.getProduct().getPrice() * cartItem.getQuantityTB();
        }

        invoiceDAO idao = new invoiceDAO();
        // auto create invoiceID
        String invoiceID = idao.getInvoiceID();

        order.setCusAddress(cusAddress);
        order.setCusPhone(cusPhone);
        order.setCustomerName(cusName);
        order.setUsername(username);
        order.setInvoiceID(invoiceID);
        order.setTotal(total);
        idao.addNewInvoice(order);

        for (int i = 0; i < cartItems.size(); i++) {
            invoiceDetail orderDetail = new invoiceDetail();
            orderDetail.setInvoiceID(invoiceID);
            orderDetail.setPrice(cartItems.get(i).getProduct().getPrice());
            orderDetail.setProductID(cartItems.get(i).getProduct().getProductID());
            orderDetail.setQuantity(cartItems.get(i).getQuantityTB());
            idao.addNewInvoiceDetail(orderDetail);
        }

        // delete cart after order
        Cookie cartCookie = new Cookie("cart-" + username, username); // format cart-username
        cartCookie.setMaxAge(0); // Cookie expires in 60 days
        cartCookie.setPath("/");
        response.addCookie(cartCookie);

        // delete cart size
        Cookie cartSize = new Cookie("cartSize-" + username, "0");
        cartSize.setMaxAge(0); // set 60 days
        response.addCookie(cartSize);
        
        response.sendRedirect("cartList");

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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
