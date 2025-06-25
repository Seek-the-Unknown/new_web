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
            // 1. ������� URL �����л�ȡ��Դ ID
            int houseId = Integer.parseInt(request.getParameter("id"));

            // 2. �����ݿ��л�ȡ�����ķ�Դ����
            // (��ȷ�� findHouseById ��������ӵ� HouseDAO �ӿڲ��� HouseDAOImpl ��ʵ��)
            House house = ((HouseDAOImpl) houseDAO).findHouseById(houseId);

            if (house != null) {
                // 3. ���ҵ��ķ�Դ��������Ϊ��������
                request.setAttribute("house", house);

                // 4. ������ת���� detail.jsp ҳ�������Ⱦ
                request.getRequestDispatcher("/rental/detail.jsp").forward(request, response);
            } else {
                // ����δ�ҵ�ָ��ID�ķ�Դ�����
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "��Ǹ��������ķ�Դδ�ҵ���");
            }
        } catch (NumberFormatException e) {
            // ���� ID ����������Ч���ֵ����
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "��Ч�ķ�ԴID��ʽ��");
        }
    }
}