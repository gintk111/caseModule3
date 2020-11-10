<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp"%>
<div id="top-header">
    <div class="container">
        <ul class="header-links pull-left">
            <li><a href="#"><i class="fa fa-phone"></i>........</a></li>
            <li><a href="#"><i class="fa fa-envelope-o"></i>............</a></li>
            <li><a href="#"><i class="fa fa-map-marker"></i>.................</a></li>
        </ul>
    </div>
</div>
<!-- /TOP HEADER -->

<!-- MAIN HEADER -->
<div id="header">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- LOGO -->
            <div class="col-md-3">
                <div class="header-logo">
                    <a href="#" class="logo">
                        <img src="shop/img/logo.jpg" alt="" width="150px" height="115px" style="float: left">
                    </a>
                </div>
            </div>
            <!-- /LOGO -->

            <!-- SEARCH BAR -->
            <div class="col-md-6">
                <div class="header-search" style="margin-top: 15px">
                    <form action="/search" method="GET">
                        <input class="input" type="text" name="key" placeholder="Tìm kiếm tại đây">
                        <button class="search-btn" type="submit">Tìm Kiếm</button>
                    </form>
                </div>
            </div>
            <!-- /SEARCH BAR -->

            <!-- ACCOUNT -->
            <div class="col-md-3 clearfix" style="margin-left: -80px;">
                <div class="header-ctn">
                    <!-- Cart -->
                    <div class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <i class="fa fa-shopping-bag"></i>
                            <p style="margin-bottom: -5px">Túi của bạn</p>

                        </a>
                        <div class="cart-dropdown">

                            <div class="cart-list">
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="shop/img/{{$product['item']['image1']}}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="#"></a></h3>
                                        <h4 class="product-price"><span class="qty"></span></h4>
                                    </div>
                                    <a href="{{route('xoagiohang',$product['item']['id'])}}"><button class="delete"><i class="fa fa-close"></i></button></a>
                                </div>
                            </div>
                            @endforeach
                            <div class="cart-summary">
                                <small>Tổng tiền</small>
                                <h4 style="color: red"> VNĐ</h4>
                            </div>
                            <div class="cart-btns">
                                <a href="/store">Xem thêm</a>
                                <a href="/dat-hang">Đặt Hàng  <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                            @endif
                        </div>
                    </div>
                    <!-- /Cart -->

                    <!-- Menu Toogle -->
                    <div class="menu-toggle">
                        <a href="#">
                            <i class="fa fa-bars"></i>
                            <span>Menu</span>
                        </a>
                    </div>
                    <!-- /Menu Toogle -->
                </div>
            </div>
            <!-- /ACCOUNT -->
        </div>
        <!-- row -->
    </div>
    <!-- container -->
