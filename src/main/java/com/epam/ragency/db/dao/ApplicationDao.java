package com.epam.ragency.db.dao;

import com.epam.ragency.db.Constants;
import com.epam.ragency.db.DBManager;
import com.epam.ragency.db.entity.Application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
            statement = connection.prepareStatement(Constants.GET_ALL_APPLICATIONS);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return applications;
    }

    private static class ApplicationMapper implements EntityMapper<Application> {

        @Override
        public Application mapRow(ResultSet rs) {
            try {
                Application application = new Application();
                application.setId(rs.getInt(Constants.ID_APPLICATION));

                user.setId(rs.getLong(Fields.ENTITY__ID));
                user.setLogin(rs.getString(Fields.USER__LOGIN));
                user.setPassword(rs.getString(Fields.USER__PASSWORD));
                user.setFirstName(rs.getString(Fields.USER__FIRST_NAME));
                user.setLastName(rs.getString(Fields.USER__LAST_NAME));
                user.setLocaleName(rs.getString(Fields.USER__LOCALE_NAME));
                user.setRoleId(rs.getInt(Fields.USER__ROLE_ID));
                return user;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            }
        }
    }

}
