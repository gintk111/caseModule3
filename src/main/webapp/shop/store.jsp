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
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="/index">Trang chủ</a></li><li><a href="/store">Sản phẩm</a></li>
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
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <form method= "get" action= "" id="form-filter">
                    <div class="aside">
                        <h3 class="aside-title">Nhóm sản phẩm</h3>
                        <div class="checkbox-filter" style="margin-top: -20px">
                            <c:forEach items='${requestScope["groups"]}' var="groups">
                            <div class="input-checkbox" style="margin-left: 20px">
                                <input type="radio" id="brand-1" name="group" value="${groups.getGroupId()}" >
                                <span></span>
                                <b>${groups.getGroupName()}</b>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <hr>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Thương Hiệu</h3>
                        <div class="checkbox-filter" style="margin-top: -20px">
                            <c:forEach items='${requestScope["trademarks"]}' var="trademarks">
                            <div class="input-checkbox" style="margin-left: 20px">
                                <input type="radio" id="brand-1" name="trade" value="${trademarks.getTrademarkId()}" request>
                                <span></span>
                                <b>${trademarks.getTrademarkName()}</b>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <hr>
                    <!-- /aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Từ Khóa</h3>
                        <div class="checkbox-filter" style="margin-top: -20px">
                            <input type="text" name="key" class="form-control"  placeholder="Nhập từ khóa..." >
                        </div>
                    </div>
                    <hr>
                    <!-- /aside Widget -->
                    <div class="aside" style="margin-left: 65px; margin-top: -15px;">
                        <button  class="btn btn-outline-success btn-lg"	>TÌM KIẾM</button>
                    </div>
                </form>
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store products -->
                <div class="row">
                    <c:forEach items='${requestScope["products"]}' var="products">
                    <!-- product -->
                    <div class="col-md-4 col-xs-6">
                        <div class="product" >
                            <div class="product-img">
                                <a href=""><img src="shop/img/${products.getImage1()}" alt="" width="100%" height="220px"></a>
                                <div class="product-label">
                                    <c:if test='${products.getProduct_new() != 0 && products.getPromotion_price() == 0}'><span class="sale">SALE</span></c:if>
                                    <c:if test='${products.getProduct_new() == 0 && products.getPromotion_price() != 0}'><span class="new">NEW</span></c:if>
                                    <c:if test='${products.getProduct_new() != 0 && products.getPromotion_price() != 0}'><span class="new">NEW</span> <span class="sale">SALE</span></c:if>
                                </div>
                            </div>
                            <div class="product-body">
                                <p class="product-category">${products.getCat_id()}</p>
                                <h3 class="product-name"><a href="">${products.getProduct_name()}</a></h3>
                                <c:if test='${products.getPromotion_price() == 0}'><h4 class="product-price"><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${products.getUnit_price()} "/> VNĐ</h4></c:if>
                                <c:if test='${products.getPromotion_price() != 0 && mouses.getUnit_price() != 0 }'>
                                    <h4 class="product-price">
                                        <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${products.getPromotion_price()} "/> VNĐ
                                        <del class="product-old-price">
                                            <fmt:formatNumber type="number" maxIntegerDigits="10"  value="${products.getUnit_price()} "/>  VNĐ
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
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <div class="pagination">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test='${page != firstpage }'>
                        <li class="page-item">
                            <a class="page-link" href="/store?group=${group}&trade=${trade}&key=${key}&page=1" tabindex="-1" aria-label="">
                                <span aria-hidden="true">First</span>
                            </a>
                        </li>
                        <c:if test='${page >= 2 }'>
                            <li class="page-item">
                                <a class="page-link" href="/store?group=${group}&trade=${trade}&key=${key}&page=${strPreviousPage}">${strPreviousPage}</a>
                            </li>
                        </c:if>
                        <li class="page-item active">
                            <a class="page-link" href="/store?group=${group}&trade=${trade}&key=${key}&page=${page}">${page}</a>
                        </li>
                        <c:if test='${page != strTotalPage }'>
                            <li class="page-item">
                                <a class="page-link" href="/store?group=${group}&trade=${trade}&key=${key}&page=${strNext}">${strNext}</a>
                            </li>
                            <c:if test='${strNext != strTotalPage }'>
                                <li class="page-item">
                                    <a class="page-link" href="/store?group=${group}&trade=${trade}&key=${key}&page=${strNext1}">${strNext1}</a>
                                </li>
                            </c:if>
                            <li class="page-item">
                                <a class="page-link" href="/store?group=${group}&trade=${trade}&key=${key}&page=${strTotalPage}" aria-label="">
                                    <span aria-hidden="true">Last</span>
                                </a>
                            </li>
                        </c:if>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
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
