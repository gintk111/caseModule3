<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <title>Nguyễn Đức Thành</title>
    <meta charset="utf-8">
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
                        <div class="col-lg-3 pl-5">
                            <ol class="breadcrumb">
                                <li>
                                    <a href="">Trang chủ</a>
                                </li>
                                <li>
                                    <a href="">Danh sách khách hàng</a>
                                </li>
                            </ol>
                        </div>
                        <div class="col-lg-9">
                            <c:if test='${requestScope["message"] != null}'>
                                <span class="message111" ><b style="color: red; margin-left: 30%">${requestScope["message"]}</b></span></>
                            </c:if>
                        </div>
                    </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="panel panel-default border-square">
                                        <div class="panel-heading border-square">
                                            <div class="row">.
                                                <div class="col-sm-10 text-left">
                                                    <form method="get">
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-10   ">
                                                            <!-- tìm kiếm -->
                                                                <div class="row">
                                                                    <div style="width: 1000px;">
                                                                        <div style="margin-right: 30px;width: 150px;float: left;">
                                                                            <select class="form-control select2" name="group" id="group" onChange="submit(this.form)">
                                                                                <option value="">Group</option>
                                                                                <c:forEach items='${requestScope["groups"]}' var="groups">
                                                                                <option value="${groups.getGroupId()}" <c:if test='${ group == groups.getGroupId() }'>selected</c:if> >${groups.getGroupName()}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div style="margin-right: 30px;width: 150px;float: left;">
                                                                            <select class="form-control select2" name="trade" id="trade" onChange="submit(this.form)">
                                                                                <option value="">Trademark</option>
                                                                                <c:forEach items='${requestScope["trademarks"]}' var="trademarks">
                                                                                <option value="${trademarks.getTrademarkId()}" <c:if test='${ trade == trademarks.getTrademarkId() }'>selected</c:if> >${trademarks.getTrademarkName()}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div style="float: left;">
                                                                            <input type="text" name="key"  id="key" class="form-control" value="" placeholder="Nhập từ khóa...">
                                                                        </div>
                                                                        <div style="padding: 0; margin-left: -35px;float: left;">
                                                                            <button id="button1"  class="btn btn-warning" type="submit" style="padding: 6px 35px;"><i class="fa fa-search"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
<%--                                                            </form>--%>
                                                            <!-- tìm kiếm -->
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="col-sm-2 text-right" style="margin-top: -20px">
                                                    <a href="/admin?action=insert" class="btn btn-primary">
                                                        <i class="fa fa-plus-square fa-fw"></i>Thêm mới
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- thông báo -->
                                        <div class="alert alert-info" id="time" style='display:none'>
                                            <!-- thông báo -->
                                            <div class="panel-body">
                                            </div>
                                            <div style="float: right;"></div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th style="text-align: center">###</th>
                                                    <th style="text-align: center">Product Name</th>
                                                    <th style="text-align: center">Product Image</th>
                                                    <th style="text-align: center">Category</th>
                                                    <th style="text-align: center">Trademark</th>
                                                    <th style="text-align: center">Unit Price</th>
                                                    <th style="text-align: center">Promotion Price</th>
                                                    <th style="text-align: center">New</th>
                                                    <th style="text-align: center">Crated At</th>
                                                    <th style="text-align: center">Updated At</th>
                                                    <th style="text-align: center">Tác vụ</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items='${requestScope["products"]}' var="pr">
                                                    <tr>
                                                        <td>${pr.getId()}</td>
                                                        <td>${pr.getProduct_name()}</td>
                                                        <td><img src="/shop/img/${pr.getImage1()}" style="width: 85px; height: 70px;"></td>
                                                        <td>${pr.getCat_name()}</td>
                                                        <td>${pr.getTrade_name()}</td>
                                                        <td><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${pr.getUnit_price()} "/></td>
                                                        <td><fmt:formatNumber type="number" maxIntegerDigits="10"  value="${pr.getPromotion_price()} "/></td>
                                                        <td><c:if test='${pr.getProduct_new() == 1}'><span><img src="admin/img/active_icon.png" style="width: 30px; height: 30px;"></span></c:if></td>
                                                        <td>${pr.getCreated_at()}</td>
                                                        <td>${pr.getUpdate_at()}</td>
                                                        <td>
                                                            <a href="/customers?action=update&id=" class="btn">
                                                                <i class="glyphicon glyphicon-edit"></i> Sửa
                                                            </a>
                                                            <a href="/admin?action=delete&id=${pr.getId()}">
                                                                <i class="glyphicon glyphicon-trash"></i> Xóa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div style="float: right; margin-right: 50px; font-size: 17px">
                                        <div class="pagination">
                                            <nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <c:if test='${page != firstpage }'>
                                                    <li class="page-item">
                                                        <a class="page-link" href="/admin?key=${key}&page=1" tabindex="-1" aria-label="">
                                                            <span aria-hidden="true">First</span>
                                                        </a>
                                                    </li>
                                                    <c:if test='${page >= 2 }'>
                                                        <li class="page-item">
                                                            <a class="page-link" href="/admin?key=${key}&page=${strPreviousPage}">${strPreviousPage}</a>
                                                        </li>
                                                    </c:if>
                                                    <li class="page-item active">
                                                        <a class="page-link" href="/admin?key=${key}&page=${page}">${page}</a>
                                                    </li>
                                                    <c:if test='${page != strTotalPage }'>
                                                        <li class="page-item">
                                                            <a class="page-link" href="/admin?key=${key}&page=${strNext}">${strNext}</a>
                                                        </li>
                                                        <c:if test='${strNext != strTotalPage }'>
                                                            <li class="page-item">
                                                                <a class="page-link" href="/admin?key=${key}&page=${strNext1}">${strNext1}</a>
                                                            </li>
                                                        </c:if>
                                                        <li class="page-item">
                                                            <a class="page-link" href="/admin?key=${key}&page=${strTotalPage}" aria-label="">
                                                                <span aria-hidden="true">Last</span>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:if>
                                            </ul>
                                        </nav>
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
</div>
    <%@ include file="js.jsp"%>
</body>
</html>