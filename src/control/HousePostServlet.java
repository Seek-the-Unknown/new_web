
package control;

import dao.HouseDAO;
import dao.HouseDAOImpl;
import model.House;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.UUID;
import java.util.stream.Collectors;

@WebServlet("/HousePostServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class HousePostServlet extends HttpServlet {

    // 这是您之前配置的图片上传路径
    private static final String UPLOAD_DIR = "F:/rental_uploads";
    private final HouseDAO houseDAO = new HouseDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 从Session获取当前登录用户
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=notLoggedIn");
            return;
        }

        // 1. 获取所有表单数据，包括新增的字段
        String title = request.getParameter("title");
        String houseType = request.getParameter("houseType");
        double price = Double.parseDouble(request.getParameter("price"));
        int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
        int bathrooms = Integer.parseInt(request.getParameter("bathrooms")); // 获取bathrooms
        double area = Double.parseDouble(request.getParameter("area"));       // 获取area
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String description = request.getParameter("description");

        // 2. 处理图片上传
        String imagePaths = handleImageUpload(request);

        // 3. 创建并填充House对象
        House house = new House();
        house.setTitle(title);
        house.setHouseType(houseType);
        house.setPrice(price);
        house.setBedrooms(bedrooms);
        house.setBathrooms(bathrooms);
        house.setArea(area);
        house.setCity(city);
        house.setAddress(address);
        house.setDescription(description);
        house.setImagePaths(imagePaths);
        house.setUsername(currentUser.getUsername()); // 设置发布者用户名
        house.setPostDate(LocalDateTime.now()); // 设置当前发布时间
        house.setRented(false); // 新发布的房源默认为未租赁

        // 4. 调用DAO保存到数据库
        try {
            // 这个 addHouse 方法需要在 HouseDAO 和 HouseDAOImpl 中创建
            houseDAO.addHouse(house);
            // 5. 重定向到成功页面或首页
            response.sendRedirect(request.getContextPath() + "/?post=success");
        } catch (Exception e) {
            e.printStackTrace();
            // 可以设置错误信息并转发回发布页面
            request.setAttribute("error", "发布房源失败，请重试。");
            request.getRequestDispatcher("/rental/post-house.jsp").forward(request, response);
        }
    }

    private String handleImageUpload(HttpServletRequest request) throws IOException, ServletException {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 使用Stream API来处理多个文件，更现代化
        Collection<Part> parts = request.getParts();
        return parts.stream()
                .filter(part -> "images".equals(part.getName()) && part.getSize() > 0)
                .map(part -> {
                    try {
                        String fileName = UUID.randomUUID().toString() + "_" + part.getSubmittedFileName();
                        String filePath = UPLOAD_DIR + File.separator + fileName;
                        part.write(filePath);
                        return "uploads/" + fileName; // 返回相对URL路径
                    } catch (IOException e) {
                        e.printStackTrace();
                        return null;
                    }
                })
                .filter(path -> path != null)
                .collect(Collectors.joining(",")); // 将所有图片路径用逗号拼接
    }
}