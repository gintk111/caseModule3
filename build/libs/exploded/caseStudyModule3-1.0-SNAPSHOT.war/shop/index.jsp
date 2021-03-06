<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp"%>
    <!-- TOP HEADER -->
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
                                            <h4 class="product-price"><span class="qty"></span>

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

<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav ">
                <li class="active"><a href="/index">Trang chủ</a></li>
                <li><a href="/store">Sản phẩm</a></li>
                <li class="dropdown"><a href="">Thương Hiệu</a>
                    <ul  class="dropdown-content main-nav nav navbar-nav" style="border-top:2px solid #E4E7ED; border-bottom: 5px solid #D10024">
                        <c:forEach items='${requestScope["allTrademark"]}' var="trade">
                        <li><a href="">${trade.getTrademarkName()}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li><a href="/phan-hoi">Phản hồi - Góp ý</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
<!-- 		<div class="dropdown">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content">
    <a href="#">Link 1</a>
    <a href="#">Link 2</a>
    <a href="#">Link 3</a>
  </div>
</div> -->
<!-- /HEADER -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <c:forEach items='${requestScope["trademarks"]}' var="trade">
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="shop/img/trademark/${trade.getTrademarkImage()}" alt="" height="220px">
                    </div>
                    <div class="shop-body">
                        <h3> Thương Hiệu<br></h3>
                        <a href="" class="cta-btn">Xem ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            </c:forEach>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Nhóm Sản Phẩm</h3>
                    <div class="section-nav">
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="category-slick" data-nav="#slick-nav-5">
                                <!-- product -->
                                <c:forEach items='${requestScope["groups"]}' var="group">
                                <div class="product" >
                                    <div class="product-img">
                                        <a href=""><img src="shop/img/group/${group.getGroupImage()}" alt=""
                                                                                width="100%" height="140px"></a>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="/group/${group.getGroupId()}">${group.getGroupName()}</a></h3>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-5" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Laptop - Lt Gaming</h3>
                    <div class="section-nav">
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <!-- product -->
                                <c:forEach items='${requestScope["laptops"]}' var="laptop">
                                <div class="product" >
                                    <div class="product-img">
                                        <a href="/product_details?id=${laptop.getId()}"><img src="shop/img/${laptop.getImage1()}" alt="" width="100%" height="220px"></a>
                                        <div class="product-label">
                                            <c:if test='${laptop.getProduct_new() != 0 && laptop.getPromotion_price() == 0}'><span class="sale">SALE</span></c:if>
                                            <c:if test='${laptop.getProduct_new() == 0 && laptop.getPromotion_price() != 0}'><span class="new">NEW</span></c:if>
                                            <c:if test='${laptop.getProduct_new() != 0 && laptop.getPromotion_price() != 0}'><span class="new">NEW</span> <span class="sale">SALE</span></c:if>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${laptop.getCat_id()}</p>
                                        <h3 class="product-name"><a href="">${laptop.getProduct_name()}</a></h3>
                                        <c:if test='${laptop.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${laptop.getUnit_price()} "/>  VNĐ</h4></c:if>
                                        <c:if test='${laptop.getPromotion_price() != 0 && laptop.getUnit_price() != 0 }'>
                                            <h4 class="product-price">
                                                <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${laptop.getPromotion_price()}"/>  VNĐ
                                                <del class="product-old-price">
                                                    <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${laptop.getUnit_price()} "/>
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
                                </c:forEach>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown">
                        <li>
                            <div>
                                <h3>Từ</h3>
                                <span>ngày</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>25/05</h3>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>Đến</h3>
                                <span>ngày</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>25/07</h3>
                            </div>
                        </li>
                    </ul>
                    <h2 class="text-uppercase">Siêu Khuyễn Mãi Mùa Hè 2020</h2>
                    <p>Giảm Giá Nhiều Sản Phẩm Mới !!!</p>
                    <p style="">Up to 50%</p>
                    <a class="primary-btn cta-btn" href="#">Shop now</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Chuột máy tính</h3>
                    <div class="section-nav">
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                <!-- product -->
                                <c:forEach items='${requestScope["mouses"]}' var="mouses">
                                    <div class="product" >
                                        <div class="product-img">
                                            <a href=""><img src="shop/img/${mouses.getImage1()}" alt="" width="100%" height="220px"></a>
                                            <div class="product-label">
                                                <c:if test='${mouses.getProduct_new() != 0 && mouses.getPromotion_price() == 0}'><span class="sale">SALE</span></c:if>
                                                <c:if test='${mouses.getProduct_new() == 0 && mouses.getPromotion_price() != 0}'><span class="new">NEW</span></c:if>
                                                <c:if test='${mouses.getProduct_new() != 0 && mouses.getPromotion_price() != 0}'><span class="new">NEW</span> <span class="sale">SALE</span></c:if>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${mouses.getCat_id()}</p>
                                            <h3 class="product-name"><a href="">${mouses.getProduct_name()}</a></h3>
                                            <c:if test='${mouses.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${mouses.getUnit_price()} "/> VNĐ</h4></c:if>
                                            <c:if test='${mouses.getPromotion_price() != 0 && mouses.getUnit_price() != 0 }'>
                                                <h4 class="product-price">
                                                    <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${mouses.getPromotion_price()} "/> VNĐ
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${mouses.getUnit_price()} "/>  VNĐ
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
                                </c:forEach>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Linh Phụ Kiện Máy Tính</h3>
                    <div class="section-nav">
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-4">
                                <!-- product -->
                                <c:forEach items='${requestScope["items"]}' var="items">
                                    <div class="product" >
                                        <div class="product-img">
                                            <a href=""><img src="shop/img/${items.getImage1()}" alt="" width="100%" height="220px"></a>
                                            <div class="product-label">
                                                <c:if test='${items.getProduct_new() != 0 && items.getPromotion_price() == 0}'><span class="sale">SALE</span></c:if>
                                                <c:if test='${items.getProduct_new() == 0 && items.getPromotion_price() != 0}'><span class="new">NEW</span></c:if>
                                                <c:if test='${items.getProduct_new() != 0 && items.getPromotion_price() != 0}'><span class="new">NEW</span> <span class="sale">SALE</span></c:if>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${items.getCat_id()}</p>
                                            <h3 class="product-name"><a href="">${items.getProduct_name()}</a></h3>
                                            <c:if test='${items.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${items.getUnit_price()} "/>  VNĐ VNĐ</h4></c:if>
                                            <c:if test='${items.getPromotion_price() != 0 && items.getUnit_price() != 0 }'>
                                                <h4 class="product-price">
                                                    <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${items.getPromotion_price()} "/> VNĐ
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${items.getUnit_price()} "/>  VNĐ
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
                                </c:forEach>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-4" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Máy tính - Máy chủ</h4>
                    <div class="section-nav">
                        <a href="/age/1">Xem thêm</a>
                    </div>
                </div>
                <hr class="widget-hr">
                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                        <!-- product widget -->
                        <c:forEach items='${requestScope["pc"]}' var="pc">
                            <div class="product-widget">
                                <div class="product-img">
                                    <a href=""><img src="shop/img/${pc.getImage1()}" width="60px" height="60px"></a>
                                </div>
                                <div class="product-body">
                                    <p class="product-category"></p>
                                    <h3 class="product-name"><a href="">${pc.getProduct_name()}</a></h3>
                                    <c:if test='${pc.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${pc.getUnit_price()} "/>  VNĐ VNĐ</h4></c:if>
                                    <c:if test='${pc.getPromotion_price() != 0 && vp.getUnit_price() != 0 }'>
                                        <h4 class="product-price">
                                            <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${pc.getPromotion_price()} "/> VNĐ
                                            <del class="product-old-price">
                                                <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${pc.getUnit_price()} "/>  VNĐ
                                            </del>
                                        </h4>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Thiết Bị Văn Phòng</h4>
                    <div class="section-nav">
                        <a href="/age/2">Xem thêm</a>
                    </div>
                </div>
                <hr class="widget-hr">
                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                        <!-- product widget -->
                        <c:forEach items='${requestScope["vanphong"]}' var="vp">
                        <div class="product-widget">
                            <div class="product-img">
                                <a href=""><img src="shop/img/${vp.getImage1()}" width="60px" height="60px"></a>
                            </div>
                            <div class="product-body">
                                <p class="product-category"></p>
                                <h3 class="product-name"><a href="">${vp.getProduct_name()}</a></h3>
                                <c:if test='${vp.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${vp.getUnit_price()} "/>  VNĐ</h4></c:if>
                                <c:if test='${vp.getPromotion_price() != 0 && vp.getUnit_price() != 0 }'>
                                    <h4 class="product-price">
                                        <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${vp.getPromotion_price()} "/> VNĐ
                                        <del class="product-old-price">
                                            <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${vp.getUnit_price()} "/>  VNĐ
                                        </del>
                                    </h4>
                                </c:if>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- /product widget -->
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Màn Hình Máy Tính</h4>
                    <div class="section-nav">
                        <a href="/age/3">Xem thêm</a>
                    </div>
                </div>
                <hr class="widget-hr">
                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <div>
                        <!-- product widget -->
                        <c:forEach items='${requestScope["manhinh"]}' var="mh">
                            <div class="product-widget">
                                <div class="product-img">
                                    <a href=""><img src="shop/img/${mh.getImage1()}" width="60px" height="60px"></a>
                                </div>
                                <div class="product-body">
                                    <p class="product-category"></p>
                                    <h3 class="product-name"><a href="">${mh.getProduct_name()}</a></h3>
                                    <c:if test='${mh.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${mh.getUnit_price()} "/>  VNĐ</h4></c:if>
                                    <c:if test='${mh.getPromotion_price() != 0 && vp.getUnit_price() != 0 }'>
                                        <h4 class="product-price">
                                            <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${mh.getPromotion_price()} "/> VNĐ
                                            <del class="product-old-price">
                                                <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${mh.getUnit_price()} "/>  VNĐ
                                            </del>
                                        </h4>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->
                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p style="font-size: 24px; text-align: center;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;">Một Chút Về <strong>VaVaVoom</strong></p>
                    <p class="newsletter-gt">VaVaVoom kinh doanh theo mô hình website trực tuyến kết hợp với hệ thống chuỗi cửa hàng bán lẻ tại các thành phố lớn trên toàn quốc. Với phương châm "phục phụ khách hàng bằng cả trái tim". VaVaVoom luôn lấy khách hàng làm trung tâm cho mọi hoạt động để tạo ra nhiều giá trị cộng đồng.</p>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-shopping-bag"></i> Hơn 15.000 sản phẩm</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-phone"></i> Hỗ trợ 24/7 miễn phí cuộc gọi</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-truck"></i> Miễn phí vận chuyển</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-space-shuttle"></i> Giao hàng tận nhà</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
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

