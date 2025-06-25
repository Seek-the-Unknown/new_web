package control;

import model.User;
import service.UserService;
import service.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    private final UserService userService = new UserServiceImp();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");


        User user = userService.getUserByUsername(username); //

        if (user == null || !user.getEmail().equalsIgnoreCase(email)) {
            request.setAttribute("error", "用户名或邮箱不正确");
            request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmNewPassword)) {
            request.setAttribute("error", "两次输入的新密码不一致");
            request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
            return;
        }


        try {

            user.setPassword(newPassword);
            userService.updateUser(username, user); //


            response.sendRedirect(request.getContextPath() + "/index.jsp?passwordReset=success");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "密码更新失败，请稍后重试");
            request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
        }
    }
}