/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

/**
 *
 * @author achma
 */

import java.sql.*;
//import javax.swing.JOptionPane;
public class ConnectionDB {
    Connection connect;
    Statement stmt;
    
    String url = "jdbc:mysql://localhost/rentalmobil";
    String user = "root";
    String pass = "";
    
    public void Config()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(url, user, pass);
            stmt = connect.createStatement();
            System.out.print("Connection Success");
        }
        catch(Exception e)
        {
            System.out.print("Koneksi Gagal" +e.getMessage());
        }
    }
}