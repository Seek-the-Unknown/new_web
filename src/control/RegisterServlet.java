package control;

import dDao.Dao;
import model.User;
import service.UserService;
import service.UserServiceImp;
import util.SecurityUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/Lzs_register")
public class RegisterServlet extends HttpServlet {
    private final UserService userService = new UserServiceImp();
    private final Dao DDao =new Dao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 统一编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 获取参数
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String confirmPwd = request.getParameter("confirmPwd").trim();
        String email = request.getParameter("email").trim();
        String gender = request.getParameter("gender");
        System.out.println(username+"已注册");

        try {
            validateInput(password, confirmPwd);
            String encryptedPwd = SecurityUtils.encryptSHA256(password);

            User newUser = new User(username, encryptedPwd, email, gender, LocalDateTime.now());
            userService.addUser(newUser);
//            DDao.addUser(newUser);
//            response.sendRedirect("index.jsp?register=success");
            response.sendRedirect(request.getContextPath() + "/index.jsp?register=success");


        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "注册失败: " + e.getMessage());
        }
    }

    private void validateInput(String password, String confirmPwd) {
        if (!password.equals(confirmPwd)) {
            throw new IllegalArgumentException("两次输入的密码不一致");
        }
    }
}