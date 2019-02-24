package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author TUNGDUONG
 */
public class ManagerProductServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    productDAO.delete(Long.parseLong(product_id));
                    response.sendRedirect("/project/admin/manager_product.jsp");
                    break;
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String idSanpham = request.getParameter("idSanpham");
        String idDanhmuc = request.getParameter("idDanhmuc");
        String idThuonghieu = request.getParameter("idThuonghieu");
        String tenSanpham = request.getParameter("tenSanpham") ;
        String anhSanpham = request.getParameter("anhSanpham");
        String giaSanpham = request.getParameter("giaSanpham");
        String motaSanpham = request.getParameter("motaSanpham");

        double gia = Double.parseDouble(giaSanpham);
        String url = "", error = "";
        if (tenSanpham.equals("")) {
            error = "Vui lòng nhập đầy đủ!";
            request.setAttribute("error", error);
        }
        try {
            url = "/admin/manager_product.jsp";

            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        productDAO.insert(new Product(1, Long.parseLong(idDanhmuc),
                                tenSanpham, anhSanpham, gia, tenSanpham, Long.parseLong(idThuonghieu)));
                        response.sendRedirect("/project/admin/manager_product.jsp");

                        break;
                    case "update":
                        productDAO.update(new Product(Long.parseLong(request.getParameter("product_id")), Long.parseLong(idDanhmuc),
                                tenSanpham, anhSanpham, gia, motaSanpham, Long.parseLong(idThuonghieu)));
                        response.sendRedirect("/project/admin/manager_product.jsp");
// System.out.println(tenSanpham);
                        break;
                }
            } else {
                url = "/admin/manager_category.jsp";
            }
        } catch (Exception e) {
        }

    }

    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();
//        System.out.println(dao.insert(new Product(1,
//               1, "ặc ặcc", "abc hinh", 12500, "ặc ắc tặcc", 1)));
    }
}
