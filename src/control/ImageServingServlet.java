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

// ��� Servlet ������������ /uploads/ ��ͷ��URL����
@WebServlet("/uploads/*")
public class ImageServingServlet extends HttpServlet {
    // ��Ҫ��ʾ����·�������� HousePostServlet ��ʹ�õ�·����ȫ��ͬ
    private static final String UPLOAD_DIR = "F:/rental_uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // �� URL �л�ȡ������ļ���
        String requestedFile = request.getPathInfo();

        if (requestedFile == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // �����ļ����Դ���ո�������ַ�
        requestedFile = URLDecoder.decode(requestedFile, "UTF-8");

        File file = new File(UPLOAD_DIR, requestedFile);

        if (!file.exists() || !file.isFile()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // ���ļ���չ��ȷ����������
        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        response.setContentType(contentType);
        response.setContentLength((int) file.length());

        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}