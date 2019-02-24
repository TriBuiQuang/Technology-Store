<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Brand"%>
<%@page import="dao.BrandDAO"%>
<%@page contentType="text/html ; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
    </head>
    <body>
        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String product_id = "";
            if (request.getParameter("product_id") != null) {
                product_id = request.getParameter("product_id");
                product = productDAO.getProduct(Integer.parseInt(product_id));
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Cập nhật sản phẩm</h3>
                    <form action="${root}/ManagerProductServlet" method="POST">
                    <table width="95%">
                        <tr><td><b>Tên sản phẩm</b></td>
                            <td><input type="text" name="tenSanpham" class="sedang" value="<%=product.getProductName()%><%=error%>"></td>
                        </tr>                       
                        <tr>
                            <td><b>Giá bán</b></td>
                            <td><input type="text" name="giaSanpham" class="sedang" value="<%=product.getProductPrice()%>"></td>
                        </tr>
                        <tr><td><b>Loại sản phẩm</b></td><td>                                
                                <select name="idDanhmuc">
                                    <%
                                        CategoryDAO categoryDAO = new CategoryDAO();
                                        ArrayList<Category> listCategory = categoryDAO.getListCategory();
                                        int count = 0;
                                        for (Category category : listCategory) {
                                            count++;
                                    %>
                                    <option value="<%=category.getCategoryID()%>" 
                                            <%if(product.getCategoryID()==category.getCategoryID()){%>selected<%}%>>
                                        <%=category.getCategoryName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </td></tr>
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
                                    <option  value="<%=brand.getBrandID()%>" 
                                              <%if(product.getBrand_id()==brand.getBrandID()){%>selected<%}%>>
                                        <%=brand.getBrandName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr><td><b>Mô tả sản phẩm</b></td>
                            <td>
                                <textarea class="form-textarea" id="noiDung" name="motaSanpham">
                                    <%=product.getProductDescription()%>
                                </textarea>
                                <script type="text/javascript" language="javascript">
                                    CKEDITOR.replace('noiDung', {width: '445px',height: '240px'});
                                </script>
                                
                            </td>
                        </tr>
                        <tr><td><b>Ảnh sản phẩm</b></td>
                            <td>
                                <img style="height: 150px;width: 130px;" src="${root}/images/<%=product.getProductImage()%>"/>
                                <br>
                                <input type="file" name="anhSanpham" />                                                                 
                            </td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="product_id" value="<%=product.getProductID()%>">
                                <input type="submit" class="button" value="Lưu dữ liệu">
                    </table>
                </form>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>