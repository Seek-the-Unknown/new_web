package service;

import model.User;
import util.DBUtil;
import util.SecurityUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImp implements UserService {

    @Override
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT username, password, email FROM users";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                list.add(u);
            }
        } catch (SQLException e) {
            throw new RuntimeException("查询所有用户失败", e);
        }
        return list;
    }

    @Override
    public User getUserByUsername(String username) {
        String sql = "SELECT username, password, email,last_login_time FROM users WHERE username = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUsername(rs.getString("username"));
                    u.setPassword(rs.getString("password"));
                    u.setEmail(rs.getString("email"));
                    java.util.Date utilDate = new java.util.Date(rs.getDate("last_login_time").getTime());
                    u.setLastLoginTime(utilDate.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDateTime());
                    return u;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("根据用户名查询用户失败", e);
        }
        return null;
    }

    @Override
    public void addUser(User user) {
        // 检查必填
        if (user.getUsername() == null || user.getUsername().trim().isEmpty()
                || user.getPassword() == null || user.getPassword().trim().isEmpty()
                || user.getEmail()    == null || user.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("用户名、密码、邮箱都不能为空");
        }

        // 防重复
        if (getUserByUsername(user.getUsername()) != null) {
            throw new IllegalArgumentException("用户名已存在");
        }

        String sql = "INSERT INTO users(username, password, email) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, SecurityUtils.encryptSHA256(user.getPassword()));
            ps.setString(3, user.getEmail());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("新增用户失败", e);
        }
    }

    @Override
    public void updateUser(String oldUsername, User user) {
        if (user.getUsername()==null || user.getUsername().trim().isEmpty()
                || user.getEmail()   ==null || user.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("用户名和邮箱不能为空");
        }
        boolean changePwd = user.getPassword()!=null && !user.getPassword().trim().isEmpty();
        String sql = changePwd
                ? "UPDATE users SET username=?, password=?, email=? WHERE username=?"
                : "UPDATE users SET username=?, email=? WHERE username=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            if (changePwd) {
                ps.setString(2, SecurityUtils.encryptSHA256(user.getPassword()));
                ps.setString(3, user.getEmail());
                ps.setString(4, oldUsername);
            } else {
                ps.setString(2, user.getEmail());
                ps.setString(3, oldUsername);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("更新用户失败", e);
        }
    }

    @Override
    public void deleteUser(String username) {
        String sql = "DELETE FROM users WHERE username = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("删除用户失败", e);
        }
    }

    @Override
    public User validateUser(String username, String encryptedPwd) {
        // 若有登录验证需求，可复用 getUserByUsername 并比对密码
        User u = getUserByUsername(username);
        if (u != null && u.getPassword().equals(encryptedPwd)) {
            return u;
        }
        return null;
    }
}
