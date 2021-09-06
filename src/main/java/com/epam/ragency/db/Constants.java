package com.epam.ragency.db;

public class Constants {
    private Constants(){}

    //Application fields
    public static final String ID_APPLICATION = "id_applications";
    public static final String CREATION_DATE = "creation_date";
    public static final String USER_ID = "user_id";
    public static final String DESCRIPTION = "description";
    public static final String MASTER_ID = "master_id";
    public static final String PRICE = "price";
    public static final String STATUS_ID = "status_id";
    public static final String RESPONSE = "response";

    // Application queries
    public static final String GET_ALL_APPLICATIONS = "SELECT * FROM applications ORDER BY id;";
}
