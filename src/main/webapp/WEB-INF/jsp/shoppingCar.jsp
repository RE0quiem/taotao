<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/5/29
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
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
        function deletePro() {
            obj = document.getElementsByName("ids");
            check_val = [];
            for (k in obj) {
                if (obj[k].checked) {
                    check_val.push(obj[k].value);
                }
            }
            $.ajax({
                url: '${pageContext.request.contextPath}/order/delete',
                data: {proIds: check_val},
                type: 'post',
                traditional: true,
                async: true,
                dataType: "json",
                success: function (data) {
                    if (data.code == '200') {
                        window.location.href = "${pageContext.request.contextPath}/order/toShoppingCar?userId=${sessionScope.loginUser.userId}";
                    }
                },
                error: function () {
                    alert("删除失败");
                },
            });
        }

        function buy() {
            obj = document.getElementsByName("ids");
            chaeck_val = [];
            for (k in obj) {
                if (obj[k].checked) {
                    chaeck_val.push(obj[k].value);
                }
            }
            $.ajax({
                url: '${pageContext.request.contextPath}/order/buy?sum=${sum}',
                data: {proIds: chaeck_val},
                type: 'post',
                traditional: true,
                async: true,
                dataType: 'json',
                success: function (data) {
                    if (data.code == '200') {
                        alert("购买成功");
                        window.location.href = "${pageContext.request.contextPath}/order/toShoppingCar?userId=${sessionScope.loginUser.userId}";
                    }
                    if (data.code == '300') {
                        alert("购买失败，余额不足！");
                    }
                },
                error: function () {
                    alert("购买失败");
                }
            })
        }
    </script>
</head>
<body>
<div id="app">
    <div class="index-inner">
        <div class="site-title">西柚淘淘网</div>
        <div class="panel panel-success" id="components" style="padding-bottom: 0;">
            <div class="panel-heading">
                <h3 class="panel-title">购物车</h3>
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
                                <th>下单时间</th>
                                <th>商品价格</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${productMap}" varStatus="status">
                                <tr style="    height: 60px;">
                                    <td style="line-height: 60px"><input type="checkbox" name="ids"
                                                                         value="${item.key.productId}"></td>
                                    <td><img src="${item.key.img}" alt="..." class="img-circle"
                                             style="width: 60px; height: 60px;"></td>
                                    <td style="line-height: 60px">${item.key.productName}</td>
                                    <td style="line-height: 60px">${item.value}</td>
                                    <td style="line-height: 60px">${item.key.price}</td>
                                </tr>
                            </c:forEach>
                            <td style="line-height: 60px">合计：${sum}元</td>
                            <td style="line-height: 60px"><a style="color:#3c3c3c"
                                                             href="${pageContext.request.contextPath}/user/queryAll">返回首页</a>
                            </td>
                            </tbody>
                        </table>
                    </div>
                </div>
                <input id="delete" type="button" class="btn btn-default" value="删除" onclick="deletePro()">
                <input type="button" class="btn btn-default" value="购买" onclick="buy()">
            </form>


        </div>
    </div>
</div>
<canvas id="canvas">
    <script src="${pageContext.request.contextPath}/src/index.js"></script>
</canvas>
</body>
</html>
