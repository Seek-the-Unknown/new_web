// src/control/RentalServlet.java
package control;

import dao.*;
import model.Rental;
import model.User;
import dao.RentalDAOImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/rental/rent")
public class RentalServlet extends HttpServlet {
    private final RentalDAO rentalDAO = new RentalDAOImpl();
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // 1. 检查用户是否登录
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=notLoggedIn");
            return;
        }

        try {
            // 2. 获取参数
            int houseId = Integer.parseInt(request.getParameter("houseId"));
            User currentUser = (User) session.getAttribute("currentUser");

            // 3. 创建租赁记录
            Rental rental = new Rental();
            rental.setHouseId(houseId);
            rental.setUsername(currentUser.getUsername());
            rental.setRentalDate(new java.util.Date());
            rentalDAO.addRental(rental);

            // 4. 更新房源状态为“已租”
            houseDAO.updateHouseRentalStatus(houseId, true);

            // 5. 重定向到成功页面或用户个人中心
            // 这里我们先简单地重定向回首页，并带上成功提示
            response.sendRedirect(request.getContextPath() + "/?rent=success");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/rental/index.jsp?error=invalidHouseId");
        } catch (Exception e) {
            // 记录异常
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/rental/index.jsp?error=rentalFailed");
        }
    }
}
