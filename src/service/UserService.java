package service;

import model.User;
import java.util.List;

public interface UserService {
    List<User> getAllUsers();
    void addUser(User user);
    public User validateUser(String username, String encryptedPwd);
//    boolean userExists(String username);
//    public boolean addOneUser();
    User getUserByUsername(String username);
    void updateUser(String oldUsername, User user);
    void deleteUser(String username);
}