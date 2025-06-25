package control;

import model.User;
import service.UserService;
import service.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private final UserService userService = new UserServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            // 通过 GET 删除（点击链接）
            String username = req.getParameter("username");
            userService.deleteUser(username);
            resp.sendRedirect(req.getContextPath() + "/UserServlet");
            return;
        }

        if ("edit".equals(action)) {
            String username = req.getParameter("username");
            User u = userService.getUserByUsername(username);
            req.setAttribute("editUser", u);
        }

        List<User> users = userService.getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/admin/manage-houses.jsp").forward(req, resp);

        req.setAttribute("users", users);
        req.getRequestDispatcher("/main.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            // 新增
            User u = new User();
            u.setUsername(req.getParameter("username"));
            u.setPassword(req.getParameter("password")); // ServiceImpl 会加密
            u.setEmail(req.getParameter("email"));
            userService.addUser(u);

        } else if ("update".equals(action)) {
            // 更新
            String oldUsername = req.getParameter("oldUsername");
            User u = new User();
            u.setUsername(req.getParameter("username"));
            u.setEmail(req.getParameter("email"));
            String pwd = req.getParameter("password");
            if (pwd != null && !pwd.trim().isEmpty()) {
                u.setPassword(pwd);
            }
            userService.updateUser(oldUsername, u);
        }

        resp.sendRedirect(req.getContextPath() + "/UserServlet");
    }
}
