/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Admin
 */
public class loginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext db = new DBContext();

    public boolean checkLogin(String username, String password) {
        String sql = "select * from Account where UserName = ? and Password = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            return rs.next(); // Trả về true nếu có kết quả, ngược lại trả về false
        } catch (Exception ex) {
            Logger.getLogger(loginDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public Account getAccountByUsername(String username) {
        Account ac = null;
        String sql = "select * from Account where UserName = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                ac = new Account();
                ac.setUsername(rs.getString("UserName"));
                ac.setFullname(rs.getString("FullName"));
                ac.setAddress(rs.getString("Address"));
                ac.setPhone(rs.getString("Phone"));
                ac.setRole(rs.getString("Role"));
                ac.setPassword(rs.getString("Password"));
            }
        } catch (Exception ex) {
            Logger.getLogger(loginDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return ac;
    }

    // add new account
    public int addNewAcc(Account ac) {
        int check = 0;
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([UserName]\n"
                + "           ,[FullName]\n"
                + "           ,[Address]\n"
                + "           ,[Phone]\n"
                + "           ,[Role]\n"
                + "           ,[Password])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, ac.getUsername());
            ps.setString(2, ac.getFullname());
            ps.setString(3, ac.getAddress());
            ps.setString(4, ac.getPhone());
            ps.setString(5, ac.getRole());
            ps.setString(6, ac.getPassword());
            check = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(loginDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return check;
    }
}
