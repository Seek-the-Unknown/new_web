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

@WebServlet("/search")
public class SearchHouseServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String location = request.getParameter("location");

        List<House> searchResults = null;
        if (location != null && !location.trim().isEmpty()) {
            searchResults = houseDAO.searchHousesByLocation(location);
        }

        request.setAttribute("searchResults", searchResults);
        request.setAttribute("searchQuery", location); // 将搜索词回传，方便在页面上显示

        request.getRequestDispatcher("/rental/search-results.jsp").forward(request, response);
    }
}