package control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;


/**
 * 图片服务控制器
 * 处理/uploads/*路径请求，提供图片文件下载服务
 * 
 * 业务流程：
 * 1. 解析请求路径参数
 * 2. 验证文件合法性
 * 3. 设置响应头信息
 * 4. 流式传输文件内容
 * 
 * 特性说明：
 * - 支持URL路径解码
 * - 自动识别MIME类型
 * - 使用缓冲区高效传输
 * - 安全路径验证机制
 */
@WebServlet("/uploads/*")
public class ImageServingServlet extends HttpServlet {

    /** 文件存储根目录 */
    private static final String UPLOAD_DIR = "F:/rental_uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
            
        // 1. 获取请求路径信息（路径参数）
        String requestedFile = request.getPathInfo();

        // 2. 路径有效性验证
        if (requestedFile == null) {
            // 路径为空时返回404错误
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 3. URL解码处理
        //    将%20等编码转换为实际字符
        requestedFile = URLDecoder.decode(requestedFile, "UTF-8");

        // 4. 构建完整文件对象
        //    实际文件位于UPLOAD_DIR目录下
        File file = new File(UPLOAD_DIR, requestedFile);

        // 5. 文件存在性验证
        if (!file.exists() || !file.isFile()) {
            // 文件不存在或不是普通文件时返回404
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 6. 自动检测MIME类型
        //    默认使用application/octet-stream
        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        // 7. 设置响应头信息
        response.setContentType(contentType);
        response.setContentLength((int) file.length());

        // 8. 文件流传输
        //    使用try-with-resources自动关闭资源
        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = response.getOutputStream()) {

            // 9. 创建4096字节缓冲区
            //    提升IO操作效率
            byte[] buffer = new byte[4096];
            int bytesRead;
            
            // 10. 分块读取并写入响应流
            while ((bytesRead = in.read(buffer)) != -1) {
                // 传输文件块数据
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}