<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>

        <div id="leftBar">
            <ul>
                <li><a href="${root}/admin/index.jsp">Trang chủ</a></li>
                <li><a href="${root}/admin/manager_admin.jsp">Admin</a></li>
                <li><a href="${root}/admin/manager_user.jsp">User</a></li>
                <li><a href="${root}/admin/manager_brand.jsp" style="padding-right:10px">Thương hiệu</a></li>
                <li><a href="${root}/admin/manager_category.jsp">Danh mục</a></li>
                <li><a href="${root}/admin/manager_product.jsp">Sản phẩm</a></li>
                <li><a href="${root}/admin/manager_bill.jsp">Hóa đơn</a></li>
                <li><a href="${root}/admin/manager_ad.jsp">Quảng cáo</a></li>
            </ul>
        </div>

    </body>
</html>
