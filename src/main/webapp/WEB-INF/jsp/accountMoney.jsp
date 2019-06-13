<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/5/30
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>账户余额</title>
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
            margin-top: 18%;
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
            background: rgb(253, 253, 253);
        }

        .form-container {
            display: flex;
            align-items: center;
            justify-content: space-around;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div id="app">
    <div class="index-inner">
        <div class="site-title">西柚淘淘网</div>
        <div class="panel panel-success" id="components" style="padding-bottom: 4%;">
            <div class="panel-heading">
                <h3 class="panel-title">欢迎:${sessionScope.loginUser.userName}</h3>
            </div>
            <div class="panel-body">

                <form class="form-inline" method="post" action="${pageContext.request.contextPath}/user/rechargeMoney">
                    <div class="form-container">
                        <div> 账户余额:</div>

                        <div>
                            <p class="form-control-static"
                               style="margin-left: -82%;">${sessionScope.loginUser.userMoney}元</p>
                        </div>
                    </div>

                    <div class="form-container">
                        <div class="form-group">
                            <label style="color: red; font-size: 20px;">充值</label>
                            <p class="form-control-static">输入充值金额:</p>
                        </div>
                        <div class="form-group">
                            <label for="inputMoney" class="sr-only">inputMoney</label>
                            <input type="text" class="form-control" id="inputMoney" name="rechargeMoney"
                                   placeholder="输入金额：元">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default pull-right">Confirm</button>
                </form>
            </div>
        </div>
    </div>

    <canvas id="canvas"></canvas>
    <script src="${pageContext.request.contextPath}/src/index.js"></script>
</div>
</body>
</html>
