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
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<String> getAllType() {
        List<String> typeList = new ArrayList<>();
        String sql = "select distinct TypeName from Product";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String typeName = rs.getString(1);
                typeList.add(typeName);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return typeList;
    }

    public List<Product> getAllProductWithType(String type) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from product where TypeName = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getString("ProductID"));
                p.setPrice(rs.getFloat("Price"));
                p.setProImage(rs.getString("ProImage"));
                p.setProName(rs.getString("ProName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setDescribe(rs.getString("Describe"));
                p.setTypeName(rs.getString("TypeName"));
                listProduct.add(p);
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return listProduct;
    }

    public List<Product> getAllProductByName(String name) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where ProName like ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getString("ProductID"));
                p.setPrice(rs.getFloat("Price"));
                p.setProImage(rs.getString("ProImage"));
                p.setProName(rs.getString("ProName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setDescribe(rs.getString("Describe"));
                p.setTypeName(rs.getString("TypeName"));
                listProduct.add(p);
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return listProduct;
    }

    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
        List<Product> typeList = pdao.getAllProductWithType("Bread");
        for (int i = 0; i < typeList.size(); i++) {
            System.out.println(typeList.get(i).getProName());
        }
    }
}
