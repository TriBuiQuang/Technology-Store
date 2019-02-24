<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>footer</title>
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
       
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!--slider-script-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
                    $(function () {
                        $("#slider1").responsiveSlides({
                            auto: true,
                            speed: 500,
                            namespace: "callbacks",
                            pager: true,
                        });
                    });
        </script>
        <!--//slider-script-->
        <script>$(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
    </head>
    <body>
        
        <!---->
        <div class="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="col-md-4 footer-in">
                        <h4><i> </i>Độc đáo</h4>
                        <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
                    </div>
                    <div class="col-md-4 footer-in">
                        <h4><i class="cross"> </i>Mới nhất</h4>
                        <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
                    </div>
                    <div class="col-md-4 footer-in">
                        <h4><i class="down"> </i>Chuyên nghiệp</h4>
                        <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!---->
            <div class="footer-middle">
                <div class="container">
                    <div class="footer-middle-in ">
                        <h6>About TNT mobile</h6>
                        <p>Cửa hàng chúng tôi chuyên cung cấp các mặt hàng, thiết bị công nghệ. Đặc biệt thường xuyên cập nhật các mẫu smartphone mới nhất, rất mong được mọi người đón nhận. Xin chân thành cám ơn.</p>
                    </div>
                   
                    <div class="footer-middle-in">
                        <h6>Customer Service</h6>
                        <ul>
                            <li><a href="/project/contact.jsp">Contact Us</a></li>
                           
                        </ul>
                    </div>
                    <div class="footer-middle-in">
                        <h6>Thành viên trong nhóm</h6>
                        <ul>
                            <li><a href="#">Bùi Quang Đức Tri</a></li>
                            <li><a href="#">Bùi An Thuận</a></li>
                            <li><a href="#">Nguyên</a></li>
                     
                        </ul>
                    </div>
                  
                    <div class="clearfix"></div>
                </div>
            </div>
          
            <script type="text/javascript">
                $(document).ready(function () {
                    /*
                     var defaults = {
                     containerID: 'toTop', // fading element id
                     containerHoverID: 'toTopHover', // fading element hover id
                     scrollSpeed: 1200,
                     easingType: 'linear' 
                     };
                     */

                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

        </div>
        <!-- Subiz -->
        <script>
        (function(s, u, b, i, z){
          u[i]=u[i]||function(){
            u[i].t=+new Date();
            (u[i].q=u[i].q||[]).push(arguments);
          };
          z=s.createElement('script');
          var zz=s.getElementsByTagName('script')[0];
          z.async=1; z.src=b; z.id='subiz-script';
          zz.parentNode.insertBefore(z,zz);
        })(document, window, 'https://widgetv4.subiz.com/static/js/app.js', 'subiz');
        subiz('setAccount', 'acqdnkeuhtakfggvxwut');
        </script>
   

    </body>
</html>
