package model;
import java.time.LocalDateTime;
public class User {
    private String username;
    private String password;
    private String email;
    private String gender;
    private LocalDateTime lastLoginTime;
    // 无参构造
    public User() {}

    // 全参构造
    public User(String username, String password, String email, String gender,LocalDateTime lastLoginTime) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.lastLoginTime = lastLoginTime;
    }
    public User (String username , String password, String email)
    {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    // Getter和Setter
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public LocalDateTime getLastLoginTime() { return lastLoginTime; }
    public void setLastLoginTime(LocalDateTime lastLoginTime) { this.lastLoginTime = lastLoginTime; }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", lastLoginTime=" + lastLoginTime +
                '}';
    }
}