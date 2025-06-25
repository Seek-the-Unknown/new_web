//package control;
//
//import model.User;
//import service.UserService;
//import service.UserServiceImp;
//import util.SecurityUtils;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@WebServlet("/Lzs_login")
//public class LoginServlet extends HttpServlet {
//    private final UserService userService = new UserServiceImp();
//
//    private void handleRememberMe(HttpServletRequest request, HttpServletResponse response,String rememberMe,
//                              String username, String encryptedPwd) {
//        if ("on".equalsIgnoreCase(rememberMe)) {
//            // 存入 Cookie 而非 Session
//            Cookie userCookie = new Cookie("rememberedUser", username);
//            Cookie pwdCookie  = new Cookie("rememberedPwd", encryptedPwd);
//            userCookie.setMaxAge(7 * 24 * 3600); // 一周
//            pwdCookie.setMaxAge(7 * 24 * 3600);
//            request.getSession().getServletContext().setAttribute("dummy", "");
//            request.getSession();
////            HttpServletResponse resp = (HttpServletResponse) request.getAttribute("response");
//            response.addCookie(userCookie);
//            response.addCookie(pwdCookie);
//            System.out.println("已存入Cookie");
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//
//        // —— 验证码校验 —— //
//        String inputCode  = request.getParameter("checkcode");
//
//        HttpSession session = request.getSession();
//        String sessionCode = (String) session.getAttribute("checkcode");
//        session.removeAttribute("checkcode");  // 取出即删，防重用
//
//        if (inputCode == null || inputCode.trim().isEmpty()) {
//            request.setAttribute("error", "请输入验证码");
//            request.getRequestDispatcher("/index.jsp").forward(request, response);
//            return;
//        }
//        if (sessionCode == null || !sessionCode.equalsIgnoreCase(inputCode.trim())) {
//            request.setAttribute("error", "验证码不匹配");
//            request.getRequestDispatcher("/index.jsp").forward(request, response);
//            return;
//        }
//
//
//
//        // —— 登录逻辑 —— //
//        String username     = request.getParameter("username").trim();
//        String password     = request.getParameter("password").trim();
//        String rememberMe   = request.getParameter("rememberMe");
//        String encryptedPwd = SecurityUtils.encryptSHA256(password);
//
//        User validUser = validateUser(username, encryptedPwd);
//        if (validUser != null) {
//            session.setAttribute("currentUser", validUser);
//            handleRememberMe(request,response, rememberMe, username, encryptedPwd);
//
//
//            if(validUser.getUsername().equals("admin")) {
//                response.sendRedirect(request.getContextPath() + "/admin/manage");
//                return;
//            }
//
//            response.sendRedirect(request.getContextPath()+"/rental/index.jsp");
//        } else {
//            response.sendRedirect(request.getContextPath() + "/");
//            request.setAttribute("error", "用户名或密码错误");
//            request.getRequestDispatcher("/index.jsp").forward(request, response);
//        }
//    }
////匹配用户名和密码
////    private User validateUser(String username, String encryptedPwd) {
////        return userService.getAllUsers().stream()
////                .filter(u -> u.getUsername().equalsIgnoreCase(username))
////                .filter(u -> u.getPassword().equals(encryptedPwd))
////                .findFirst().orElse(null);
////    }
//private User validateUser(String username, String encryptedPwd) {
//    return userService.validateUser(username, encryptedPwd);
//}
//}
package control;

import model.User;
import service.UserService;
import service.UserServiceImp;
import util.SecurityUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/Lzs_login")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserServiceImp();

    private void handleRememberMe(HttpServletRequest request, HttpServletResponse response, String rememberMe,
                                  String username, String encryptedPwd) {
        if ("on".equalsIgnoreCase(rememberMe)) {
            Cookie userCookie = new Cookie("rememberedUser", username);
            Cookie pwdCookie  = new Cookie("rememberedPwd", encryptedPwd);
            userCookie.setMaxAge(7 * 24 * 3600); // 一周
            pwdCookie.setMaxAge(7 * 24 * 3600);

            // 设置Cookie的路径为整个应用，这样在任何页面都能访问到
            String contextPath = request.getContextPath();
            userCookie.setPath(contextPath.isEmpty() ? "/" : contextPath);
            pwdCookie.setPath(contextPath.isEmpty() ? "/" : contextPath);

            response.addCookie(userCookie);
            response.addCookie(pwdCookie);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // —— 验证码校验 —— //
        String inputCode  = request.getParameter("checkcode");
        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("checkcode");
        session.removeAttribute("checkcode");  // 取出即删，防重用

        if (sessionCode == null || !inputCode.trim().equalsIgnoreCase(sessionCode)) {
            request.setAttribute("error", "验证码不匹配");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        // —— 登录逻辑 —— //
        String username     = request.getParameter("username").trim();
        String password     = request.getParameter("password").trim();
        String rememberMe   = request.getParameter("rememberMe");
        String encryptedPwd = SecurityUtils.encryptSHA256(password);

        User validUser = userService.validateUser(username, encryptedPwd);

        if (validUser != null) {
            // ================= 登录成功 =================
            session.setAttribute("currentUser", validUser);
            handleRememberMe(request, response, rememberMe, username, encryptedPwd);

            if ("admin".equals(validUser.getUsername())) {
                // 管理员重定向到后台管理页面
                response.sendRedirect(request.getContextPath() + "/admin/manage");
            } else {
                // 【修正点一】普通用户重定向到由 HomeServlet 处理的根路径
                response.sendRedirect(request.getContextPath() + "/");
            }
        } else {
            // ================= 登录失败 =================
            request.setAttribute("error", "用户名或密码错误");
            // 【修正点二】只使用 forward 将错误信息传递给登录页面，删除多余的 sendRedirect
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private User validateUser(String username, String encryptedPwd) {
        return userService.validateUser(username, encryptedPwd);
    }
}