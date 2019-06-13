<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/5/26
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <style>
        html {
            height: 100%
        }

        body {
            margin: 0;
            height: 100%;
            background: #fff;
        }

        canvas {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: -1;
            margin: 0;
            cursor: none;
            background: rgb(253, 253, 253);
        }

        .product-container {
            justify-content: initial !important;
        }

        .product-container .row {
            margin-right: 50px;
            margin-bottom: 20px;
        }

        .product-container .row:nth-child(4n) {
            margin-right: 0;
        }

        .product-container .row:nth-last-child(-n+4) {
            margin-bottom: 0;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- <a class="navbar-brand" href="#">淘淘网</a> -->
            <span class="navbar-brand">西柚淘淘网</span>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">商品列表 <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">消息 <span class="badge"></span><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%--<li><a href="#">未读</a></li>--%>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/message/toMessageCenter">消息管理</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我的商品 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <!-- <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li> -->
                        <%--<li><a href="${pageContext.request.contextPath}/product/toBoughtProduct">已购买的商品</a></li>--%>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user/toInsertProduct">上架商品</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/product/toUnderShelf">上架商品管理</a></li>
                        <!-- <li role="separator" class="divider"></li>
                      <li><a href="#">One more separated link</a></li> -->
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" method="post"
                  action="${pageContext.request.contextPath}/product/fuzzySearch">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索商品" name="fuzzyProName">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <%--<li><a href="#">头像</a></li>--%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">欢迎: ${sessionScope.loginUser.userName}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/toUpdatePerson?userId=${sessionScope.loginUser.userId}">用户信息管理</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user/toAccountMoney">账户余额</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/order/toShoppingCar?userId=${sessionScope.loginUser.userId}">购物车</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user/loginOut">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="product-container" style="display: flex; justify-content: space-around; flex-direction: row;flex-wrap: wrap"
     ;>
    <c:forEach items="${productsList}" var="product" varStatus="s">
        <div class="row">
            <div class="col-sm-6 col-md-4" style="height: 30%; margin-right: 6%;    margin-left: 3%; width: 450px">
                <div class="thumbnail">
                    <img src="${product.img}" style="    height: 270px;width: 300px"
                         alt="...">
                    <div class="caption">
                        <h3>${product.productName}</h3>
                        <p>价格：${product.price}元</p>
                        <p>上传人：${product.fromUser.userName}</p>
                        <p>
                            <a href="${pageContext.request.contextPath}/product/toProductDetails?proId=${product.productId}"
                               class="btn btn-primary" role="button" style="margin-left: 30%;">details</a>
                            <a class="btn btn-default" role="button"
                               id="insert-${s.index}"
                               <c:if test="${sessionScope.loginUser.userName eq product.fromUser.userName}">disabled="disabled" </c:if>
                               onclick="forbiden(event,'${product.productId}','${sessionScope.loginUser.userId}')">
                                <span
                                        class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                </span>
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<nav aria-label="Page navigation pagination-lg" style=" padding-left: 45%;">
    <div class="col-md-6">
        当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
    </div>
    <div class="col-md-6">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/user/queryAll?pageNum=1" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <!--上一页-->
            <li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="${pageContext.request.contextPath}/user/queryAll?pageNum=${pageInfo.pageNum-1}"
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </c:if>
            </li>
            <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
            <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                <c:if test="${page_num == pageInfo.pageNum}">
                    <li class="active"><a href="#">${page_num}</a></li>
                </c:if>
                <c:if test="${page_num != pageInfo.pageNum}">
                    <li><a href="${pageContext.request.contextPath}/user/queryAll?pageNum=${page_num}">${page_num}</a>
                    </li>
                </c:if>
            </c:forEach>
            <!--下一页-->
            <li>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="${pageContext.request.contextPath}/user/queryAll?pageNum=${pageInfo.pageNum+1}"
                       aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </c:if>
            </li>
            <li><a href="${pageContext.request.contextPath}/user/queryAll?pageNum=${pageInfo.pages}">尾页</a></li>
        </ul>
    </div>
</nav>
<canvas id="canvas"></canvas>
<script src="${pageContext.request.contextPath}/src/index.js"></script>
<script>
    function forbiden(event, id, uid) {
        if (event.target.nodeName === 'SPAN') {
            return;
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/order/insertOrder",
            data: {
                proId: id,
                userId: uid
            },
            dataType: "json",
            success: function (data) {
                event.target.onclick = null;
            }
        })
    }
</script>
</body>
</html>
