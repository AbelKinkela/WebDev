package alu.webdev.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// This class can be used to initialize the database connection
public class DatabaseConnection {
    public static Connection initializeDatabase()
            throws SQLException, ClassNotFoundException
    {

        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/WebDev";
        String dbUsername = "root";
        String dbPassword = "2011butterfly";
        Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        return  con;

    }
}
