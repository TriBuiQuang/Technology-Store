<%@page import="model.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Admin</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            AdminDAO adminDAO = new AdminDAO();
            ArrayList<Admin> listAdmin = adminDAO.getListAdmin();
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý tài khoản admin</h3>
                    
                    <a href="${root}/admin/insert_admin.jsp">Thêm tài khoản admin</a>

                    <table class="data" style="text-align: center;">

                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data" width="90px">Mã admin</th>
                            <th class="data">Tên admin</th>
                            <th class="data">Email admin</th>
                            <th class="data">Quyền admin</th>
                            <th class="data" width="90px">Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for(Admin admin : listAdmin){
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=admin.getAdmin_id()%></td>
                            <td class="data"><%=admin.getAdmin_fullname()%></td>
                            <td class="data"><%=admin.getAdmin_email()%></td>
                            <td class="data"><%=admin.getRole()%></td>
                            <td class="data" width="90px">
                            <center>
                                <a href="${root}/admin/update_admin.jsp?command=update&admin_id=<%=admin.getAdmin_id()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                <a href="/project/AdminServlet?command=delete&admin_id=<%=admin.getAdmin_id()%>">Xóa</a>
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
