/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.invoice;
import model.invoiceDetail;

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
                + "           (?,GETDATE(),?,?,?,?,?)\n";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getInvoiceID());
            ps.setString(2, order.getCusAddress());
            ps.setFloat(3, order.getTotal());
            ps.setString(4, order.getCustomerName());
            ps.setString(5, order.getCusPhone());
            ps.setString(6, order.getUsername());
            ps.executeUpdate(); 
        } catch (Exception ex) {
            ex.printStackTrace(); // Thông báo lỗi cho console
        } finally {
            // Đóng các resource (Connection, PreparedStatement, ResultSet) ở đây nếu cần
        }
    }

    public void addNewInvoiceDetail(invoiceDetail inDetail) {
        String sql = "INSERT INTO [InvoiceDetail]\n"
                + "           ([Quantity],[Price],[InvoiceID],[ProductID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, inDetail.getQuantity());
            ps.setFloat(2, inDetail.getPrice());
            ps.setString(3, inDetail.getInvoiceID());
            ps.setString(4, inDetail.getProductID());
            ps.executeUpdate(); // Sửa từ executeQuery thành executeUpdate
        } catch (Exception ex) {
            ex.printStackTrace(); // Thông báo lỗi cho console
        } finally {
            // Đóng các resource (Connection, PreparedStatement, ResultSet) ở đây nếu cần
        }
    }

    public String getInvoiceID() {
        String sql = "select * from invoice";
        int size = 1;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                size++;
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return size + "";
    }
    
    public List<invoice> getAllInvoice(){
        List<invoice> invoiceList = new ArrayList<>();
        String sql = "select * from Invoice";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                invoice order = new invoice();
                order.setInvoiceID(rs.getString(1));
                order.setDate(rs.getDate(2));
                order.setCusAddress(rs.getString(3));
                order.setTotal(rs.getFloat(4));
                order.setCustomerName(rs.getString(5));
                order.setCusPhone(rs.getString(6));
                order.setUsername(rs.getString(7));
                invoiceList.add(order);
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return invoiceList;
    }
    
    public List<invoiceDetail> getInvoiceDetails(String id){
        String sql = "select * from InvoiceDetail where invoiceID=?";
        List<invoiceDetail> invoiceDetailList = new ArrayList<>();
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                invoiceDetail order = new invoiceDetail();
                order.setQuantity(rs.getInt(1));
                order.setPrice(rs.getFloat(2));
                order.setInvoiceID(rs.getString(3));
                order.setProductID(rs.getString(4));
                invoiceDetailList.add(order);
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return invoiceDetailList;
    }

    public static void main(String[] args) {
        invoiceDAO dao = new invoiceDAO();
        invoice order = new invoice();
        order.setCusAddress("cusAddress");
        order.setCusPhone("cusPhone");
        order.setCustomerName("cusName");
        order.setUsername("username");
        order.setInvoiceID("nvoiceID");
        order.setTotal(12);
        dao.addNewInvoice(order);
    }
}
