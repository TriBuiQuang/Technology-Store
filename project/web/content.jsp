
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Brand"%>
<%@page import="dao.BrandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>content</title>
    </head>
    <body>
        
        <%
            BrandDAO brandDAO = new BrandDAO();
            ProductDAO productDAO = new ProductDAO();
            long categoryID = 0;
            if(request.getParameter("categoryID")!=null){
                categoryID = (long) Long.parseLong(request.getParameter("categoryID"));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart==null){
                cart=new Cart();
                session.setAttribute("cart", cart);
            }
            int pages = 0 ,firstResult =0, maxResult =0 , total = 0;
            if(request.getParameter("pages")!=null){
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }if(request.getParameter("pages")==null){
                pages = 1;
            }
            
            total = productDAO.countProduct();
            if(total<=8){
                firstResult = 1;
                maxResult = total;
            }else{
                firstResult = (pages - 1) * 4;
                maxResult = 4;
            }
            
            ArrayList<Product>listProduct = productDAO.getListProduct(firstResult,maxResult);
        %>

        <!---->
        <div class="container">
            <div class="content">
                <div class="content-top">                    
                    <h3 class="future" style="font-size: 17px;">QUẢNG CÁO</h3>
                    <div class="content-top-in">
                        <iframe style="margin-left: 13px;" width="555" height="315" src="https://www.youtube.com/embed/E8EKohDA0-Q" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        <iframe width="555" height="315" src="https://www.youtube.com/embed/E8EKohDA0-Q" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                    <h3 class="future">HÀNG MỚI</h3>
                    <div class="content-top-in">
                        <%
                            for (Product p : listProduct) {
                        %>
                        <div class="col-md-3 md-col">
                            <div class="col-md">
                                <a href="single.jsp?productID=<%=p.getProductID()%>"">
                                    <img  src="/project/images/<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" />
                                </a>	
                                <div class="top-content">
                                    <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                    <div class="white">
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <%}%>                                         
                        <div class="clearfix"></div>
                    </div>
                     <ul class="start">
                    <li><a href="#"><i></i></a></li>
                    <%for(int i = 1; i <=(total/4)+1;i++){%>
                        <li class="arrow"><a href="index.jsp?pages=<%=i%>"><%=i%></a></li>
                    <%}%>
                    <li><a href="#"><i  class="next"> </i></a></li>
                </ul>
                </div>
                <!---->
                <div class="content-middle">
                    <h3 class="future">BRANDS</h3>
                    <div class="content-middle-in">
                        <ul id="flexiselDemo1">
                            <% for (Brand d : brandDAO.getListBrand()) { %>
                                <li><a href="product_bybrand.jsp?brand_id=<%=d.getBrandID()%>&pages=1">
                                        <img src="img/<%=d.getBrandImage()%>" width="50px" height="50px"/>
                                    </a></li>
                            <%  } %>
                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo1").flexisel({
                                    visibleItems: 4,
                                    animationSpeed: 1000,
                                    autoPlay: true,
                                    autoPlaySpeed: 3000,
                                    pauseOnHover: true,
                                    enableResponsiveBreakpoints: true,
                                    responsiveBreakpoints: {
                                        portrait: {
                                            changePoint: 480,
                                            visibleItems: 1
                                        },
                                        landscape: {
                                            changePoint: 640,
                                            visibleItems: 2
                                        },
                                        tablet: {
                                            changePoint: 768,
                                            visibleItems: 3
                                        }
                                    }
                                });

                            });
                        </script>
                        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                    </div>
                </div>
                
            </div>
        </div>

    </body>
</html>
