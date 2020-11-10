<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <title>Nguyễn Đức Thành</title>
    <%@ include file="css.jsp"%>

</head>
<body>
<div id="wrapper">
    <%@include file="menuleft.jsp"%>
    <div id="page-wrapper" class="gray-bg">
        <div class="row">
            <!-- Navbar top -->
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary" href="javascript:void(0);"><i class="fa fa-navicon"></i></a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <a href=""><i class="fa fa-sign-out"></i> Logout</a>
                    </li>
                </ul>
            </nav>
            <!--./ end navbar top -->
        </div>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <div class="col-lg-12 pl-5">
                                <ol class="breadcrumb">
                                    <li>
                                        <a href="">Trang chủ</a>
                                    </li>
                                    <li class="active">
                                        <a href="">Thêm mới</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default border-square">
                                        <div class="ibox-title">
                                            <h3 class="pull-left"><i class="fa fa-industry"></i>Thêm sản phẩm</h3>
                                            <c:if test='${requestScope["message"] != null}'>
                                                <span class="message"><b style="color: red; margin-left: 300px">${requestScope["message"]}</b></span>
                                            </c:if>
                                        </div>
                                        <div class="panel-body">
                                            <ul class="nav nav-tabs row mb-5" id="navTabs-accessory">
                                                <li class="active">
                                                    <a data-toggle="tab" href="#product1">Thêm mới sản phẩm</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content" id="resultTabs" style="margin-top: 10px">
                                                <!-- thêm thủ công -->
                                                <div id="product1" class="tab-pane fade in active ">
                                                    <form method="POST" action="" id="form-insert">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-6 row" style="float: left;">
                                                                <div class="form-group">
                                                                    <label>Product Name</label>
                                                                    <input class="form-control"  name="name" placeholder="" />
                                                                    <p style="color: red"></p>
                                                                </div>
                                                                <div class="form-group" style="width: 50%;">
                                                                    <label>Group</label>
                                                                    <select  name="group" class="form-control select2 select-group" >
                                                                        <c:forEach items='${requestScope["groups"]}' var="groups">
                                                                            <option value="${groups.getGroupId()}">${groups.getGroupName()}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group" style="width: 50%;">
                                                                    <label>Category</label>
                                                                    <select  name="cat" class="form-control select2 select-group">
                                                                        <c:forEach items='${requestScope["categories"]}' var="categories">
                                                                            <option value="${categories.getCat_id()}">${categories.getCat_name()}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group" style="width: 50%;">
                                                                    <label>Trademark</label>
                                                                    <select  name="trade" class="form-control select2 select-group">
                                                                    <c:forEach items='${requestScope["trademarks"]}' var="trademarks">
                                                                        <option value="${trademarks.getTrademarkId()}">${trademarks.getTrademarkName()}</option>
                                                                    </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Unit Price</label>
                                                                    <input type="text" class="form-control" name="unit" placeholder="" required />
                                                                    <p style="color: red"></p>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Promotion Price</label>
                                                                    <input type="text" class="form-control" name="promotion" placeholder="" required />
                                                                    <p style="color: red"></p>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 row" style="float: left; margin-left: 30px;">
                                                                <div class="form-group" style="width: 50%;">
                                                                    <label>Sản Phẩm mới</label>
                                                                    <select  name="new" class="form-control select2 select-group">
                                                                        <option value="1" required="true">New</option>
                                                                        <option value="0">Not New</option>
                                                                    </select>

                                                                    <p style="color: red"> </p>

                                                                </div>
                                                                <div class="form-group" style="width: 65%;">
                                                                    <label>Image1</label>
                                                                    <input type="file" class="form-control" name="image1" placeholder="">
                                                                    <p style="color: red"></p>
                                                                </div>
                                                                <div class="form-group" style="width: 65%;">
                                                                    <label>Image2</label>
                                                                    <input type="file" class="form-control" name="image2" placeholder="">
                                                                    <p style="color: red"></p>
                                                                </div>
                                                                <div class="form-group" style="width: 65%;">
                                                                    <label>Image3</label>
                                                                    <input type="file" class="form-control" name="image3" placeholder="">
                                                                    <p style="color: red"></p>
                                                                </div>
                                                                <div class="form-group" style="width: 65%;">
                                                                    <label>Image4</label>
                                                                    <input type="file" class="form-control" name="image4" placeholder="">
                                                                    <p style="color: red"></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Description 1</label>
                                                            <input class="form-control"  name="des1" placeholder="" />
                                                            <p style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Description 2</label>
                                                            <input class="form-control"  name="des2" placeholder="" />
                                                            <p style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Description 3</label>
                                                            <input class="form-control"  name="des3" placeholder="" />
                                                            <p style="color: red"></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Description 4</label>
                                                            <input class="form-control"  name="des4" placeholder="" />
                                                            <p style="color: red"></p>
                                                        </div>
                                                        <div style="text-align: center">
                                                            <button type="submit" class="btn btn-success" name="btn_submit">
                                                                <i class="fa fa-save fa-fw"></i> Lưu lại
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- kết thúc thêm thủ công -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="text-center">
                <strong>Copyright</strong> SHI-V Company &copy; 2018
            </div>
        </div>
    </div>
    <%@ include file="js.jsp"%>
</body>
</html>
