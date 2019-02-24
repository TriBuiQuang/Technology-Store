<%@page import="model.Advertisement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AdvertisementDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Quảng cáo</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            AdvertisementDAO advertisementDAO = new AdvertisementDAO();
            ArrayList<Advertisement> listAd = advertisementDAO.getListAdvertisement();
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý Quảng cáo</h3>

                    <a href="${root}/admin/insert_ad.jsp">Thêm Quảng cáo</a>

                <table class="data" style="text-align: center;">

                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data" width="90px">Mã quảng cáo</th>
                        <th class="data">Tên quảng cáo</th>
                        <th class="data">Ảnh</th>
                        <th class="data">URL</th>
                        <th class="data">Tên công ty QC </th>
                        <th class="data" width="90px">Tùy chọn</th>
                    </tr>

                    <%
                        int count = 0;
                        for (Advertisement ad : listAd) {
                            count++;
                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                        <td class="data"><%=ad.getAdvertisementID()%></td>
                        <td class="data"><%=ad.getAdvertisementName()%></td>
                        <td class="data"><img src="${root}/img/<%=ad.getAdvertisementImage()%>" width="50px"></td>
                        <td class="data"><%=ad.getAdvertisementUrl()%></td>
                        <td class="data"><%=ad.getAdvertisementCompany()%></td>
                        <td class="data" width="90px">
                    <center>
                        <a href="${root}/admin/update_ad.jsp?command=update&ad_id=<%=ad.getAdvertisementID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                        <a href="/project/ManagerAdvertisementServlet?command=delete&ad_id=<%=ad.getAdvertisementID()%>">Xóa</a>
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
