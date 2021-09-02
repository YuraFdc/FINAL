package com.epam.ragency.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserDao {
    private Connection getConnection(){
        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:8080/repair_agency", "root", "123456");
            System.out.println("Got our connection");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
