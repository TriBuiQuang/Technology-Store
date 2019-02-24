<%@page import="model.Admin"%>
<%@page import="dao.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật admin</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
            
            AdminDAO adminDAO = new AdminDAO();
            Admin admin = new Admin();
            String admin_id = "";
            if (request.getParameter("admin_id") != null) {
                admin_id = request.getParameter("admin_id");
                admin = adminDAO.getAdmin(Integer.parseInt(admin_id));
            }
        
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                
                <div id="rightContent">
                    <h3>Cập nhật danh mục <%=admin.getAdmin_id()%></h3>
                
                    <form action="/project/AdminServlet" method="post">
                        <table width="95%">
                             <tr>
                                <td><input type="hidden" class="sedang" value="<%=admin.getAdmin_id()%>"></td>
                            </tr>
                            <tr>
                                <td style="float: right"><b>Tên admin : </b></td>
                                <td><input type="text" class="sedang" name="tenAdmin" value="<%=admin.getAdmin_fullname()%>"><%=error%></td>
                            </tr>
                            <tr>
                                <td style="float: right"><b>Email : </b></td>
                                <td><input type="text" class="sedang" name="Email" value="<%=admin.getAdmin_email()%>"><%=error%></td>
                            </tr>
                            <tr>
                                <td style="float: right"><b>Pass : </b></td>
                                <td><input type="text" class="sedang" name="Pass" value=""><%=error%></td>
                            </tr>
                            <tr>
                                <td style="float: right"><b>Email Pass : </b></td>
                                <td><input type="text" class="sedang" name="emailPass" value=""><%=error%></td>
                            </tr>
                            <tr>
                                <td style="float: right"><b>Quyền : </b></td>
                                <td><input type="text" class="sedang" name="quyen" value="<%=admin.getRole()%>"><%=error%></td>
                            </tr>
                            <tr><td></td><td>
                                    <input type="hidden" name="command" value="update">
                                    <input type="hidden" name="admin_id" value="<%=admin.getAdmin_id()%>">
                                    <input type="submit" class="button" value="Lưu dữ liệu">
                                </td>
                            </tr>
                        </table>
                    </form>
                
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>


    </body>
</html>
