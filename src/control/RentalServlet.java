// src/control/RentalServlet.java
package control;

import dao.*;
import model.House;
import model.Rental;
import model.User;
import dao.RentalDAOImpl;
import service.UserService;
import service.UserServiceImp;

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
    private final UserService userService = new UserServiceImp();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=notLoggedIn");
            return;
        }

        try {
            //
            int houseId = Integer.parseInt(request.getParameter("houseId"));
            User currentUser = (User) session.getAttribute("currentUser");


            Rental rental = new Rental();
            rental.setHouseId(houseId);
            rental.setUsername(currentUser.getUsername());
            rental.setRentalDate(new java.util.Date());
            rentalDAO.addRental(rental);

            houseDAO.updateHouseRentalStatus(houseId, true);

            try {
                House rentedHouse = houseDAO.findHouseById(houseId); // 获取被租的房源信息
                if (rentedHouse != null) {
                    userService.updateUserBalance(rentedHouse.getUsername(), rentedHouse.getPrice());
                    System.out.println("已将 " + rentedHouse.getPrice() + "元 转入用户 " + rentedHouse.getUsername() + " 的账户。");
                }
            } catch(Exception e) {
                e.printStackTrace(); // 入账失败只记录日志，不影响租赁流程
            }

            response.sendRedirect(request.getContextPath() + "/?rent=success");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/rental/index.jsp?error=invalidHouseId");
        } catch (Exception e) {

            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/rental/index.jsp?error=rentalFailed");
        }
    }
}
