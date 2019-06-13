<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>注册</title>
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
</head>
<body>
<div id="app">
    <div class="index-inner">
        <div class="site-title">西柚淘淘网</div>
        <div class="panel panel-success" id="components" style="padding-bottom: 0;">
            <div class="panel-heading">
                <h3 class="panel-title">注册用户</h3>
            </div>
            <form class=".form-horizontal" method="post" action="${pageContext.request.contextPath}/user/register">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">Usernamen</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userName" id="username" placeholder="Usernamen"
                               style="    margin-bottom: 24px;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="userPassword" id="password" placeholder="Password"
                               style="    margin-bottom: 24px;">
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-sm-2 control-label">Tel</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userTel" id="tel" placeholder="Tel"
                                   style="    margin-bottom: 24px;">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Dormitory</label>
                            <div style="    margin-left: -7%; margin-right: 38%;">
                                <select class="form-control" name="dormitory1" style="    width: 20%;
                                                    display: inline-block;
                                                    margin-left: 0.5%;
                                                    margin-right: 2%;">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                                <select class="form-control" name="dormitory2" style="    width: 20%;
                                                        display: inline-block;
                                                        margin-right: 20%;">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                                <input type="submit" class="btn btn-default" value="Register"
                                       style="    margin-left: -15%;">
                            </div>

                        </div>

            </form>


        </div>
    </div>

    <canvas id="canvas">
        <script src="${pageContext.request.contextPath}/src/index.js"></script>
</div>
</body>
</html>