<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/5/30
  Time: 1:50
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
    <title>个人中心</title>
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
        $(function () {

        })
    </script>
</head>
<body>
<div id="app">
    <div class="index-inner">
        <div class="site-title">西柚淘淘网</div>
        <div class="panel panel-success" id="components" style="padding-bottom: 0;">
            <div class="panel-heading">
                <h3 class="panel-title">个人中心/修改</h3>
            </div>
            <form class=".form-horizontal" method="post" action="/user/updatePerson">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userName" id="username"
                               value="${userUpdate.user.userName}" style="    margin-bottom: 24px;">
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">新的密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="userPassword" id="password"
                                   placeholder="Password" style="    margin-bottom: 24px;">
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userTel" id="tel"
                                       value="${userUpdate.user.userTel}" style="    margin-bottom: 24px;">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">寝室</label>
                                <div style="    margin-left: -7%; margin-right: 38%;">
                                    <select class="form-control" name="dormitory1" style="    width: 20%;
                                                    display: inline-block;
                                                    margin-left: 0.5%;
                                                    margin-right: 2%;">
                                        <option <c:if test="${userUpdate.dor1==1}">selected="selected"</c:if>>1</option>
                                        <option <c:if test="${userUpdate.dor1==2}">selected="selected"</c:if>>2</option>
                                        <option <c:if test="${userUpdate.dor1==3}">selected="selected"</c:if>>3</option>
                                        <option <c:if test="${userUpdate.dor1==4}">selected="selected"</c:if>>4</option>
                                        <option <c:if test="${userUpdate.dor1==5}">selected="selected"</c:if>>5</option>
                                    </select>
                                    <select class="form-control" name="dormitory2" style="    width: 20%;
                                                        display: inline-block;
                                                        margin-right: 20%;">
                                        <option <c:if test="${userUpdate.dor2==1}">selected="selected"</c:if>>1</option>
                                        <option <c:if test="${userUpdate.dor2==2}">selected="selected"</c:if>>2</option>
                                        <option <c:if test="${userUpdate.dor2==3}">selected="selected"</c:if>>3</option>
                                        <option <c:if test="${userUpdate.dor2==4}">selected="selected"</c:if>>4</option>
                                        <option <c:if test="${userUpdate.dor2==5}">selected="selected"</c:if>>5</option>
                                    </select>
                                    <input type="submit" class="btn btn-default" value="修改"
                                           style="    margin-left: -15%;">
                                </div>

                            </div>

            </form>


        </div>
    </div>
</div>

<canvas id="canvas">
    <script src="${pageContext.request.contextPath}/src/index.js"></script>
</body>
</html>