</div>
<!-- /MAIN HEADER -->
</header>
<!-- TOP HEADER -->
<body>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="/index">Trang chủ</a></li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="shop/img/${product.getImage1()}" height="390px">
                    </div>

                    <div class="product-preview">
                        <img src="shop/img/${product.getImage2()}" height="400px">
                    </div>

                    <div class="product-preview">
                        <img src="shop/img/${product.getImage3()}" height="400px">
                    </div>

                    <div class="product-preview">
                        <img src="shop/img/${product.getImage4()}" height="400px">
                    </div>
                </div>
            </div>
            <!-- /Product main img -->
            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <div class="product-preview">
                        <img src="shop/img/${product.getImage1()}" height="133px">
                    </div>

                    <div class="product-preview">
                        <img src="shop/img/${product.getImage2()}" height="133px">
                    </div>

                    <div class="product-preview">
                        <img src="shop/img/${product.getImage3()}" height="133px">
                    </div>

                    <div class="product-preview">
                        <img src="shop/img/${product.getImage4()}" height="133px">
                    </div>
                </div>
            </div>
            <!-- /Product thumb imgs -->
            <!-- Product details -->
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-11">
                        <div class="product-details">
                            <h2 class="product-name">${product.getProduct_name()}</h2>
                            <div>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <div>
                                <c:if test='${product.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${product.getUnit_price()} "/> VNĐ</h4></c:if>
                                <c:if test='${product.getPromotion_price() != 0 && product.getUnit_price() != 0 }'>
                                    <h4 class="product-price">
                                        <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${product.getPromotion_price()} "/> VNĐ
                                        <del class="product-old-price">
                                            <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${product.getUnit_price()} "/>  VNĐ
                                        </del>
                                    </h4>
                                </c:if>
                                <span class="product-available">In Stock</span>
                            </div>
                            <div class="add-to-cart">
                                <a href="{{route('themgiohang',$sanpham->id)}}"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Thêm vào túi</button></a>
                            </div>

                            <ul class="product-links">
                                <li>Loại sản phẩm:</li>
                                <li></a>${product.getCat_name()}</li>
                            </ul>
                            <ul class="product-links">
                                <li>Thương hiệu:</li>
                                <li></a>${product.getTrade_name()}</li>
                            </ul>
                            <div>
                                <p class="product-links">Mô tả:</p>
                                <p> &nbsp;<span class="glyphicon glyphicon-asterisk"> &nbsp;</span>${product.getDescription1()}</p>
                                <p> &nbsp;<span class="glyphicon glyphicon-asterisk"> &nbsp;</span>${product.getDescription2()}</p>
                                <p> &nbsp;<span class="glyphicon glyphicon-asterisk"> &nbsp;</span>${product.getDescription3()}</p>
                                <p> &nbsp;<span class="glyphicon glyphicon-asterisk"> &nbsp;</span>${product.getDescription4()}</p>

                            </div>
                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Product details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<!-- Section -->
<div class="section" style="margin-bottom: 30px;">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Sản Phẩm Tương Tự</h3>
                </div>
            </div>

            <!-- product -->
            <c:forEach items='${requestScope["product1"]}' var="product1">
            <div class="col-md-3 col-xs-6">
                    <div class="product" >
                        <div class="product-img">
                            <a href="/product_details?id=${product1.getId()}"><img src="shop/img/${product1.getImage1()}" alt="" width="100%" height="220px"></a>
                            <div class="product-label">
                                <c:if test='${product1.getProduct_new() != 0 && product1.getPromotion_price() == 0}'><span class="sale">SALE</span></c:if>
                                <c:if test='${product1.getProduct_new() == 0 && product1.getPromotion_price() != 0}'><span class="new">NEW</span></c:if>
                                <c:if test='${product1.getProduct_new() != 0 && product1.getPromotion_price() != 0}'><span class="new">NEW</span> <span class="sale">SALE</span></c:if>
                            </div>
                        </div>
                        <div class="product-body">
                            <p class="product-category">${product1.getCat_id()}</p>
                            <h3 class="product-name"><a href="">${product1.getProduct_name()}</a></h3>
                            <c:if test='${product1.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${product1.getUnit_price()} "/>  VNĐ</h4></c:if>
                            <c:if test='${product1.getPromotion_price() != 0 && product1.getUnit_price() != 0 }'>
                                <h4 class="product-price">
                                    <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${product1.getPromotion_price()}"/>  VNĐ
                                    <del class="product-old-price">
                                        <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${product1.getUnit_price()} "/>
                                        VNĐ
                                    </del>
                                </h4>
                            </c:if>

                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-btns">
                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                <button class="quick-view"><a href=""><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></a></button>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <a href=""><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Thêm vào túi</button></a>
                        </div>
                    </div>
            </div>
            <!-- /product -->
            </c:forEach>
            <div class="clearfix visible-sm visible-xs"></div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->
<!-- FOOTER -->
<%@ include file="footer.jsp"%>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="shop/js/jquery.min.js"></script>
<script src="shop/js/bootstrap.min.js"></script>
<script src="shop/js/slick.min.js"></script>
<script src="shop/js/nouislider.min.js"></script>
<script src="shop/js/jquery.zoom.min.js"></script>
<script src="shop/js/main.js"></script>

</body>
</html>
