package controller;

import dao.AdvertisementDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Advertisement;

public class ManagerAdvertisementServlet extends HttpServlet {

    AdvertisementDAO advertisementDAO = new AdvertisementDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String ad_id = request.getParameter("ad_id");

        String url = "";
        try {
            switch (command) {
                case "delete":
                    advertisementDAO.delete(Long.parseLong(ad_id));
                    url = "/admin/manager_ad.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenQuangCao = request.getParameter("tenQuangCao");
        String img = request.getParameter("img");
        String duongdan = request.getParameter("DuongDan");
        String congty = request.getParameter("CongTy");
        String url = "", error = "";
        if (tenQuangCao.equals("")) {
            error = "Vui lòng nhập tên quảng cáo!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        advertisementDAO.insert(new Advertisement(Long.parseLong("20"), tenQuangCao, img,
                                duongdan, congty));
                        url = "/admin/manager_ad.jsp";
                        break;
                    case "update":
                        advertisementDAO.update(new Advertisement(Long.parseLong(request.getParameter("ad_id")),
                                 tenQuangCao, img, duongdan, congty));
                        url = "/admin/manager_ad.jsp";
                        break;
                }
            } else {
                url = "/admin/manager_ad.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
