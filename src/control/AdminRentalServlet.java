// src/control/AdminRentalServlet.java
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

@WebServlet("/admin/rentals")
public class AdminRentalServlet extends HttpServlet {
    private final RentalDAO rentalDAO = new RentalDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. ��ȡ�������޼�¼
        List<Rental> rentalList = rentalDAO.getAllRentals();

        // 2. �����ݴ���request
        request.setAttribute("rentalList", rentalList);

        // 3. ת����JSPҳ��
        request.getRequestDispatcher("/admin/rented-houses.jsp").forward(request, response);
    }
}
