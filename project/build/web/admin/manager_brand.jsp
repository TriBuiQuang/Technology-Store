<%@page import="model.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BrandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Thương hiệu</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            BrandDAO brandDAO = new BrandDAO();
            ArrayList<Brand> listBrand = brandDAO.getListBrand();
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý Thương hiệu</h3>

                    <a href="${root}/admin/insert_brand.jsp">Thêm Thương hiệu</a>

                <table class="data" style="text-align: center;">

                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data" width="90px">Mã Thương hiệu</th>
                        <th class="data">Tên thương hiệu</th>
                        <th class="data">Ảnh</th>
                        <th class="data" width="90px">Tùy chọn</th>
                    </tr>

                    <%
                        int count = 0;
                        for (Brand brand : listBrand) {
                            count++;
                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                        <td class="data"><%=brand.getBrandID()%></td>
                        <td class="data"><%=brand.getBrandName()%></td>
                        <td class="data"><img src="${root}/img/<%=brand.getBrandImage()%>" width="50px"></td>
                        <td class="data" width="90px">
                    <center>
                        <a href="${root}/admin/update_brand.jsp?command=update&brand_id=<%=brand.getBrandID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                        <a href="/project/ManagerBrandServlet?command=delete&brand_id=<%=brand.getBrandID()%>">Xóa</a>
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
