<%-- 
    Document   : checkout
    Created on : Oct 1, 2018, 10:29:34 PM
    Author     : Kid
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <script src="js/jquery.min.js"></script>
    </head>
    <body>
        
        <%
            Users users = (Users) session.getAttribute("user");
            if(users==null){
                response.sendRedirect("/project/login.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
   
        <div class="container">
                <div class="account">
                    <h2 class="account-in">Check out</h2>
                    <form action="CheckOutServlet" method="POST"  >                       
                        <div >
                            <span >Address * :</span>
                            <input type="text" name="address" >
                        </div> 	
                        <div> 
                            <span class="word ">Payment * :</span>
                            <select name="payment">
                                <option value="Bank transfer"> Thanh toán online</option>
                                <option value="Live"> Thanh toán trực tuyến</option>   
                            </select>
                        </div>			
                        <input type="submit" value="Checkout">
                    </form>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
