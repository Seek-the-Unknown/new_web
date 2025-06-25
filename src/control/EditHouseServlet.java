package control;

import dao.HouseDAO;
import dao.HouseDAOImpl;
import model.House;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/user/editHouse")
@MultipartConfig( // <-- 在这里添加注解
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class EditHouseServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    // 显示编辑表单
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=loginRequired");
            return;
        }

        try {
            int houseId = Integer.parseInt(request.getParameter("id"));
            House house = houseDAO.findHouseById(houseId);
            User currentUser = (User) session.getAttribute("currentUser");

            // 安全检查：确保是房主本人在编辑
            if (house != null && house.getUsername().equals(currentUser.getUsername())) {
                request.setAttribute("house", house);
                request.getRequestDispatcher("/user/editHouse.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/user/dashboard?error=authFailed");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/user/dashboard?error=invalidId");
        }
    }

    // 处理表单提交
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=loginRequired");
            return;
        }
        request.setCharacterEncoding("UTF-8");

        // 这是您之前配置的图片上传路径
        final String UPLOAD_DIR = "F:/rental_uploads";

        try {
            int houseId = Integer.parseInt(request.getParameter("houseId"));
            User currentUser = (User) session.getAttribute("currentUser");
            House originalHouse = houseDAO.findHouseById(houseId);

            // 安全检查
            if (originalHouse == null || !originalHouse.getUsername().equals(currentUser.getUsername())) {
                response.sendRedirect(request.getContextPath() + "/user/dashboard?error=authFailed");
                return;
            }

            // 1. 处理图片删除
            String[] imagesToDelete = request.getParameterValues("deleteImages");
            List<String> currentImagePaths = new ArrayList<>();
            if (originalHouse.getImagePaths() != null && !originalHouse.getImagePaths().isEmpty()) {
                currentImagePaths.addAll(Arrays.asList(originalHouse.getImagePaths().split(",")));
            }

            if (imagesToDelete != null) {
                for (String imagePath : imagesToDelete) {
                    // 从列表中移除
                    currentImagePaths.remove(imagePath);
                    // 从服务器硬盘删除文件
                    File fileToDelete = new File(UPLOAD_DIR, imagePath.replace("uploads/", ""));
                    if (fileToDelete.exists()) {
                        fileToDelete.delete();
                    }
                }
            }

            // 2. 处理新上传的图片 (代码借鉴自 HousePostServlet)
            Collection<Part> parts = request.getParts();
            String newUploadedPaths = parts.stream()
                    .filter(part -> "newImages".equals(part.getName()) && part.getSize() > 0)
                    .map(part -> {
                        try {
                            String fileName = UUID.randomUUID().toString() + "_" + part.getSubmittedFileName();
                            part.write(UPLOAD_DIR + File.separator + fileName);
                            return "uploads/" + fileName; // 返回相对URL路径
                        } catch (IOException e) {
                            e.printStackTrace();
                            return null;
                        }
                    })
                    .filter(path -> path != null)
                    .collect(Collectors.joining(","));

            // 3. 合并新旧图片路径
            if (!newUploadedPaths.isEmpty()) {
                currentImagePaths.add(newUploadedPaths);
            }
            String finalImagePaths = String.join(",", currentImagePaths);


            // 4. 更新房源的其他文本信息
            originalHouse.setTitle(request.getParameter("title"));
            originalHouse.setDescription(request.getParameter("description"));
            // ... 更新其他字段 ...

            // 设置更新后的图片路径
            originalHouse.setImagePaths(finalImagePaths);

            // 5. 将更新后的对象保存到数据库
            ((HouseDAOImpl) houseDAO).updateHouse(originalHouse); //

            // 成功后重定向回用户中心
            response.sendRedirect(request.getContextPath() + "/user/dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "更新失败，请检查输入数据。");
            // 如果失败，需要重新加载旧数据并显示编辑页
            int houseId = Integer.parseInt(request.getParameter("houseId"));
            request.setAttribute("house", houseDAO.findHouseById(houseId));
            request.getRequestDispatcher("/user/editHouse.jsp").forward(request, response);
        }
    }
}