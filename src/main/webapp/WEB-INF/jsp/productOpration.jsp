<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/5/30
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>商品管理</title>
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

        #app {
            font-family: Lato, PingFang SC, Microsoft YaHei, sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            text-align: center;
            color: #2c3e50;
        }

        .index-inner {
            margin: 0 auto;
            padding: 30px 0 70px;
            width: 900px;
        }

        .index-inner .site-title {
            height: 80px;
            font-size: 20px;
            font-weight: 500;
            line-height: 36px !important;
        }

        #components {
            margin: 0 auto;
            padding: 0 0 70px;
            width: 900px;
            -webkit-box-shadow: 0 0 14px #cacbcc;
            box-shadow: 0 0 14px #cacbcc;
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
            background: rgb(253, 246, 246);
        }
    </style>
    <script>
        function underShelf() {
            check_val = [];
            obj = document.getElementsByName("ids");
            for (k in obj) {
                if (obj[k].checked) {
                    check_val.push(obj[k].value);
                }
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/product/underShelf",
                data: {proIds: check_val},
                type: 'post',
                traditional: true,
                async: true,
                dataType: "json",
                success: function (data) {
                    if (data.code == '200') {
                        window.location.href = "${pageContext.request.contextPath}/product/toUnderShelf";
                    }
                },
                error: function () {
                    alert("下架失败");
                },
            });
        }
    </script>
</head>
<body>
<div id="app">
    <div class="index-inner">
        <div class="site-title">西柚淘淘网</div>
        <div class="panel panel-success" id="components" style="padding-bottom: 0;">
            <div class="panel-heading">
                <h3 class="panel-title">上架商品管理</h3>
            </div>
            <form class=".form-horizontal" style="    height: 600px;">
                <!-- 购物车内容 -->
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>多选</th>
                                <th>商品图片</th>
                                <th>商品名称</th>
                                <th>上传时间</th>
                                <th>商品价格</th>
                                <th>选择修改</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${productsList}" varStatus="status">
                                <tr style="    height: 60px;">
                                    <td style="line-height: 60px"><input type="checkbox" name="ids"
                                                                         value="${item.productId}"></td>
                                    <td><img src="${item.img}" alt="..." class="img-circle"
                                             style="width: 60px; height: 60px;"></td>
                                    <td style="line-height: 60px">${item.productName}</td>
                                    <td style="line-height: 60px">${item.startTime}</td>
                                    <td style="line-height: 60px">${item.price}</td>
                                    <td style="line-height: 60px"><a href="">修改</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <td></td>
                            <td style="line-height: 60px"><a style="color:#3c3c3c"
                                                             href="${pageContext.request.contextPath}/user/queryAll">返回首页</a>
                            </td>
                        </table>
                    </div>
                </div>

                <nav aria-label="Page navigation pagination-lg" style=" padding-left: 45%;">
                    <div class="col-md-6">
                        当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
                    </div>
                    <div class="col-md-6">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/product/toUnderShelf?pageNum=1"
                                   aria-label="Previous">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <!--上一页-->
                            <li>
                                <c:if test="${pageInfo.hasPreviousPage}">
                                    <a href="${pageContext.request.contextPath}/product/toUnderShelf?pageNum=${pageInfo.pageNum-1}"
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
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/toUnderShelf?pageNum=${page_num}">${page_num}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <!--下一页-->
                            <li>
                                <c:if test="${pageInfo.hasNextPage}">
                                    <a href="${pageContext.request.contextPath}/product/toUnderShelf?pageNum=${pageInfo.pageNum+1}"
                                       aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </c:if>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/product/toUnderShelf?pageNum=${pageInfo.pages}">尾页</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <input type="button" class="btn btn-default" value="下架" onclick="underShelf()">
            </form>


        </div>
    </div>
</div>
<canvas id="canvas">
    <script src="${pageContext.request.contextPath}/src/index.js"></script>
</canvas>
</body>
</html>
