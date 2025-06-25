<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="model.House" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>我的房源</title>--%>
<%--    <style>--%>
<%--        body { font-family: sans-serif; margin: 2em; }--%>
<%--        .house-list { list-style: none; padding: 0; }--%>
<%--        .house-item { background: #f9f9f9; border: 1px solid #ddd; margin-bottom: 1em; padding: 1em; display: flex; justify-content: space-between; align-items: center; }--%>
<%--        .house-details { flex-grow: 1; }--%>
<%--        .actions a { margin-left: 1em; text-decoration: none; padding: 5px 10px; border-radius: 3px; }--%>
<%--        .edit-btn { background-color: #ffc107; color: black; }--%>
<%--        .delete-btn { background-color: #dc3545; color: white; }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>我的房源管理</h1>--%>
<%--<a href="${pageContext.request.contextPath}/">返回首页</a>--%>
<%--<hr>--%>

<%--<ul class="house-list">--%>
<%--    <c:if test="${empty userHouses}">--%>
<%--        <p>您还没有发布任何房源。</p>--%>
<%--    </c:if>--%>

<%--    <c:forEach var="house" items="${userHouses}">--%>
<%--        <li class="house-item">--%>
<%--            <div class="house-details">--%>
<%--                <strong>${house.title}</strong> - <span>${house.city}, ${house.address}</span>--%>
<%--                <p>价格: ${house.price}元/月 - 状态: ${house.rented ? '已出租' : '未出租'}</p>--%>
<%--            </div>--%>
<%--            <div class="actions">--%>
<%--                <a href="${pageContext.request.contextPath}/user/editHouse?id=${house.id}" class="edit-btn">修改</a>--%>
<%--                    &lt;%&ndash; 添加删除确认 &ndash;%&gt;--%>
<%--                <a href="${pageContext.request.contextPath}/user/dashboard?action=delete&id=${house.id}"--%>
<%--                   onclick="return confirm('您确定要删除这套房源吗？');" class="delete-btn">删除</a>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>我的房源</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f6; margin: 0; }
        .header { background: #fff; padding: 1em 2em; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        .header h1 { margin: 0; font-size: 1.5em; }
        .container { max-width: 1000px; margin: 2em auto; padding: 2em; background: #fff; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .house-list { list-style: none; padding: 0; }
        .house-item { display: flex; justify-content: space-between; align-items: center; padding: 1.5em; border-bottom: 1px solid #eee; transition: background-color 0.2s; }
        .house-item:hover { background-color: #f8f9fa; }
        .house-item:last-child { border-bottom: none; }
        .house-details { flex-grow: 1; }
        .house-details strong { font-size: 1.2em; }
        .house-details p { margin: 0.5em 0 0 0; color: #666; }
        .actions a { margin-left: 1em; text-decoration: none; padding: 0.5em 1em; border-radius: 5px; color: white; font-weight: 500; font-size: 0.9em; }
        .details-btn { background-color: #007bff; }
        .edit-btn { background-color: #ffc107; color: #212529; }
        .delete-btn { background-color: #dc3545; }
        .action-bar { margin-bottom: 1.5em; display: flex; justify-content: space-between; align-items: center;}
        .action-bar a { text-decoration: none; }
        .add-new-btn { background-color: #28a745; color: white; padding: 0.7em 1.2em; border-radius: 5px; }
    </style>
</head>
<body>
<div class="header"><h1>我的房源管理</h1></div>

<div class="container">
    <div class="action-bar">
        <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">&larr; 返回首页</a>
        <a href="${pageContext.request.contextPath}/rental/post-house.jsp" class="add-new-btn">发布新房源</a>
    </div>

    <ul class="house-list">
        <c:if test="${empty userHouses}">
            <li><p>您还没有发布任何房源。</p></li>
        </c:if>

        <c:forEach var="house" items="${userHouses}">
            <li class="house-item">
                <div class="house-details">
                    <strong>${house.title}</strong>
                    <p>${house.city}, ${house.address} - 价格: ${house.price}元/月 - 状态: ${house.rented ? '已出租' : '未出租'}</p>
                </div>
                <div class="actions">
                    <a href="${pageContext.request.contextPath}/rental/detail?id=${house.id}" class="details-btn">详情</a>
                    <a href="${pageContext.request.contextPath}/user/editHouse?id=${house.id}" class="edit-btn">修改</a>
                    <a href="${pageContext.request.contextPath}/user/dashboard?action=delete&id=${house.id}"
                       onclick="return confirm('您确定要删除这套房源吗？');" class="delete-btn">删除</a>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>