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
import java.util.List;

// 将这个Servlet映射到应用的根路径
@WebServlet("")
public class HomeServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. 调用我们之前设计的 getAvailableHouses 方法
            //    (请确保您已经在HouseDAOImpl中实现了此方法)
            List<House> availableHouses = houseDAO.getAvailableHouses();

            // 2. 将可租房源列表存入request中
            request.setAttribute("availableHouseList", availableHouses);

            // 3. 转发到您的JSP页面进行显示
            request.getRequestDispatcher("/rental/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // 可以在这里转发到一个错误页面
            response.getWriter().println("加载房源信息时出错。");
        }
    }
}