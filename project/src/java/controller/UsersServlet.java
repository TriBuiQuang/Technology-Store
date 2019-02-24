/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import tools.MD5;
//import tools.MD5;

/**
 *
 * @author user
 */
public class UsersServlet extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String userID = request.getParameter("user_id");

        String command = request.getParameter("command");
        String url = "";
        switch (command) {
            case "logout":
                HttpSession ss = request.getSession(false);
                ss.invalidate();
                url = "/index.jsp";
                response.sendRedirect("/project/index.jsp");
                break;
            case "delete":
                usersDAO.delete(Long.parseLong(userID));
                response.sendRedirect("/project/admin/manager_user.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = MD5.encryption(request.getParameter("pass"));
        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                users.setUserID(new java.util.Date().getTime());
                users.setUserName(request.getParameter("name"));
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter(MD5.encryption("pass")));

                usersDAO.insertUser(new Users(1, email, pass, name));
                session.setAttribute("user", users);
                url = "/index.jsp";
                break;
            case "update":
                usersDAO.update(new Users(Integer.parseInt(request.getParameter("userID")),
                        name, email, pass));
                url = "/admin/manager_admin.jsp";
                break;
            case "login":
                users = usersDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("pass")));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/index.jsp";
                } else {
                    request.setAttribute("error", "Error email or password!");
                    url = "/login.jsp";
                }
                break;
            case "register":
                url = "/register.jsp";
                break;

        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
}
