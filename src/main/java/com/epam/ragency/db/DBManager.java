package com.epam.ragency.db;

public class DBManager {
    private static String connectionUrl;
    private static DBManager instance;

    public static void setConnectionUrl(String connectionUrl) {
        DBManager.connectionUrl = connectionUrl;
    }

    /*private DBManager() {
        try(FileReader reader = new FileReader("app.properties");) {
            Properties p = new Properties();
            p.load(reader);
            setConnectionUrl(p.getProperty("connection.url"));
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }

    public static synchronized DBManager getInstance() {
        if (instance == null)
            instance = new DBManager();
        return instance;
    }

    public Connection getConnection(String connectionUrl) {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(connectionUrl);
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return connection;
    }*/
}
