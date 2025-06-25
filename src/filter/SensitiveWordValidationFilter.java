package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 检测并拦截包含敏感词的表单提交。
 * 这个过滤器不修改请求，而是决定请求是否可以继续。
 */
@WebFilter(filterName = "sensitiveWordValidationFilter", urlPatterns = "/*")
public class SensitiveWordValidationFilter implements Filter {

    private static final List<String> sensitiveWords = new ArrayList<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("敏感词验证过滤器初始化...");

        try (InputStream is = this.getClass().getClassLoader().getResourceAsStream("sensitive-words.txt")) {
            if (is == null) {
                throw new ServletException("敏感词词典 sensitive-words.txt 未找到！");
            }
            BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
            String keyword;
            while ((keyword = reader.readLine()) != null) {
                if (!keyword.trim().isEmpty()) {
                    sensitiveWords.add(keyword.trim());
                }
            }
            System.out.println("敏感词词典加载完成。");
        } catch (IOException e) {
            throw new ServletException("加载敏感词词典失败", e);
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // 只对 POST 方法的表单提交进行检查
        if (!"POST".equalsIgnoreCase(httpRequest.getMethod())) {
            chain.doFilter(request, response);
            return;
        }

        // 获取请求中的所有参数 Map
        Map<String, String[]> parameterMap = httpRequest.getParameterMap();

        // 遍历所有参数值，进行检查
        for (String[] values : parameterMap.values()) {
            for (String value : values) {
                if (containsSensitiveWord(value)) {
                    // ---- 发现敏感词，拦截请求 ----
                    System.out.println("拦截到敏感词，请求被阻止。");

                    // 1. 在 Session 中设置错误消息
                    httpRequest.getSession().setAttribute("formError", "您提交的内容包含不当词语，请修改后重试。");

                    // 2. 重定向回来源页面 (通常是表单页)
                    // Referer 表示这个请求是从哪个页面来的
                    String referer = httpRequest.getHeader("Referer");
                    if (referer != null) {
                        httpResponse.sendRedirect(referer);
                    } else {
                        // 如果没有来源页面，就重定向到首页
                        httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
                    }

                    // 3. 终止处理，不调用 chain.doFilter()
                    return;
                }
            }
        }

        // ---- 内容干净，放行请求 ----
        System.out.println("内容干净，请求被放行。");
        chain.doFilter(request, response);
    }

    private boolean containsSensitiveWord(String text) {
        if (text == null) return false;
        for (String word : sensitiveWords) {
            if (text.contains(word)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void destroy() {
        sensitiveWords.clear();
    }
}