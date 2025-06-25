<%--
  Created by IntelliJ IDEA.
  User: Lzs
  Date: 2025/6/19
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%-- /admin/rented-houses.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>已租房源报表</title>
    <style>
        /* 您可以复用之前的管理员页面样式，或自定义 */
        body { font-family: sans-serif; margin: 2rem; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>

<h1>已租房源信息</h1>
<p>这里是所有已完成的租赁记录列表。</p>

<table>
    <thead>
    <tr>
        <th>租赁ID</th>
        <th>房源标题</th>
        <th>月租价格</th>
        <th>承租人</th>
        <th>承租人邮箱</th>
        <th>租赁日期</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty rentalList}">
        <tr>
            <td colspan="6" style="text-align: center;">当前没有已租出的房源记录。</td>
        </tr>
    </c:if>

    <c:forEach var="rental" items="${rentalList}">
        <tr>
            <td>${rental.id}</td>
            <td><c:out value="${rental.house.title}" /></td>
            <td>￥${rental.house.price}</td>
            <td><c:out value="${rental.user.username}" /></td>
            <td><c:out value="${rental.user.email}" /></td>
            <td>
                <fmt:formatDate value="${rental.rentalDate}" pattern="yyyy-MM-dd HH:mm:ss" type="both" />
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<a href="${pageContext.request.contextPath}/admin/manage">返回房源管理</a>

</body>
</html>