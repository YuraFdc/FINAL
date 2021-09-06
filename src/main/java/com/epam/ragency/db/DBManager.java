package com.epam.ragency.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DBManager {
    private static DBManager instance;
    private DBManager(){}

    public static DBManager getInstance() {
        if (instance==null)
            instance = new DBManager();
        return instance;
    }

    public Connection getConnection() throws SQLException {
        Connection con = null;
        try {
            System.out.println("IN");
            Context initContext = new InitialContext();
            System.out.println("1");
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            System.out.println("2");

            // ST4DB - the name of data source
            DataSource ds = (DataSource)envContext.lookup("jdbc/Repair");
            System.out.println("3");
            con = ds.getConnection();

            System.out.println("SUCCESSFUL CONNECTION");
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return con;
    }

    public void commitAndClose(Connection con) {
        try {
            con.commit();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void rollbackAndClose(Connection con) {
        try {
            con.rollback();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
