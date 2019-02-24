<%@page import="model.Brand"%>
<%@page import="dao.BrandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật thương hiệu</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
            BrandDAO brandDAO = new BrandDAO();
            Brand brand = new Brand();
            String brand_id = "";
            if (request.getParameter("brand_id") != null) {
                brand_id = request.getParameter("brand_id");
                brand = brandDAO.getBrand(Integer.parseInt(brand_id));
            }
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Cập nhật thương hiệu</h3>
                    <form action="/project/ManagerBrandServlet" method="post">
                        <table width="95%">
                            <tr>
                                <td style="float: right"><b>Tên thương hiệu : </b></td>
                                <td><input type="text" class="sedang" name="tenThuongHieu" value="<%=brand.getBrandName()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td style="float: right"><b>Ảnh thương hiệu : </b></td>
                            <td><input type="file" class="sedang" name="img" value="<%=brand.getBrandImage()%>"></td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="brand_id" value="<%=brand.getBrandID()%>">
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
