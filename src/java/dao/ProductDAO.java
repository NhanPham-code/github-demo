/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public List<String> getAllType() {
        List<String> typeList = new ArrayList<>();
        String sql = "select distinct TypeName from Product";
        
        
        return typeList;
    }
}
