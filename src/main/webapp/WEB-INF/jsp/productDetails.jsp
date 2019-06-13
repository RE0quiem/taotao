<%--
  Created by IntelliJ IDEA.
  User: 95716
  Date: 2019/6/1
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>商品详情</title>
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

        #product {
            position: absolute;
            width: 775px;
            height: 358px;
            left: 50%;
            top: 50%;
            margin-left: -363px;
            margin-top: -179px;
        }
    </style>
</head>
<body>
<div class="col-sm-6 col-md-4" id="product"
     style="top: 25%;padding: 0 0 70px;width: 900px;-webkit-box-shadow: 0 0 14px #cacbcc;">
    <div class="thumbnail" style="vertical-align: middle;text-align: center ;">
        <h3 class="text-warning" style="    margin-top: 10px;margin-bottom: 10px;">${productDetails.productName}</h3>
        <div>
            <img src="${productDetails.img}"
                 alt="..." style="display:inline-block">
        </div>
        <div class="caption">
            <p>描述：${productDetails.productIntro}</p>
            <table class="table table-condensed">
                <tr>
                    <th>商品名称</th>
                    <th>上传用户</th>
                    <th>上传时间</th>
                    <th>商品标签</th>
                    <th>商品价格</th>
                    <th>操作</th>
                </tr>
                <tr style="font-size: small;">
                    <td>${productDetails.productName}</td>
                    <td>${productDetails.fromUser.userName}</td>
                    <td>${productDetails.startTime}</td>
                    <td>${productDetails.tip}</td>
                    <td>${productDetails.price}元</td>
                    <td><p><a class="btn btn-default" role="button"
                              <c:if test="${sessionScope.loginUser.userName eq productDetails.fromUser.userName}">disabled="disabled" </c:if>
                              onclick="forbiden(event,'${productDetails.productId}','${sessionScope.loginUser.userId}')">
                                <span
                                        class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                </span>
                    </a>
                    </p></td>
                </tr>
            </table>
        </div>
        <div>
            <p class="bg-info" style="text-align: left; font-size: large;">留言：</p>
        </div>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="留点什么吧..." id="message">
            <span class="input-group-btn">
        <button class="btn btn-default" type="button" onclick="insertMessage()">Go!</button>
      </span>
        </div>
        <c:forEach items="${messageList}" var="message" varStatus="s">
            <div style="text-align: left;   margin-top: 5px;" id="parentComment${s.index}">
                用户(${message.mFromName}):
                <a style="color: #3c3c3c" onclick="addMessageDiv('${message.mFromName}','${message.mId}','${s.index}')">${message.mContent}</a>
                <p style="display: inline-block;margin-left: 50px;">时间：${message.mTime}</p>
                <button style="float: right;line-height: 5px;" type="button" class="btn btn-link" onclick="insertComment('${message.mId}')">回复</button>
            </div>
            <div id="test${s.index}">
            </div>
        </c:forEach>
        <div style="margin-top: 10px;margin-bottom: 10px;">
            <a style="color:#3c3c3c" href="${pageContext.request.contextPath}/user/queryAll">返回首页</a>
        </div>
    </div>
</div>

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
    function insertMessage() {
        obj=document.getElementById("message");
        msg=obj.value;
        var voMsg={
            userName:"${loginUser.userName}",
            userId:"${loginUser.userId}",
            proId:"${productDetails.productId}",
            msg:msg
        }
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/message/insertMessage",
            data:JSON.stringify(voMsg),
            dataType:"json",
            contentType:"application/json",
            success:function (data) {
                if(data.code='200'){
                    alert("留言成功");
                }
               window.location.href="${pageContext.request.contextPath}/product/toProductDetails?proId=${productDetails.productId}";
            }
        })
    }
    //对回复进行评论插入
    function insertComment(mId) {
        obj=document.getElementById("message");
        msg=obj.value;
        var voMsg={
            userName:"${loginUser.userName}",
            userId:"${loginUser.userId}",
            mId:mId,
            msg:msg
        }
        $.ajax({
            type:"POST",
            data:JSON.stringify(voMsg),
            url:"${pageContext.request.contextPath}/message/insertComment",
            dataType:"json",
            contentType:"application/json",
            success:function (data) {
                if(data.code='200'){
                    alert("留言成功");
                }
                window.location.href="${pageContext.request.contextPath}/product/toProductDetails?proId=${productDetails.productId}";
            }
        })
    }
    //动态添加评论框，并查找评论
    function addMessageDiv(fromUserName,m_parentId,divIndex) {
        $.ajax({
            type:"POST",
            data:{
                parentId:m_parentId
            },
            url:"${pageContext.request.contextPath}/message/findChildMsg",
            dataType:"json",
            success:function (data) {
                console.log(data);
                var str =data.reduce(function (res,item,index) {
                    res+='<div style=text-align:left;margin-top:5px;id='+index+'>('+item.mFromName+'    To '+fromUserName+'):';
                    res+='<a style=color:#3c3c3c onclick=addMessageDiv('+item.mFromName+','+item.mId+')>'+item.mContent+'</a>';
                    res+='<p style=display:inline-block;margin-left:50px;>时间：'+item.mTime+'</p>';
                    res+='<button style=float:right;line-height:5px; type=button class=btn-link onclick=insertComment('+item.mid+')>回复</button>';
                    res+='</div>';
                    return res;
                },"")
                console.log(str);
                var name='#test'+divIndex;
                $(name).append(str);
            }
        });
    }
</script>
</body>
</html>
