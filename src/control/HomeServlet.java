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

// �����Servletӳ�䵽Ӧ�õĸ�·��
@WebServlet("")
public class HomeServlet extends HttpServlet {
    private final HouseDAO houseDAO = new HouseDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. ��������֮ǰ��Ƶ� getAvailableHouses ����
            //    (��ȷ�����Ѿ���HouseDAOImpl��ʵ���˴˷���)
            List<House> availableHouses = houseDAO.getAvailableHouses();

            // 2. �����ⷿԴ�б����request��
            request.setAttribute("availableHouseList", availableHouses);

            // 3. ת��������JSPҳ�������ʾ
            request.getRequestDispatcher("/rental/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // ����������ת����һ������ҳ��
            response.getWriter().println("���ط�Դ��Ϣʱ����");
        }
    }
}