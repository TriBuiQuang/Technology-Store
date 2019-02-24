/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;
import tools.MD5;

/**
 *
 * @author Kid
 */
public class AdminServlet extends HttpServlet {

    AdminDAO adminsDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String adminID = request.getParameter("admin_id");
        String command = request.getParameter("command");
        String url = "";
        switch (command) {
            case "logout":
                HttpSession ss = request.getSession(false);
                ss.invalidate();
                response.sendRedirect("/project/admin/login.jsp");
                break;
            case "delete":
                adminsDAO.delete(Long.parseLong(adminID));
                response.sendRedirect("/project/admin/manager_admin.jsp");
                break;
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("command");
        
        String url = "";
        try {
            Admin admin = new Admin();
            HttpSession session = request.getSession();
            switch (command) {
                case "insert":
                    String name = request.getParameter("tenAdmin");
                    String email = request.getParameter("Email");
                    String pass = MD5.encryption(request.getParameter("Pass"));

                    String role = request.getParameter("quyen");
                    String emailpass = MD5.encryption(request.getParameter("emailPass"));
                    adminsDAO.insert(new Admin(1, name, email, pass, emailpass, Integer.parseInt(role)));
                    session.setAttribute("admin", admin);
                    url = "/admin/manager_admin.jsp";
                    break;
                case "update":
                    emailpass = MD5.encryption(request.getParameter("emailPass"));
                    adminsDAO.update(new Admin(Integer.parseInt(request.getParameter("admin_id")),
                            request.getParameter("tenAdmin"), request.getParameter("Email"),
                            MD5.encryption(request.getParameter("Pass")), emailpass,
                            Integer.parseInt(request.getParameter("quyen"))));
                    url = "/admin/manager_admin.jsp";
                    break;
                case "login":
                    admin = adminsDAO.login(request.getParameter("Email"), MD5.encryption(request.getParameter("Pass")));
                    if (admin != null) {
                        session.setAttribute("admin", admin);
                        url = "/admin/index.jsp";
                    } else {
                        request.setAttribute("error", "Error email or password!");
                        url = "/admin/login.jsp";
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/project/index.jsp");
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
