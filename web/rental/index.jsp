
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 <%@ include file="/jspf/header.jspf" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公寓租房网 - 发现您的新家</title>

    <%-- 引入公共字体和图标库 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

    <style>
        /* --- 全局样式 --- */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans SC', sans-serif;
            background-color: #ffffff;
            color: #1d2d35;
        }

        /* --- 顶部横幅 --- */
        .hero {
            height: 500px;
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url('${pageContext.request.contextPath}/images/pexels-pixabay-271624.jpg') center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 0 20px;
        }
        .hero-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }
        .hero-subtitle {
            font-size: 18px;
            margin-bottom: 30px;
            max-width: 600px;
            line-height: 1.6;
        }
        .hero-search-form {
            display: flex;
            width: 100%;
            max-width: 650px;
            background-color: white;
            border-radius: 50px;
            padding: 8px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        .hero-search-form input {
            flex-grow: 1;
            padding: 12px 25px;
            border: none;
            outline: none;
            font-size: 16px;
            background: transparent;
            color: #333;
        }
        .hero-search-form button {
            background: #007bff;
            color: white;
            border: none;
            border-radius: 50px;
            padding: 0 30px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background 0.3s;
        }
        .hero-search-form button:hover {
            background: #0056b3;
        }

        /* --- 主要内容容器 --- */
        .container {
            max-width: 1200px;
            margin: 60px auto;
            padding: 0 20px;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .section-title {
            font-size: 26px;
            font-weight: 700;
            color: #1d2d35;
            position: relative;
            padding-left: 15px;
        }
        /* 标题前的蓝色竖线装饰 */
        .section-title::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 5px;
            height: 28px;
            background-color: #007bff;
            border-radius: 3px;
        }
        .view-all-link {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
        }
        .view-all-link:hover {
            text-decoration: underline;
        }

        /* --- 房源卡片网格布局 --- */

        .apartments-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 40px; /* 增加间距 */
            justify-content: center; /* 居中显示 */
        }
        .apartment-card {
            width: 320px; /* 固定宽度使布局整齐 */
            flex-shrink: 0;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .apartment-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 20px rgba(0, 123, 255, 0.1);
            border-color: #007bff;
        }
        .card-img-wrapper {
            height: 200px;
            position: relative;
            overflow: hidden;
        }
        .apartment-img {
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            transition: transform 0.4s ease;
        }
        .apartment-card:hover .apartment-img {
            transform: scale(1.05);
        }
        .status-tag {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: rgba(0, 123, 255, 0.9);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
            backdrop-filter: blur(5px);
        }
        .apartment-info {
            padding: 20px;
            display: flex;
            flex-direction: column;
            flex-grow: 1; /* 让内容区占据剩余空间 */
        }
        .apartment-name {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 8px;
            color: #1d2d35;
        }
        .apartment-address {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .apartment-specs {
            color: #495057;
            font-size: 14px;
            margin-bottom: 20px;
            display: flex;
            flex-wrap: wrap; /* 允许换行 */
            gap: 15px;
            border-top: 1px solid #e9ecef;
            padding-top: 15px;
        }
        .apartment-specs span {
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .price-and-button-wrapper {
            margin-top: auto; /* 将价格和按钮推到底部 */
            padding-top: 10px;
        }
        .apartment-price {
            color: #007bff;
            font-weight: 700;
            font-size: 24px;
            margin-bottom: 15px;
        }
        .apartment-price span {
            font-size: 14px;
            font-weight: 400;
            color: #6c757d;
            margin-left: 4px;
        }
        .rent-button {
            width: 100%;
            background: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
        }
        .rent-button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<section class="hero">
    <h1 class="hero-title">发现您的新家</h1>
    <p class="hero-subtitle">我们致力于为您提供最舒适、便捷的居住体验，轻松找到理想住所。</p>
    <form action="${pageContext.request.contextPath}/search" method="get" class="hero-search-form">
        <input type="text" name="location" placeholder="输入城市、区域或小区开始搜索...">
        <button type="submit">
            <i class="fas fa-search"></i>
            <span>搜索</span>
        </button>
    </form>
</section>

<main class="container">
    <div class="section-header">
        <h2 class="section-title">探索可租赁的优质房源</h2>
        <a href="#" class="view-all-link">查看全部 →</a>
    </div>

    <div class="apartments-grid">
        <c:if test="${empty availableHouseList}">
            <p style="width: 100%; text-align: center; padding: 50px 0; color: #6c757d;">抱歉，当前没有可供租赁的房源。</p>
        </c:if>

        <c:forEach var="house" items="${availableHouseList}">
            <div class="apartment-card">
                <div class="card-img-wrapper">
                        <%-- 设置默认图片，并在有图片时替换 --%>
                    <c:set var="imagePath" value="images/default-house.png" />
                    <c:if test="${not empty house.imagePaths}">
                        <c:set var="images" value="${fn:split(house.imagePaths, ',')}" />
                        <c:set var="imagePath" value="${images[0]}" />
                    </c:if>

                        <%-- 【关键修改】在这里为图片套上正确的链接 --%>
                    <a href="${pageContext.request.contextPath}/rental/detail?id=${house.id}">
                        <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/${imagePath}');"></div>
                    </a>

                    <div class="status-tag">可租赁</div>
                </div>

                <div class="apartment-info">
                    <h3 class="apartment-name"><c:out value="${house.title}" /></h3>
                    <p class="apartment-address">
                        <i class="fas fa-map-marker-alt"></i>
                        <c:out value="${house.city}, ${house.address}"/>
                    </p>
                    <div class="apartment-specs">
                        <span><i class="fas fa-bed"></i> ${house.bedrooms}室</span>
                        <span><i class="fas fa-bath"></i> ${house.bathrooms}卫</span>
                        <span><i class="fas fa-ruler-combined"></i> ${house.area} m²</span>
                    </div>
                    <div class="price-and-button-wrapper">
                        <p class="apartment-price">
                            ￥${house.price}<span>/月</span>
                        </p>
                        <form class="rent-form" action="${pageContext.request.contextPath}/rental/rent" method="post">
                            <input type="hidden" name="houseId" value="${house.id}">
                            <button type="submit" class="rent-button" onclick="return confirm('您确定要租赁《${fn:escapeXml(house.title)}》吗？');">
                                立即租赁
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

 <%@ include file="/jspf/footer.jspf" %>

</body>
</html>


