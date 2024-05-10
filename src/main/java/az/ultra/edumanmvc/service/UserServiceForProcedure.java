package az.ultra.edumanmvc.service;

import az.ultra.edumanmvc.dto.UserDto;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceForProcedure {

    private static Connection connection;

    private static Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@10.81.1.33:1521:ORCL",
                    "SYSTEM",
                    "mark1q2w3e$$*");
            System.out.println("DB connection successfully !");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return connection;
    }

    public static void closeConnection(Connection connection) {
        try {
            connection.close();
            System.out.println("DB connection closed !");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void insertUser(UserDto userDto) {
        try {
            var connection = getConnection();
            CallableStatement statement = connection.prepareCall("{call EDUMAN_COMMON.INSERT_USER_PROCEDURE(?,?,?)}");

            statement.setString(1, userDto.getName());
            statement.setString(2, userDto.getSurname());
            statement.setString(3, userDto.getMiddleName());

            statement.execute();
            statement.close();
            closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<UserDto> getAllUsers() {
        List<UserDto> users = new ArrayList<>();

        try {
            Connection connection = getConnection();
            CallableStatement statement = connection.prepareCall("{call EDUMAN_COMMON.GET_COMMON_USERS_PROCEDURE(?)}");

            statement.registerOutParameter(1, java.sql.Types.REF_CURSOR);

            statement.execute();

            ResultSet resultSet = (ResultSet) statement.getObject(1);

            while (resultSet.next()) {
                UserDto user = new UserDto();
                user.setId(resultSet.getLong("ID"));
                user.setName(resultSet.getString("NAME"));
                user.setSurname(resultSet.getString("SURNAME"));
                user.setMiddleName(resultSet.getString("MIDDLE_NAME"));
                users.add(user);
            }

            resultSet.close();
            statement.close();
            closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public void deleteUser(Long id) {
        try {
            Connection connection = getConnection();
            CallableStatement statement = connection.prepareCall("{call EDUMAN_COMMON.DELETE_USER_PROCEDURE(?)}");

            statement.setLong(1, id);

            statement.execute();

            statement.close();
            closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(UserDto userDto) {
        try {
            Connection connection = getConnection();
            CallableStatement statement = connection.prepareCall("{call EDUMAN_COMMON.UPDATE_USER_PROCEDURE(?, ?, ?, ?)}");

            statement.setString(1, userDto.getName());
            statement.setString(2, userDto.getSurname());
            statement.setString(3, userDto.getMiddleName());
            statement.setLong(4, userDto.getId());

            statement.execute();

            statement.close();
            closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
