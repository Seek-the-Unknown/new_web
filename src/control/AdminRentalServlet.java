package control;

import dao.RentalDAO;
import dao.RentalDAOImpl;
import model.Rental;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 管理员租赁管理控制器
 * 处理/admin/rentals路径请求，展示所有租赁记录
 * 
 * 业务流程：
 * 1. 调用RentalDAO获取全部租赁信息
 * 2. 将数据存入request作用域
 * 3. 转发到已租房屋管理页面
 * 
 * 访问权限：仅管理员可用
 * 请求方法：GET
 * 响应视图：/admin/rented-houses.jsp
 */
@WebServlet("/admin/rentals")
public class AdminRentalServlet extends HttpServlet {
    private final RentalDAO rentalDAO = new RentalDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Rental> rentalList = rentalDAO.getAllRentals();

            request.setAttribute("rentalList", rentalList);

            request.getRequestDispatcher("/admin/rented-houses.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("طԴϢʱ");
        }
    }
}