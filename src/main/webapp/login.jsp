<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>登录</title>
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
    </style>

</head>
<body>
<div class="index-inner">
    <div class="site-title">西柚淘淘网</div>
    <div class="panel panel-success" id="components" style="padding-bottom: 4%;">
        <div class="panel-heading">
            <h3 class="panel-title">欢迎</h3>
            <span>${pageContext.request.getAttribute("msg")}</span>
        </div>
        <div class="panel-body">
            <form class="bs-example bs-example-form" role="form" method="post" action="${pageContext.request.contextPath}/user/login">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">用户</span>
                    <input type="text" class="form-control" placeholder="请输入你的用户名" name="userName">
                </div>
                <br>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">密码</span>
                    <input type="password" class="form-control" placeholder="请输入密码" name="userPassword">
                </div>
                <div class="form-group" style="    margin-bottom: -3%">
                    <button type="submit" class="btn btn-default btn-default" style="margin-top: 3%">登录</button>
                    <a type="buttond" class="btn btn-default btn-default"
                            style="margin-top: 3%;margin-left: 2%" onclick="register()">注册
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<canvas id="canvas"></canvas>
<script src="${pageContext.request.contextPath}/src/index.js"></script>
<script>
    function register() {
        window.location.href="${pageContext.request.contextPath}/register.jsp";
    }
</script>
</div>
</body>
</html>