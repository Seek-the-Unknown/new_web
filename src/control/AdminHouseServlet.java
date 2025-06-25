//package control;
//
//import dao.HouseDAO;
//import dao.HouseDAOImpl;
//import model.House;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//// URL映射到 /admin/ 路径下，方便过滤器进行保护
//@WebServlet("/admin/manage")
//public class AdminHouseServlet extends HttpServlet {
//    private final HouseDAO houseDAO = new HouseDAOImpl();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("delete".equals(action)) {
//            // 处理删除请求
//            handleDelete(request, response);
////            return;
//        } else {
//            // 默认行为：显示所有房源列表
//            showList(request, response);
//            request.getRequestDispatcher("/admin/manage-houses.jsp").forward(request, response);
//        }
//
////        response.sendRedirect(request.getContextPath() + "/admin/manage-houses.jsp");
//    }
//
//    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<House> allHouses = houseDAO.getAllHouses();
//        System.out.println("调试信息：从数据库获取到的房源数量为: " + allHouses.size());
//        request.setAttribute("houseList", allHouses);
//
//    }
//
//    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        try {
//            int houseId = Integer.parseInt(request.getParameter("id"));
//            houseDAO.deleteHouse(houseId);
//        } catch (NumberFormatException e) {
//            // ID格式错误，可以记录日志
//            System.err.println("无效的房源ID");
//        }
//        // 操作完成后重定向回列表页
//        response.sendRedirect(request.getContextPath() + "/admin/manage");
//    }
//}
package control;

import dao.HouseDAO;
import dao.HouseDAOImpl;
import dao.RentalDAO;
import dao.RentalDAOImpl;
import model.House;
import model.Rental;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage")
public class AdminHouseServlet extends HttpServlet {
    // 同时需要 HouseDAO 和 RentalDAO
    private final HouseDAO houseDAO = new HouseDAOImpl();
    private final RentalDAO rentalDAO = new RentalDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            handleDelete(request, response);
            // handleDelete 方法内部已经做了重定向，所以这里不需要再做任何事
        } else {
            // 默认行为：显示集成的管理页面
            showDashboard(request, response);
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 获取所有房源列表
        List<House> allHouses = houseDAO.getAllHouses();
        request.setAttribute("houseList", allHouses);

        // 2. 获取所有租赁记录列表
        List<Rental> rentalList = rentalDAO.getAllRentals();
        request.setAttribute("rentalList", rentalList);

        // 3. 将两个列表一起转发到同一个JSP页面
        request.getRequestDispatcher("/admin/manage-houses.jsp").forward(request, response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int houseId = Integer.parseInt(request.getParameter("id"));
            houseDAO.deleteHouse(houseId);
        } catch (NumberFormatException e) {
            System.err.println("无效的房源ID");
        }
        // 操作完成后重定向回管理页面
        response.sendRedirect(request.getContextPath() + "/admin/manage");
    }
}