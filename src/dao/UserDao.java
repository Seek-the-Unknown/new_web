package dao;

import model.User;
import java.util.List;

public interface UserDao {
    List<User> getUsersList();
    public boolean insertOneUser(User u);


    void addUser(User user);
    boolean existsByUsername(String username);
}