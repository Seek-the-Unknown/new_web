<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="zh-CN">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>房源详情 - ${house.title}</title>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/style.css"> &lt;%&ndash; 复用现有的样式表 &ndash;%&gt;--%>
<%--    <style>--%>
<%--        .detail-container {--%>
<%--            max-width: 960px;--%>
<%--            margin: 2rem auto;--%>
<%--            padding: 2rem;--%>
<%--            background: #fff;--%>
<%--            border: 1px solid #ddd;--%>
<%--            border-radius: 8px;--%>
<%--        }--%>
<%--        .image-gallery {--%>
<%--            display: grid;--%>
<%--            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));--%>
<%--            gap: 1rem;--%>
<%--            margin-bottom: 2rem;--%>
<%--        }--%>
<%--        .image-gallery img {--%>
<%--            width: 100%;--%>
<%--            height: auto;--%>
<%--            border-radius: 5px;--%>
<%--        }--%>
<%--        .house-info h1 {--%>
<%--            color: #333;--%>
<%--        }--%>
<%--        .house-info .price {--%>
<%--            font-size: 2rem;--%>
<%--            color: #e63946;--%>
<%--            margin-bottom: 1rem;--%>
<%--        }--%>
<%--        .house-specs {--%>
<%--            margin: 1rem 0;--%>
<%--            padding: 1rem;--%>
<%--            background-color: #f8f9fa;--%>
<%--            border-left: 4px solid #007bff;--%>
<%--        }--%>
<%--        .back-link {--%>
<%--            display: inline-block;--%>
<%--            margin-bottom: 1rem;--%>
<%--            text-decoration: none;--%>
<%--            color: #007bff;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="header">--%>
<%--    <div class="logo">房屋租赁系统</div>--%>
<%--    <div class="nav">--%>
<%--        <ul>--%>
<%--            <li><a href="${pageContext.request.contextPath}/">返回首页</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="detail-container">--%>
<%--    <a href="${pageContext.request.contextPath}/" class="back-link">&larr; 返回列表</a>--%>

<%--    <c:if test="${not empty house}">--%>
<%--        &lt;%&ndash; 将逗号分隔的图片路径字符串分割成一个数组 &ndash;%&gt;--%>
<%--        <c:set var="imagePaths" value="${fn:split(house.imagePaths, ',')}" />--%>

<%--        <div class="image-gallery">--%>
<%--            <c:forEach var="imgPath" items="${imagePaths}">--%>
<%--                <c:if test="${not empty imgPath}">--%>
<%--                    <img src="${pageContext.request.contextPath}/${imgPath}" alt="房源图片: ${house.title}">--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>

<%--        <div class="house-info">--%>
<%--            <h1>${house.title}</h1>--%>
<%--            <div class="price">--%>
<%--                <fmt:formatNumber value="${house.price}" type="currency" currencySymbol="¥"/>/月--%>
<%--            </div>--%>

<%--            <div class="house-specs">--%>
<%--                <p><strong>位置:</strong> ${fn:escapeXml(house.city)} - ${fn:escapeXml(house.address)}</p>--%>
<%--                <p><strong>户型:</strong> ${fn:escapeXml(house.houseType)} | ${house.bedrooms}室${house.bathrooms}卫 | <strong>面积:</strong> ${house.area} m²</p>--%>
<%--            </div>--%>

<%--            <h3>房源描述</h3>--%>
<%--            <p>${fn:escapeXml(house.description)}</p>--%>

<%--            <br/>--%>

<%--                &lt;%&ndash; 租赁按钮表单 &ndash;%&gt;--%>
<%--            <form action="${pageContext.request.contextPath}/rental/rent" method="post" style="text-align: right;">--%>
<%--                <input type="hidden" name="houseId" value="${house.id}">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${house.rented}">--%>
<%--                        <button type="button" disabled class="add-to-cart" style="background-color: #ccc;">已出租</button>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <button type="submit" class="add-to-cart" style="background-color: #28a745;">立即租赁</button>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </c:if>--%>

<%--    <c:if test="${empty house}">--%>
<%--        <p>抱歉，未找到该房源的详细信息。</p>--%>
<%--    </c:if>--%>

<%--</div>--%>

<%--<footer class="footer">--%>
<%--    <div class="footer-content">--%>
<%--        <p>&copy; 2025 房屋租赁系统. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>房源详情 - ${house.title}</title>
    <style>
        body { font-family: 'Segoe UI', 'Roboto', sans-serif; background-color: #f8f9fa; margin: 0; padding: 2em; color: #333; }
        .container { max-width: 960px; margin: auto; background: #fff; padding: 2em; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .back-link { display: inline-block; margin-bottom: 1.5em; color: #007bff; text-decoration: none; font-weight: 600; }
        .house-title h1 { font-size: 2.5em; margin: 0; color: #212529; }
        .house-title .address { font-size: 1.1em; color: #6c757d; margin-top: 0.5em; }
        .image-gallery { margin-top: 2em; }
        .main-image img { width: 100%; height: auto; border-radius: 8px; max-height: 500px; object-fit: cover; }
        .thumbnails { display: flex; gap: 10px; margin-top: 1em; }
        .thumbnails img { width: 100px; height: 75px; object-fit: cover; border-radius: 4px; cursor: pointer; border: 2px solid transparent; transition: border-color 0.3s; }
        .thumbnails img:hover, .thumbnails img.active { border-color: #007bff; }
        .house-info { display: flex; justify-content: space-between; align-items: center; margin-top: 2em; padding: 1.5em; background: #f8f9fa; border-radius: 8px; }
        .price { font-size: 2em; font-weight: bold; color: #dc3545; }
        .price span { font-size: 0.6em; color: #6c757d; font-weight: normal; }
        .rent-button { padding: 0.8em 1.5em; background-color: #28a745; color: white; text-decoration: none; border: none; font-family: 'Segoe UI', sans-serif; border-radius: 5px; font-size: 1.1em; font-weight: 600; transition: background-color 0.3s; cursor: pointer; }
        .rent-button:disabled { background-color: #6c757d; cursor: not-allowed; }
        .rent-button:hover:not(:disabled) { background-color: #218838; }
        .details-section { margin-top: 2em; line-height: 1.8; }
        .details-section h3 { border-bottom: 2px solid #eee; padding-bottom: 0.5em; margin-bottom: 1em; }
    </style>
</head>
<body>
<div class="container">
    <a href="javascript:history.back()" class="back-link">&larr; 返回上一页</a>

    <div class="house-title">
        <h1>${house.title}</h1>
        <p class="address">${house.city} - ${house.address}</p>
    </div>

    <c:set var="imagePaths" value="${fn:split(house.imagePaths, ',')}" />
    <c:if test="${not empty imagePaths and not empty imagePaths[0]}">
        <div class="image-gallery">
            <div class="main-image">
                <img id="mainImg" src="${pageContext.request.contextPath}/${imagePaths[0]}" alt="主图">
            </div>
            <c:if test="${fn:length(imagePaths) > 1}">
                <div class="thumbnails">
                    <c:forEach var="imgPath" items="${imagePaths}" varStatus="loop">
                        <img src="${pageContext.request.contextPath}/${imgPath}" alt="缩略图"
                             class="${loop.index == 0 ? 'active' : ''}"
                             onmouseover="changeImage('${pageContext.request.contextPath}/${imgPath}', this)">
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </c:if>

    <div class="house-info">
        <div>
            <span class="price">${house.price} <span>元/月</span></span>
        </div>
        <div>
            <form action="${pageContext.request.contextPath}/rental/rent" method="post" style="display: inline;">
                <input type="hidden" name="houseId" value="${house.id}">
                <button type="submit" class="rent-button" ${house.rented ? 'disabled' : ''}>
                    ${house.rented ? '已出租' : '立即租赁'}
                </button>
            </form>
        </div>
    </div>

    <div class="details-section">
        <h3>房源描述</h3>
        <p>${house.description}</p>
        <h3>基本信息</h3>
        <ul>
            <li><strong>户型:</strong> ${house.houseType}</li>
            <li><strong>卧室数量:</strong> ${house.bedrooms}</li>
            <li><strong>面积:</strong> ${house.area} 平方米</li>
            <li><strong>发布者:</strong> ${house.username}</li>
        </ul>
    </div>
</div>

<script>
    function changeImage(newSrc, element) {
        document.getElementById('mainImg').src = newSrc;
        const thumbnails = document.querySelectorAll('.thumbnails img');
        thumbnails.forEach(thumb => thumb.classList.remove('active'));
        element.classList.add('active');
    }
</script>
</body>
</html>