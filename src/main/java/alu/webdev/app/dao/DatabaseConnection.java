package alu.webdev.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// This class can be used to initialize the database connection
public class DatabaseConnection {
    public static Connection initializeDatabase()
            throws SQLException, ClassNotFoundException
    {
        // Initialize all the information regarding
        // Database Connection
/*        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/WebDev";
        // Database name to access
        String dbName = "@localhost";
        String dbUsername = "root";
        String dbPassword = "2011butterfly";

        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL + dbName,
                dbUsername,
                dbPassword);
        return con;*/
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/WebDev";
        String dbUsername = "root";
        String dbPassword = "2011butterfly";
        Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        return  con;


    }
}
