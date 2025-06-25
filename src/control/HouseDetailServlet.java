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

            int houseId = Integer.parseInt(request.getParameter("id"));


            House house = ((HouseDAOImpl) houseDAO).findHouseById(houseId);

            if (house != null) {

                request.setAttribute("house", house);


                request.getRequestDispatcher("/rental/detail.jsp").forward(request, response);
            } else {

                response.sendError(HttpServletResponse.SC_NOT_FOUND, "��Ǹ��������ķ�Դδ�ҵ���");
            }
        } catch (NumberFormatException e) {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "��Ч�ķ�ԴID��ʽ��");
        }
    }
}