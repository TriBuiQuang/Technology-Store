<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.BrandDAO"%>
<%@page import="model.Brand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Thông tin sản phẩm</h3>     
                    <form action="${root}/ManagerProductServlet" method="POST" >
                    <table width="95%">
                        <tr>
                            <td><b>Tên sản phẩm</b></td>
                            <td><input type="text" name="tenSanpham" class="sedang"></td>
                        </tr>                       
                        <tr>
                            <td><b>Giá bán</b></td>
                            <td><input type="text" name="giaSanpham" class="sedang"></td>
                        </tr>
                        <tr>
                            <td><b>Loại sản phẩm</b></td>
                            <td>                                
                                <select name="idDanhmuc">
                                    <%
                                        CategoryDAO categoryDAO = new CategoryDAO();
                                        ArrayList<Category> listCategory = categoryDAO.getListCategory();
                                        int count = 0;
                                        for (Category category : listCategory) {
                                            count++;
                                    %>
                                    <option  value="<%=category.getCategoryID()%>" ><%=category.getCategoryName()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Loại thương hiệu</b></td>
                            <td>                                
                                <select name="idThuonghieu">
                                    <%
                                        BrandDAO brandDAO = new BrandDAO();
                                        ArrayList<Brand> listbrand = brandDAO.getListBrand();
                                        int countb = 0;
                                        for (Brand brand : listbrand) {
                                            countb++;
                                    %>
                                    <option  value="<%=brand.getBrandID()%>" ><%=brand.getBrandName()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr><td><b>Mô tả sản phẩm</b></td>
                            <td>
                                <textarea class="form-textarea" id="noiDung" name="motaSanpham"></textarea>
                                <script type="text/javascript" language="javascript">
                                    CKEDITOR.replace('noiDung', {width: '500px', height: '200px'});
                                </script>
                            </td>
                        </tr>
                        <tr><td><b>Ảnh sản phẩm</b></td>
                            <td>
                                <input type="file" name="anhSanpham" />                                                                 
                            </td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="insert">
                                <input type="submit" class="button">
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
