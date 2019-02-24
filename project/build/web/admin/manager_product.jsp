<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <link href="${root}/css/style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            int pages = 1, maxResult = 0, total = 0;
            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            total = productDAO.countProduct();
            int firstResult = 0;
            if (total <= 8) {
                firstResult = 0;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 8;
                maxResult = 8;
            }
            ArrayList<Product> listProduct = productDAO.getListProduct(firstResult, maxResult);
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Danh Sách Sản Phẩm </h3>
                <a href="${root}/admin/insert_product.jsp">Thêm sản phẩm</a>
                <table class="data" style="text-align: center;">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Tên</th>
                        <th class="data">Giá</th>
                        <th class="data">Ảnh</th>
                        <th class="data">Mô tả</th>
                        <th class="data" width="75px">Tùy chọn</th>
                    </tr>
                    <%
                        int count = 0;
                        for (Product product : listProduct) {
                            count++;
                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                        <td class="data"><%=product.getProductName()%></td>
                        <td class="data"><%=product.getProductPrice()%></td>
                        <td class="data"><img style="height: 50px; width: 50px;" src="${root}/images/<%=product.getProductImage()%>" /></td>
                        <td class="data"><%=product.getProductDescription()%></td>
                        <td class="data" width="75px">
                    <center>
                        <a href="${root}/admin/update_product.jsp?command=update&product_id=<%=product.getProductID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                        <a href="${root}/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>">Xóa</a>
                    </center>
                    </td>
                    </tr>
                    <%}%>
                </table>
                <ul class="start" style="text-align:center;">
                    <li><a href="#"><i></i></a></li>
                                <%for (int i = 1; i <= (total / 8) + 1; i++) {%>
                    <li class="arrow"><a href="${root}/admin/manager_product.jsp?pages=<%=i%>"><%=i%></a></li>
                        <%}%>
                    <li><a href="#"><i  class="next"> </i></a></li>
                </ul>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
