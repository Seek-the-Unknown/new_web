package dao;

import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DBUtil; // 假设您的DBUtil类路径正确

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 * UserDao 接口的实现类
 * 使用 Apache Commons DBUtils 组件与数据库进行交互
 */
public class UserDaoImpl implements UserDao {

    // 从连接池获取数据源，创建QueryRunner对象
    private final QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());

    /**
     * 获取所有用户列表
     * @return 包含所有用户的列表，如果发生错误或没有用户则返回null或空列表
     */
    @Override
    public List<User> getUsersList() {
        // 注意：假设数据库表名为 'users' 且包含与User模型对应的列
        String sql = "SELECT username, password, email, gender, lastLoginTime FROM users";
        try {
            // 使用 BeanListHandler 将结果集映射到 User 对象的 List 中
            return queryRunner.query(sql, new BeanListHandler<>(User.class));
        } catch (SQLException e) {
            e.printStackTrace(); // 在生产环境中建议使用日志框架记录错误
            return null; // 或返回 Collections.emptyList();
        }
    }

    /**
     * 插入一个新用户
     * @param user 要插入的User对象
     * @return 如果插入成功（影响行数 > 0），返回 true，否则返回 false
     */
    @Override
    public boolean insertOneUser(User user) {
        // SQL语句中的字段需要和数据库表 'users' 的列名完全对应
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

    /**
     * 添加一个新用户 (void 返回类型)
     * @param user 要添加的User对象
     */
//    @Override
//    public void addUser(User user) {
//        // 为了避免代码重复，可以直接调用已经实现的 insertOneUser 方法并忽略其返回值
//        // 或者可以像下面这样重新实现一遍
//        String sql = "INSERT INTO users (username, password, email, gender, lastLoginTime) VALUES (?, ?, ?, ?, ?)";
//        try {
//            queryRunner.update(sql,
//                    user.getUsername(),
//                    user.getPassword(),
//                    user.getEmail(),
//                    user.getGender(),
//                    user.getLastLoginTime());
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
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
    private void handleSQLException(SQLException e) {
        System.err.println("SQL错误:");
        System.err.println("错误码: " + e.getErrorCode());
        System.err.println("SQL状态: " + e.getSQLState());
        System.err.println("错误信息: " + e.getMessage());
        e.printStackTrace();
    }

    /**
     * 检查用户名是否存在
     * @param username 要检查的用户名
     * @return 如果存在，返回 true，否则返回 false
     */
    @Override
    public boolean existsByUsername(String username) {
        // 通过查询单个用户对象是否为null来判断用户是否存在
        // 仅查询一个字段（如主键或用户名）比查询所有字段（SELECT *）更高效
        String sql = "SELECT username FROM users WHERE username = ?";
        try {
            // BeanHandler 如果查询不到结果会返回 null
            User user = queryRunner.query(sql, new BeanHandler<>(User.class), username);
            return user != null;
        } catch (SQLException e) {
            e.printStackTrace();
            // 出现异常时，保守地返回false，表示无法确认用户存在
            return false;
        }
    }
}