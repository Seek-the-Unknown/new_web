package filter;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*") // 应用于所有请求
public class AuthFilter implements Filter {

    // 定义不需要登录即可访问的路径列表
    private final List<String> allowedPaths = Arrays.asList(
            "/index.jsp",        // 登录页面
            "/register.jsp",     // 注册页面
            "/Lzs_login",        // 登录处理Servlet
            "/Lzs_register",     // 注册处理Servlet
            "/image",            // 验证码Servlet
            "/rental/index.jsp", // 商城/租赁首页
            "/rental/detail.jsp",// 商品详情页 (假设存在)
            "/shop/style.css",   // 商城样式文件 (根据你的项目结构调整)
            "/css/",             // 允许访问整个css文件夹下的资源
            "/images/"           // 允许访问整个images文件夹下的资源
            // 根据需要添加其他公共静态资源，如JS文件
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 初始化代码，如果需要
        System.out.println("AuthFilter 初始化完毕.");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false); // 如果session不存在，则不创建

        // 1. 统一全站编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // response.setContentType("text/html;charset=UTF-8"); // 避免全局设置，因为过滤器会处理所有类型的资源

        String path = request.getRequestURI().substring(request.getContextPath().length());

        if (path.startsWith("/admin/")) {
//            HttpSession session = request.getSession(false);
            // 检查是否登录，并且用户名是否是'admin'
            if (session == null || session.getAttribute("currentUser") == null) {
                // 未登录，直接重定向到登录页
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=adminRequired");
                return; // 必须 return，中断后续执行
            } else {
                User user = (User) session.getAttribute("currentUser");
                if (!"admin".equals(user.getUsername())) {
                    // 已登录但不是admin用户，显示禁止访问
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "您没有权限访问此页面。");
                    return; // 必须 return
                }
            }
        }
        // 2. 权限校验
        boolean isLoggedIn = (session != null && session.getAttribute("currentUser") != null);

        // 检查是否是允许的路径，或者是否是静态资源（如.css, .js, 图片等）
        // 这里简化了静态资源判断，实际项目中可以更精确
        boolean isAllowedPath = allowedPaths.stream().anyMatch(p -> path.startsWith(p) || path.equals("/")) ||
                path.endsWith(".css") || path.endsWith(".js") ||
                path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".jpeg") || path.endsWith(".gif");

        if (isLoggedIn || isAllowedPath) {
            // 如果用户已登录，或者请求的是允许的公共路径/资源，则继续处理请求
            filterChain.doFilter(request, response);
        } else {
            // 用户未登录，且试图访问受限页面
            System.out.println("AuthFilter: 用户未登录，访问 " + path + " 被拒绝。重定向到登录页面。");
            request.setAttribute("error", "请先登录才能访问该页面。");
            // 对于未登录用户访问受限资源，通常重定向到登录页
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }

    }

    @Override
    public void destroy() {
        // 清理代码，如果需要
        System.out.println("AuthFilter 已销毁。");
    }
}