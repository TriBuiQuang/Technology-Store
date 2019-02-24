<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Users</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            UsersDAO usersDAO = new UsersDAO();
            ArrayList<Users> listUsers = usersDAO.getListUsers();
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý tài khoản users</h3>
                    <table class="data" style="text-align: center;">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data" width="90px">Mã user</th>
                            <th class="data">Tên user</th>
                            <th class="data">Email user</th>
                            <th class="data" width="90px">Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for(Users users : listUsers){
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=users.getUserID()%></td>
                            <td class="data"><%=users.getUserName()%></td>
                            <td class="data"><%=users.getUserEmail()%></td>
                            <td class="data" width="90px">
                            <center>
                                <a href="/project/UsersServlet?command=delete&user_id=<%=users.getUserID()%>">Xóa</a>
                            </center>
                            </td>
                        </tr>
                        <%}%>

                    </table>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>

    </body>
</html>
