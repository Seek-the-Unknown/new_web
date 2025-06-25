package dao;

import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DBUtil; // ��������DBUtil��·����ȷ

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;


public class UserDaoImpl implements UserDao {


    private final QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());


    public List<User> getUsersList() {

        String sql = "SELECT username, password, email, gender, lastLoginTime FROM users";
        try {

            return queryRunner.query(sql, new BeanListHandler<>(User.class));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    @Override
    public boolean insertOneUser(User user) {

        String sql = "INSERT INTO users (username, password, email, gender, lastLoginTime) VALUES (?, ?, ?, ?, ?)";
        try {
            int affectedRows = queryRunner.update(sql,
                    user.getUsername(),
                    user.getPassword(),
                    user.getEmail(),
                    user.getGender(),
                    user.getLastLoginTime());
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }



    public  void addUser(User user) {
        String sql = "INSERT INTO users (username, password, email, gender, last_login_time) VALUES (?, ?, ?, ?, ?)";

//        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD );
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getGender());
            pstmt.setTimestamp(5, Timestamp.valueOf(user.getLastLoginTime()));


            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("：插入成功");

            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }
    private void handleSQLException(SQLException e) {
        System.err.println("SQL错误:");
        System.err.println("错误码: " + e.getErrorCode());
        System.err.println("SQL状态: " + e.getSQLState());
        System.err.println("错误信息: " + e.getMessage());
        e.printStackTrace();
    }


    @Override
    public boolean existsByUsername(String username) {

        String sql = "SELECT username FROM users WHERE username = ?";
        try {

            User user = queryRunner.query(sql, new BeanHandler<>(User.class), username);
            return user != null;
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        }
    }
}