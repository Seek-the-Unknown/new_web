package control;

import dao.HouseDAO;
import dao.HouseDAOImpl;
import model.House;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/dashboard")
public class DashboardServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // 权限检查
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=loginRequired");
            return;
        }

        User currentUser = (User) session.getAttribute("currentUser");
        String action = request.getParameter("action");

        // 处理删除请求
        if ("delete".equals(action)) {
            handleDelete(request, response, currentUser);
            return; // 删除后重定向，结束方法
        }

        // 默认显示房源列表
        showDashboard(request, response, currentUser);
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        // 从数据库获取该用户发布的所有房源
        // 注意：你需要确保 HouseDAOImpl 中有 findHousesByUsername 方法
        List<House> userHouses = ((HouseDAOImpl) houseDAO).findHousesByUsername(user.getUsername());
        request.setAttribute("userHouses", userHouses);
        request.getRequestDispatcher("/user/dashboard.jsp").forward(request, response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
        try {
            int houseId = Integer.parseInt(request.getParameter("id"));
            // 安全检查：确保要删除的房源确实属于当前登录用户
            House house = houseDAO.findHouseById(houseId);
            if (house != null && house.getUsername().equals(user.getUsername())) {
                houseDAO.deleteHouse(houseId);
            } else {
                // 如果尝试删除不属于自己的房源，可以记录日志或显示错误
                System.out.println("安全警告：用户 " + user.getUsername() + " 尝试删除不属于自己的房源 " + houseId);
            }
        } catch (NumberFormatException e) {
            System.err.println("无效的房源ID");
        }
        // 操作完成后重定向回列表页，以刷新列表
        response.sendRedirect(request.getContextPath() + "/user/dashboard");
    }
}