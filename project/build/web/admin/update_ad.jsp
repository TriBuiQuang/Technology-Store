<%@page import="model.Advertisement"%>
<%@page import="dao.AdvertisementDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật Quảng cáo</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
            AdvertisementDAO adDAO = new AdvertisementDAO();
            Advertisement ad = new Advertisement();
            String ad_id = "";
            if (request.getParameter("ad_id") != null) {
                ad_id = request.getParameter("ad_id");
                ad = adDAO.getAd(Integer.parseInt(ad_id));
            }
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Cập nhật quảng cáo</h3>
                    <form action="/project/ManagerAdvertisementServlet" method="post">
                        <table width="95%">
                            <tr>
                                <td style="float: right"><b>Tên quảng cáo: </b></td>
                                <td><input type="text" class="sedang" name="tenQuangCao" value="<%=ad.getAdvertisementName()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td style="float: right"><b>Ảnh thương hiệu : </b></td>
                            <td><input type="file" class="sedang" name="img" value="<%=ad.getAdvertisementImage()%>"></td>
                        </tr>
                        <tr>
                            <td style="float: right"><b>Tên Đường dẫn: </b></td>
                            <td><input type="text" class="sedang" name="DuongDan" value="<%=ad.getAdvertisementUrl()%>"></td>
                        </tr>
                        <tr>
                            <td style="float: right"><b>Tên Công ty : </b></td>
                            <td><input type="text" class="sedang" name="CongTy" value="<%=ad.getAdvertisementCompany()%>"></td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="ad_id" value="<%=ad.getAdvertisementID()%>">
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
