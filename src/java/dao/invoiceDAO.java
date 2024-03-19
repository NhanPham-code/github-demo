/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.invoice;

/**
 *
 * @author ADMIN
 */
public class invoiceDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public void addNewInvoice(invoice order) {
        String sql = "INSERT INTO [Invoice]\n"
                + "           ([InvoiceID],[Date],[CusAddress],[Total],[CustomerName],[CusPhone],[UserName])\n"
                + "     VALUES\n"
                + "           (?,GETDATE(),?,?,?,?,?)";
        
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getInvoiceID());
            ps.setString(2, order.getCusAddress());
            ps.setFloat(3, order.getTotal());
            ps.setString(4, order.getCustomerName());
            ps.setString(5, order.getCusPhone());
            ps.setString(6, order.getUsername());
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }
    }
    
    public void addNewInvoiceDetail(invoice order){
        String sql = "IINSERT INTO [InvoiceDetail]\n" +
"           ([Quantity],[Price],[InvoiceID],[ProductID])\n" +
"     VALUES\n" +
"           (?,?,?,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order.getCartTB().getQuantityTB());
            ps.setFloat(2,order.getCartTB().getProduct().getPrice() );
            ps.setString(3, order.getInvoiceID());
            ps.setString(4, order.getCartTB().getProduct().getProductID());
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }
        
    }
}
