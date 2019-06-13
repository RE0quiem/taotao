<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/5/26
  Time: 14:19
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
    <title>添加商品</title>
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
                <h3 class="panel-title">上传商品</h3>
            </div>
            <form class=".form-horizontal" style="    height: 500px;" enctype="multipart/form-data" method="post"
                  action="${pageContext.request.contextPath}/user/insertProduct">
                <div class="form-group">
                    <label for="productName" class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="productName" id="productName" placeholder="商品名称"
                               style="    margin-bottom: 24px;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="tip" class="col-sm-2 control-label">标签</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="tip" id="tip" placeholder="标签"
                               style="    margin-bottom: 24px;">
                    </div>
                    <div class="form-group">
                        <label for="productIntro" class="col-sm-2 control-label">简介</label>
                        <div class="col-sm-10">
                            <textarea type="text" class="form-control" rows="3" name="productIntro" id="productIntro"
                                      placeholder="简介" style="    margin-bottom: 24px;"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-2 control-label">价格</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="price" id="price" placeholder="价格/元"
                                       style="    margin-bottom: 24px;">
                            </div>
                            <div class="form-group">
                                <label for="img" class="col-sm-2 control-label">上传商品</label>
                                <input type="file" name="img" placeholder="上传图片" id="img"
                                       style=" padding-left: 15px;" accept="image/jpeg,image/jpg,image/png"
                                       onchange="showIncon(this)">
                            </div>
                            <div class="form-group">
                                <label for="iconTd" class="col-sm-2 control-label">预览</label>
                                <img id="iconTd"
                                     style="background-size: 100% 100%;height:80px;width: 80px; margin-left: -638px;">
                            </div>
                            <input type="submit" class="btn btn-default" value="提交">
                        </div>
                    </div>
            </form>

        </div>
    </div>
</div>
<canvas id="canvas">
    <script src="${pageContext.request.contextPath}/src/index.js"></script>
    <script>
        function showIncon(file) {
            var r = new FileReader();
            //由于jQuery对象没有 files 属性，此处要使用原生js获取，或者$("#file")[0].files;
            f = document.getElementById('img').files[0];
            //限制上传图片大小在2M以内，超过2M则显示默认图片，并清空input框的值
            if (f.size > 2048000) {
                alert("请上传小于2M的图片");
                file.value = "";
            } else {
                r.readAsDataURL(f);
                r.onload = function (e) {
                    $("#iconTd").css("background-image", "url(" + this.result + ")");
                };
            }
        }
    </script>
</body>
</html>
