package control;

import dao.HouseDAO;
import dao.HouseDAOImpl;
import model.House;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/rental/detail")
public class HouseDetailServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. 从请求的 URL 参数中获取房源 ID
            int houseId = Integer.parseInt(request.getParameter("id"));

            // 2. 从数据库中获取完整的房源详情
            // (请确保 findHouseById 方法已添加到 HouseDAO 接口并在 HouseDAOImpl 中实现)
            House house = ((HouseDAOImpl) houseDAO).findHouseById(houseId);

            if (house != null) {
                // 3. 将找到的房源对象设置为请求属性
                request.setAttribute("house", house);

                // 4. 将请求转发到 detail.jsp 页面进行渲染
                request.getRequestDispatcher("/rental/detail.jsp").forward(request, response);
            } else {
                // 处理未找到指定ID的房源的情况
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "抱歉，您请求的房源未找到。");
            }
        } catch (NumberFormatException e) {
            // 处理 ID 参数不是有效数字的情况
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "无效的房源ID格式。");
        }
    }
}