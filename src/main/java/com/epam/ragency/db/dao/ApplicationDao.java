package com.epam.ragency.db.dao;

import com.epam.ragency.db.Constants;
import com.epam.ragency.db.DBManager;
import com.epam.ragency.db.entity.Application;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDao {

    // return all applications from database
    public List<Application> getAllApplications(){
        List<Application> applications = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Connection connection = null;
        try {
            connection = DBManager.getInstance().getConnection();
            ApplicationMapper mapper = new ApplicationMapper();
            statement = connection.prepareStatement(Constants.GET_ALL_APPLICATIONS);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                applications.add(mapper.mapRow(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }

    private static class ApplicationMapper implements EntityMapper<Application> {

        @Override
        public Application mapRow(ResultSet rs) {
            try {
                Application application = new Application();

                application.setId(rs.getInt(Constants.ID_APPLICATION));
                application.setCreationDate(rs.getDate(Constants.CREATION_DATE));
                application.setUserId(rs.getInt(Constants.USER_ID));
                application.setDescription(rs.getString(Constants.DESCRIPTION));
                application.setUserId(rs.getInt(Constants.MASTER_ID));
                application.setPrice(rs.getFloat(Constants.PRICE));
                application.setStatusId(rs.getInt(Constants.STATUS_ID));
                application.setResponse(rs.getString(Constants.RESPONSE));

                return application;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            }
        }
    }

}
