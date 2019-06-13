<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/6/2
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>消息管理</title>
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
</head>
<body>
<div id="app">
    <div class="index-inner">
        <div class="site-title">西柚淘淘网</div>
        <div class="panel panel-success" id="components" style="padding-bottom: 0;">
            <div class="panel-heading">
                <h3 class="panel-title">评论管理</h3>
            </div>
            <form class=".form-horizontal" style="    height: 600px;">
                <!-- 评论内容 -->
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>多选</th>
                                <th>评论内容</th>
                                <th>评论时间</th>
                                <th>To用户</th>
                                <th>To商品</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="msg" items="${msgList}"  varStatus="s">
                                <tr>
                                    <td><input type="checkbox" name="ids"
                                                                         value="${msg.mId}"></td>
                                    <td>${msg.mContent}</td>
                                    <td>${msg.mTime}</td>
                                    <td>${msg.mParentName}</td>
                                    <td>${msg.mProName}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <input id="delete" type="button" class="btn btn-default" value="删除" onclick="deleteMsg()">
            </form>

            <a style="color:#3c3c3c"
               href="${pageContext.request.contextPath}/user/queryAll">返回首页</a>
        </div>
    </div>
</div>
<canvas id="canvas">
    <script src="${pageContext.request.contextPath}/src/index.js"></script>
</canvas>
</body>
<script>
    function deleteMsg() {
        check=document.getElementsByName("ids");
        var ids=[];
        for(k in check){
            if(check[k].checked){
                ids.push(check[k].value);
            }
        }
        console.log(ids);
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/message/deleteMsg",
            data:{
                ids:ids
            },
            traditional:true,
            dataType:"json",
            success(data){
                if(data.code='200'){
                    alert("删除成功！");
                    window.location.href="${pageContext.request.contextPath}/message/toMessageCenter";
                }
            }
        })
    }
</script>
</html>
