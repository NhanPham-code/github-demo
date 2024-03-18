/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import model.Product;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "addNewProduct", urlPatterns = {"/addNewProduct"})
public class addNewProduct extends HttpServlet {

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
            out.println("<title>Servlet addNewProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addNewProduct at " + request.getContextPath() + "</h1>");
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
        Product p = new Product();
        ProductDAO dao = new ProductDAO();
        boolean error = false;

        String proName = request.getParameter("proName");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String describe = request.getParameter("describe");
        String typename = request.getParameter("typeName");

        String productID = request.getParameter("productID");
        p = dao.getProductbyID(productID);

        if (p.getProName() != null) {
            request.setAttribute("error3", "The ProID is already exist!");
            error = true;
        }

        if (!error) {

            int quantity = Integer.parseInt(quantity_raw);
            float price = Float.parseFloat(price_raw);

            Part part = request.getPart("proImage");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            // Lấy đường dẫn thực tế của thư mục images trong project
            String realPath = getServletContext().getRealPath("/img/PRODUCT/" + typename);

            // Lưu file vào thư mục images trong project với tên file giữ nguyên
            String filePath = Paths.get(realPath, filename).toString();
            part.write(filePath);

            // Lấy đường dẫn tuyệt đối của file đã lưu
            String absolutePath = "img/PRODUCT/" + typename + "/" + filename; // day la duong dan se luu trong DB

            Product newProduct = new Product();
            newProduct.setProductID(productID);
            newProduct.setProName(proName);
            newProduct.setPrice(price);
            newProduct.setQuantity(quantity);
            newProduct.setProImage(absolutePath);
            newProduct.setDescribe(describe);
            newProduct.setTypeName(typename);
            dao.addNewProduct(newProduct);
            response.sendRedirect("");
        } else {
            request.getRequestDispatcher("addNewProduct.jsp").forward(request, response);
        }
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
