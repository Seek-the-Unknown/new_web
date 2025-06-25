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


/**
 * 首页展示控制器
 * 处理网站根路径请求，展示可租房源信息
 * 
 * 业务流程：
 * 1. 调用HouseDAO获取所有可租房源
 * 2. 将数据存入request作用域
 * 3. 转发到首页JSP视图
 */
@WebServlet("")
public class HomeServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            List<House> availableHouses = houseDAO.getAvailableHouses();


            request.setAttribute("availableHouseList", availableHouses);


            request.getRequestDispatcher("/rental/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            response.getWriter().println("���ط�Դ��Ϣʱ����");
        }
    }
}