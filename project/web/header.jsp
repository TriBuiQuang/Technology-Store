<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Brand"%>
<%@page import="dao.BrandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.1&appId=1166598453496945&autoLogAppEvents=1';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
</head>
<body>
    <%
        CategoryDAO categoryDAO = new CategoryDAO();
        BrandDAO brandDAO = new BrandDAO();
        Users users = null;
        if (session.getAttribute("user") != null) {
            users = (Users) session.getAttribute("user");
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
    %>

    <!--header-->
    <div class="header">
        <div class="header-top">
            <div class="container">	
                <div class="header-top-in">			
                    <div class="logo">
                        <a href="index.jsp" id="logotext"><h1 style="color: #FFF; font-weight: bold;">TNT Shop</h1></a><small style="color: #FFF;">Thế giới công nghệ </small>
                    </div>
                    <div class="header-in">
                        <ul class="icon1 sub-icon1">
                            <li>
                                <form class="search" style="margin-top:8px;width:100%;">
                                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = '';
                                            }" >
                                    <input type="submit" value="">
                                </form>
                            </li>
                            <%if (users != null) {%>
                            <li><a href="profile.html"><%=users.getUserName()%></a> </li>
                            <li><a href="UsersServlet?command=logout">Đăng Xuất</a> </li>
                                <%} else { %>                               
                            <li ><a href="login.jsp"> MY ACCOUNT</a></li>
                                <%}%>

                            <li><div class="cart">
                                    <a href="#" class="cart-in"> </a>
                                    <span><%=cart.countItem()%></span>
                                </div>
                                <ul class="sub-icon1 list">
                                    <h3>Recently added items(<%=cart.countItem()%>)</h3>
                                    <div class="shopping_cart">
                                        <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                                        <div class="cart_box">
                                            <div class="message">
                                                <div class="alert-close"><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"></a> </div> 
                                                <div class="list_img"><img src="<%=list.getValue().getProduct().getProductImage()%>" class="img-responsive" alt=""></div>
                                                <div class="list_desc">
                                                    <h4><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><%=list.getValue().getProduct().getProductName()%></a></h4>
                                                    <%=list.getValue().getQuantity()%> x<span class="actual"> <%=list.getValue().getProduct().getProductPrice()%></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="total">
                                        <div class="total_left">Cart Subtotal : </div>
                                        <div class="total_right"><%=cart.totalCart()%></div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="login_buttons">
                                        <div class="check_button"><a href="checkout.jsp">Check out</a></div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="h_menu4">
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li class="active"><a href="index.jsp"><i> </i>Trang chủ</a></li>
                        <li><a href="#" >Danh mục</a>
                            <ul class="drop drop-menu">
                                <%  for (Category c : categoryDAO.getListCategory()) { %>
                                <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%=c.getCategoryName()%></a></li>
                                    <% } %>
                            </ul>
                        </li>
                        <li><a href="#" >Hiệu</a>
                            <ul class="drop1">
                                <% for (Brand d : brandDAO.getListBrand()) { %>
                                <li><a href="product_bybrand.jsp?brand_id=<%=d.getBrandID()%>&pages=1"><%=d.getBrandName()%></a></li>
                                <%  } %>

                            </ul>
                        </li>
                        <li><a href="contact.jsp" >Liên hệ </a></li>

                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
