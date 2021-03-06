<%--
  Created by IntelliJ IDEA.
  User: Zero
  Date: 2017/4/16
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    //用来表示当前web工程的相对路径，即webapp下的根目录
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>用户详情</title>
    <!-- 自编 -->
    <link rel="stylesheet" href="<%=path%>/css/base.css">
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<%=path%>/templete/video/css/bootstrap.min.css" type="text/css">
    <!-- bilibili -->
    <link rel="stylesheet" href="<%=path%>/templete/bilibili/css/page-core.css">
    <link rel="stylesheet" href="<%=path%>/templete/bilibili/css/zclc2.css">
    <!-- Custom Fonts -->
    <link rel="stylesheet" href="<%=path%>/templete/video/font-awesome-4.4.0/css/font-awesome.min.css" type="text/css">

    <style>
        * {
            box-sizing: content-box;
            -webkit-box-sizing: content-box;
        }
    </style>
</head>
<body>
<!-- Header -->
<header style="margin:40px 0 30px 0;">
    <div class="header">
        <div class="num" style="background-color: rgba(53, 26, 206, 0.40)">
            <div class="menu-wrapper">
                <ul class="nav-menu">
                    <li class="m-i home" style="margin: 0 3px 0 -20px;">
                        <a href="<%=path%>/" class="i-link"><em>首页</em></a>
                    </li>
                    <!-- 菜单栏（视频类型） -->
                    <c:forEach items="${videoType}" var="bigType">
                        <li class="m-i" style="margin: 0 3px;">
                            <a href="<%=path%>/video/all?bigType=${bigType.bid}" class="i-link"  style="width: 50px">
                                <em>${bigType.bname}</em>
                                <div class="v-num">
                                    <span class="addnew_1" style="height: 1.2em;width: 2.2em;">${bigType.countRecentlyPost}</span>
                                </div>
                            </a>
                            <ul class="i_num">
                                <c:forEach items="${bigType.smallTypeBOList}" var="smallType">
                                    <li>
                                        <a href="<%=path%>/video/all?smallType=${smallType.sid}">
                                            <b>${smallType.sname}<em></em></b>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
                <div class="search" style="top:10px;left:700px;">
                    <div id="searchform" target="_blank">
                        <input name="keyword" type="text" class="search-keyword" autocomplete="off" placeholder="你不知道的100多件幻想乡秘闻">
                        <button type="submit" class="search-submit"></button>
                    </div>
                    <a class="link-ranking" href="<%=path%>/video/rank" target="_blank">
                        <span style="font-size: 12px;">排行榜</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header -->
<div class="security_content">
    <div class="security-left">
        <ul class="security-list">
            <li class="f-list" style="cursor: default;">
                <a href="javascript:;" class="first-level" style="color: #99a2aa;cursor: default;">个人中心</a>
                <ul class="child-list">
                    <li>
                        <a href="javascript:;" class="bg-blue">
                            <i class="al-info check-t"></i>
                            <span>我的信息</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/user/home/security">
                            <i class="al-aq"></i>
                            <span>账号安全</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="f-list f-list-hover"><a href="<%=path%>/space/${user.uid}" target="_blank" class="first-level" title="个人空间">个人空间<i class="m-arrow"></i></a></li>
        </ul>
    </div>

    <form action="<%=path%>/user/home/editDetail" method="post" enctype="multipart/form-data" target="ifm">
        <div class="security-right">
            <div class="sr-t">
                <span class="tit-b"></span>
                <span class="acc-sec">我的信息</span>
            </div>
            <div class="sr-b">
                <ul>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">用户名：</p>
                            <div class="sbi-m">
                                <span name="uid">${user.uid}</span>
                                <input type="hidden" name="uid" value="${user.uid}">
                            </div>
                            <p class="sbi-r" style="position:relative;left: 300px;">
                                <img id="pic" style="width: 100px;height: 100px;border-radius: 50%;border: 1px solid #F36;"
                                     src="<%=path%>/images/${user.uimg}">
                                <!-- image/*不指定图片类型，文件选择框弹出时间就会很长 -->
                                <input id="upload" name="uploadImg" accept="image/jpg,image/jpeg,image/png"
                                       type="file" style="display: none"/>
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">昵称：</p>
                            <div class="sbi-m">
                                <span><input type="text" name="uname" value="${user.uname}"></span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">我的签名：</p>
                            <div class="sbi-m">
                                <textarea name="usign" id="" cols="30" rows="10" class="my-sign">${user.usign}</textarea>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">性别：</p>
                            <input type="hidden" name="usex" id="select_sex" value="${user.usex}">
                            <div class="sbi-m">
                                <ul class="sex" id="sex_ul">
                                    <li <c:if test="${user.usex == 1}">class="blue"</c:if> data-sex="1">男</li>
                                    <li <c:if test="${user.usex == 0}">class="blue"</c:if> data-sex="0">女</li>
                                    <li <c:if test="${user.usex == null || user.usex == 2}">class="blue"</c:if> data-sex="2">保密</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">出生日期：</p>
                            <div class="sbi-m">
                                <span>
                                    <input class="user-id sb-ys" name="ubirthday" type="date"
                                           value="<fmt:formatDate value="${user.ubirthday}" pattern="yyyy-MM-dd"/>">
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">电话：</p>
                            <div class="sbi-m">
                                <span><input id="phone" name="uphone" type="text" value="${user.uphone}"></span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">邮箱：</p>
                            <div class="sbi-m">
                                <span><input id="email" name="uemail" type="text" value="${user.uemail}"></span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sb-line"></div>
            <input type="submit" class="sb-save" value="保存" style="position: absolute;bottom:80px;display: block;">
        </div>
    </form>

    <script src="<%=path%>/js/jquery-3.1.1.js"></script>

    <!-- 自编写 -->
    <script src="<%=path%>/js/base.js"></script>
    <script src="<%=path%>/templete/jDialog/jDialog.js"></script>
    <script src="<%=path%>/js/home.js"></script>
    <iframe id='ifm' name='ifm' style="display:none"></iframe>
</div>

<div class="my-footer" style="margin-top: 100px;">
    <div class="my-right">
        Copyright © 2017.集美大学 计算1312 林俊杰(Zero) 版权所有.
    </div>
</div>

</body>
</html>
