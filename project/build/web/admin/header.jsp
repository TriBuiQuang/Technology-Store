<%@page import="model.Admin"%>
<%@page import="java.util.Map"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>
        <%
             Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
               response.sendRedirect("${root}/admin/login.jsp");
            } 

        %>
        <div id="header">
            <div class="">
                <div class="inHeader">
                    <a href="/${root}/index.jsp"><h1 style="font-weight: bold; color: #abd454; font-size: 40px; line-height: 0px; margin-left: -715px;">TNT Shop</h1></a>
                </div>
                <div class="mosAdmin">
                    <%if (admin != null) {%>
                        Hallo,  <%=admin.getAdmin_fullname()%><br>
                    <%} else { %>                               
                        <a href="login.jsp"> MY ACCOUNT</a> 
                    <%}%>
                    <a href="index.jsp">Trang chủ User</a> | <a href="">Help</a> | <a href="AdminServlet?command=logout">Đăng Xuất</a>
                </div>
                <div class="clear"></div>
            </div>
        </div> 

    </body>
</html>