/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

/**
 *
 * @author Admin
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    
    /**
     * Connect to database by URL
     * @return
     * @throws Exception 
     */
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber;
        if (instance != null && !instance.trim().isEmpty()) {
            url += "\\" + instance;
        }
        url += ";databaseName=" + dbName;

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    private final String serverName = "LAPTOP-LHN746VG";
    private final String dbName = "bakeryDB";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "123";
}
