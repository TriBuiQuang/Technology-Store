<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>       
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Thêm Danh Mục</h3>
                    <form action="${root}/AdminServlet" method="post">
                    <table width="95%">
                        <tr>
                            <td style="float: right"><b>Tên admin:</b></td>
                            <td><input type="text" class="sedang" name="tenAdmin"><%=error%></td>
                        </tr>
                         <tr>
                            <td style="float: right"><b>Email :</b></td>
                            <td><input type="text" class="sedang" name="Email"><%=error%></td>
                        </tr>
                         <tr>
                            <td style="float: right"><b>Pass:</b></td>
                            <td><input type="password" class="sedang" name="Pass"><%=error%></td>
                        </tr>
                         <tr>
                            <td style="float: right"><b>Email Pass:</b></td>
                            <td><input type="text" class="sedang" name="emailPass"><%=error%></td>
                        </tr>
                         <tr>
                            <td style="float: right"><b>Quyền:</b></td>
                            <td><input type="text" class="sedang" name="quyen"><%=error%></td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="insert">
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