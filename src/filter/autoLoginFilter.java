package filter;

import model.User; // 确保你的 User 模型类路径正确
import service.UserService;
import service.UserServiceImp; // 假设这是你的 UserService 实现类

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// 如果使用注解，注意过滤器的执行顺序可能依赖于容器实现或类名等。
// 为了精确控制顺序（AutoLoginFilter 在 AuthFilter 之前），推荐使用 web.xml。
@WebFilter(filterName = "AutoLoginFilter", urlPatterns = {"/*"})
public class autoLoginFilter implements Filter {

    private UserService userService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 在实际项目中，UserService 实例可能通过依赖注入获取
        this.userService = new UserServiceImp();
        System.out.println("AutoLoginFilter 初始化完毕.");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false); // 不主动创建session

        // 1. 检查用户是否已经通过session登录
        if (session != null && session.getAttribute("currentUser") != null) {
            filterChain.doFilter(request, response); //已登录，继续
            return;
        }

        // 2. 查找 "remember me" cookies
        Cookie[] cookies = request.getCookies();
        String username = null;
        String encryptedPwdFromCookie = null; // 从cookie中获取的密码应该是已加密的

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberedUser".equals(cookie.getName())) {
                    username = cookie.getValue();
                } else if ("rememberedPwd".equals(cookie.getName())) {
                    // LoginServlet中存入cookie的密码应该是加密后的
                    encryptedPwdFromCookie = cookie.getValue();
                }
            }
        }

        // 3. 如果找到了 "remember me" cookies，尝试自动登录
        if (username != null && encryptedPwdFromCookie != null) {
            // 调用UserService验证cookie中的用户名和（已加密的）密码
            // 你的 LoginServlet 中的 handleRememberMe 方法存储的密码已经是加密的。
            User user = userService.validateUser(username, encryptedPwdFromCookie);

            if (user != null) {
                // Cookie验证成功，创建新的session并设置登录状态
                session = request.getSession(true); // 获取或创建session
                session.setAttribute("currentUser", user);
                System.out.println("AutoLoginFilter: 用户 " + username + " 通过cookie自动登录成功。");
            } else {
                // Cookie无效或已过期，清除它们
                Cookie userCookie = new Cookie("rememberedUser", "");
                userCookie.setMaxAge(0); //立即删除
                userCookie.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
                response.addCookie(userCookie);

                Cookie pwdCookie = new Cookie("rememberedPwd", "");
                pwdCookie.setMaxAge(0); //立即删除
                pwdCookie.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
                response.addCookie(pwdCookie);
                System.out.println("AutoLoginFilter: 用户 " + username + " 的remember-me cookie无效，已清除。");
            }
        }

        filterChain.doFilter(request, response); // 继续处理请求链
    }

    @Override
    public void destroy() {
        // 清理代码
        System.out.println("AutoLoginFilter 已销毁。");
    }
}