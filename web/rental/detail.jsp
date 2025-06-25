<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>房源详情 - ${house.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/style.css"> <%-- 复用现有的样式表 --%>
    <style>
        .detail-container {
            max-width: 960px;
            margin: 2rem auto;
            padding: 2rem;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        .image-gallery img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .house-info h1 {
            color: #333;
        }
        .house-info .price {
            font-size: 2rem;
            color: #e63946;
            margin-bottom: 1rem;
        }
        .house-specs {
            margin: 1rem 0;
            padding: 1rem;
            background-color: #f8f9fa;
            border-left: 4px solid #007bff;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 1rem;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="logo">房屋租赁系统</div>
    <div class="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/">返回首页</a></li>
        </ul>
    </div>
</div>

<div class="detail-container">
    <a href="${pageContext.request.contextPath}/" class="back-link">&larr; 返回列表</a>

    <c:if test="${not empty house}">
        <%-- 将逗号分隔的图片路径字符串分割成一个数组 --%>
        <c:set var="imagePaths" value="${fn:split(house.imagePaths, ',')}" />

        <div class="image-gallery">
            <c:forEach var="imgPath" items="${imagePaths}">
                <c:if test="${not empty imgPath}">
                    <img src="${pageContext.request.contextPath}/${imgPath}" alt="房源图片: ${house.title}">
                </c:if>
            </c:forEach>
        </div>

        <div class="house-info">
            <h1>${house.title}</h1>
            <div class="price">
                <fmt:formatNumber value="${house.price}" type="currency" currencySymbol="¥"/>/月
            </div>

            <div class="house-specs">
                <p><strong>位置:</strong> ${fn:escapeXml(house.city)} - ${fn:escapeXml(house.address)}</p>
                <p><strong>户型:</strong> ${fn:escapeXml(house.houseType)} | ${house.bedrooms}室${house.bathrooms}卫 | <strong>面积:</strong> ${house.area} m²</p>
            </div>

            <h3>房源描述</h3>
            <p>${fn:escapeXml(house.description)}</p>

            <br/>

                <%-- 租赁按钮表单 --%>
            <form action="${pageContext.request.contextPath}/rental/rent" method="post" style="text-align: right;">
                <input type="hidden" name="houseId" value="${house.id}">
                <c:choose>
                    <c:when test="${house.rented}">
                        <button type="button" disabled class="add-to-cart" style="background-color: #ccc;">已出租</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="add-to-cart" style="background-color: #28a745;">立即租赁</button>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </c:if>

    <c:if test="${empty house}">
        <p>抱歉，未找到该房源的详细信息。</p>
    </c:if>

</div>

<footer class="footer">
    <div class="footer-content">
        <p>&copy; 2025 房屋租赁系统. All Rights Reserved.</p>
    </div>
</footer>

</body>
</html>