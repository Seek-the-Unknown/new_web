package control;

import model.User;
import service.UserService;
import service.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/profile")
public class ProfileServlet extends HttpServlet {
    private final UserService userService = new UserServiceImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=loginRequired");
            return;
        }

        User sessionUser = (User) session.getAttribute("currentUser");

        // --- 【核心修复】---
        // 不再直接使用session中的旧user对象，而是用它的用户名去数据库查询最新的用户信息
        User freshUser = userService.getUserByUsername(sessionUser.getUsername());

        // 【重要】如果查询到了最新的用户信息，也需要更新一下Session中的信息
        // 这样即使用户在个人中心内部跳转，也能拿到最新的数据
        if (freshUser != null) {
            session.setAttribute("currentUser", freshUser);
        }

        // 将最新的用户信息（而不是session中的旧信息）转发到JSP页面
        request.setAttribute("userInfo", freshUser);
        request.getRequestDispatcher("/user/profile.jsp").forward(request, response);
    }
}