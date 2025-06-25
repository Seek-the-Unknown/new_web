package dDao;
import model.User;
import util.DBUtil;
import java.sql.*;

public class Dao {
//    static {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8.x驱动类名
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//
//
//    }


    // JDBC配置（根据实际数据库修改）
//    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/web";
//    private static final String JDBC_USER = "root";
//    private static final String JDBC_PASSWORD = "123456";

    public  void addUser(User user) {
        String sql = "INSERT INTO users (username, password, email, gender, last_login_time) VALUES (?, ?, ?, ?, ?)";

//        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD );
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // 设置参数
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getGender());
            pstmt.setTimestamp(5, Timestamp.valueOf(user.getLastLoginTime()));

            // 执行插入
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("用户添加成功");
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    // 异常处理方法
    private void handleSQLException(SQLException e) {
        System.err.println("SQL错误:");
        System.err.println("错误码: " + e.getErrorCode());
        System.err.println("SQL状态: " + e.getSQLState());
        System.err.println("错误信息: " + e.getMessage());
        e.printStackTrace();
    }
    public User findUserByUsernameAndPassword(String username, String encryptedPwd) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

//        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, encryptedPwd);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("gender"),
                            rs.getTimestamp("last_login_time").toLocalDateTime()
                    );
                }
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return null;
    }
     public  User checkUsers(){

             String sql = "SELECT * FROM users ";

//             try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
         try (Connection conn = DBUtil.getConnection();
                  PreparedStatement pstmt = conn.prepareStatement(sql)) {


                 try (ResultSet rs = pstmt.executeQuery()) {
                     if (rs.next()) {
                         return new User(
                                 rs.getString("username"),
                                 rs.getString("password"),
                                 rs.getString("email"),
                                 rs.getString("gender"),
                                 rs.getTimestamp("last_login_time").toLocalDateTime()
                         );
                     }
                 }
             } catch (SQLException e) {
                 handleSQLException(e);
             }
             return null;
         }


}