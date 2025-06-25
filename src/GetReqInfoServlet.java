import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetReqInfoServlet", value = "/Lzs_reqInfo")
public class GetReqInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("请求方式："+request.getMethod());
        out.println("<br>URL:"+request.getRequestURL());
        out.println("<br>URI:"+request.getRequestURI());
        out.println("<br>web程序名称："+request.getContextPath());
        out.println("<br>客户端IP:"+request.getRemoteAddr());
        out.println("<br>服务端IP:"+request.getLocalAddr());
        out.println("<br>服务器端端口："+request.getLocalPort());
        out.println("<br>字符集编码："+request.getCharacterEncoding());


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
