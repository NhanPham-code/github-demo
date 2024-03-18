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

    public Product getProductbyID(String id) {
        Product p = new Product();
        String sql = "select * from Product where ProductID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setProductID(rs.getString("ProductID"));
                p.setPrice(rs.getFloat("Price"));
                p.setProImage(rs.getString("ProImage"));
                p.setProName(rs.getString("ProName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setDescribe(rs.getString("Describe"));
                p.setTypeName(rs.getString("TypeName"));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return p;
    }
    
    public Product getProductByName(String name) {
        Product p = new Product();
        String sql = "select * from Product where ProName = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setProductID(rs.getString("ProductID"));
                p.setPrice(rs.getFloat("Price"));
                p.setProImage(rs.getString("ProImage"));
                p.setProName(rs.getString("ProName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setDescribe(rs.getString("Describe"));
                p.setTypeName(rs.getString("TypeName"));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return p;
    }

    public void addNewProduct(Product p) {

        String sql = "INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProductID());

            ps.setFloat(2, p.getPrice());
            ps.setInt(3, p.getQuantity());
            ps.setString(4, p.getProName());
            ps.setString(5, p.getProImage());
            ps.setString(6, p.getDescribe());
            ps.setString(7, p.getTypeName());
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }
    }

    public void updateProduct(Product p) {

        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductID] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[ProName] = ?\n"
                + "      ,[ProImage] = ?\n"
                + "      ,[Describe] = ?\n"
                + "      ,[TypeName] = ?\n"
                + " WHERE ProductID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProductID());
            ps.setFloat(2, p.getPrice());
            ps.setInt(3, p.getQuantity());
            ps.setString(4, p.getProName());
            ps.setString(5, p.getProImage());
            ps.setString(6, p.getDescribe());
            ps.setString(7, p.getTypeName());
            ps.setString(8, p.getProductID());
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);

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
                list.add(p);
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return list;
    }

    public void deleteProduct(String id) {
        String sql = "delete from Product where ProductID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

        } catch (Exception ex) {
            System.out.println();
        }

    }

    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
        Product p = pdao.getProductByName("rainbow");
        System.out.println(p.getProductID());
        System.out.println(p.getProName());
    }
}
