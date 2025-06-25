
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>搜索结果</title>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="header">--%>
<%--    <div class="logo">房屋租赁系统</div>--%>
<%--    <div class="nav">--%>
<%--        <ul>--%>
<%--            <li><a href="${pageContext.request.contextPath}/rental/index.jsp">返回首页</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="main-content">--%>
<%--    <h1>关于 “<c:out value="${searchQuery}"/>” 的搜索结果</h1>--%>

<%--    &lt;%&ndash; 在首页或者所有页面加上搜索框 &ndash;%&gt;--%>
<%--    <form action="${pageContext.request.contextPath}/search" method="get" style="text-align: center; margin: 20px;">--%>
<%--        <input type="text" name="location" value="${searchQuery}" placeholder="输入城市或地区搜索..." size="50">--%>
<%--        <button type="submit">重新搜索</button>--%>
<%--    </form>--%>

<%--    <c:if test="${empty searchResults}">--%>
<%--        <p style="text-align: center;">没有找到相关的房源。请尝试其他关键词。</p>--%>
<%--    </c:if>--%>

<%--    <div class="product-grid">--%>
<%--        <c:forEach var="house" items="${searchResults}">--%>
<%--            <div class="product-card">--%>
<%--                <h3><c:out value="${house.title}"/></h3>--%>
<%--                <p><strong>位置:</strong> <c:out value="${house.city}"/></p>--%>
<%--                <p class="price">￥${house.price}/月</p>--%>
<%--                <a href="#" class="add-to-cart">查看详情</a>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>“${fn:escapeXml(searchQuery)}”的搜索结果</title>

    <%-- 引入与您首页相同的字体和图标库，确保风格统一 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

    <%-- 【美化核心】从您漂亮的 index.jsp 中引入相同的 CSS 样式 --%>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans SC', sans-serif;
            background-color: #f8f9fa; /* 为页面添加一个统一的浅色背景 */
        }

        /* 导航栏样式 (保持不变) */
        .header { background-color: white; padding: 15px 30px; box-shadow: 0 2px 5px rgba(0,0,0,0.05); display: flex; justify-content: space-between; align-items: center; }
        .header .logo { font-weight: bold; font-size: 24px; color: #007bff; }
        .header .nav ul { list-style: none; margin: 0; padding: 0; }
        .header .nav ul li a { text-decoration: none; color: #333; font-weight: 500; }

        /* 主要内容区域 */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        /* 搜索结果标题和再次搜索的表单 */
        .search-header {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 40px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .search-header h1 {
            font-size: 24px;
            color: #333;
            margin: 0 0 20px 0;
        }
        .search-header .query {
            color: #007bff;
            font-weight: 700;
        }
        .search-form {
            display: flex;
            max-width: 600px;
            margin: 0 auto;
        }
        .search-form input {
            flex-grow: 1;
            padding: 12px 20px;
            border: 1px solid #ced4da;
            border-radius: 8px 0 0 8px;
            outline: none;
            font-size: 16px;
        }
        .search-form button {
            background: #007bff; color: white; border: none; padding: 0 25px;
            border-radius: 0 8px 8px 0; cursor: pointer; font-size: 16px;
            transition: background 0.3s;
        }
        .search-form button:hover { background: #0056b3; }

        /* 房源卡片网格布局 (采用您 index.jsp 的样式) */
        .apartments-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
        }
        .apartment-card {
            width: 320px; flex-shrink: 0; border: 1px solid #e9ecef; border-radius: 12px;
            overflow: hidden; display: flex; flex-direction: column;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            background-color: #fff;
        }
        .apartment-card:hover { transform: translateY(-8px); box-shadow: 0 10px 20px rgba(0, 123, 255, 0.1); border-color: #007bff; }
        .card-img-wrapper { height: 200px; position: relative; overflow: hidden; }
        .apartment-img { width: 100%; height: 100%; background-size: cover; background-position: center; transition: transform 0.4s ease; }
        .apartment-card:hover .apartment-img { transform: scale(1.05); }
        .apartment-info { padding: 20px; display: flex; flex-direction: column; flex-grow: 1; }
        .apartment-name { font-size: 18px; font-weight: 700; margin-bottom: 8px; color: #1d2d35; }
        .apartment-address { color: #6c757d; font-size: 14px; margin-bottom: 15px; display: flex; align-items: center; gap: 8px; }
        .apartment-specs { color: #495057; font-size: 14px; margin-bottom: 20px; display: flex; flex-wrap: wrap; gap: 15px; border-top: 1px solid #e9ecef; padding-top: 15px; }
        .apartment-specs span { display: flex; align-items: center; gap: 6px; }
        .price-and-button-wrapper { margin-top: auto; padding-top: 10px; }
        .apartment-price { color: #007bff; font-weight: 700; font-size: 24px; margin-bottom: 15px; }
        .apartment-price span { font-size: 14px; font-weight: 400; color: #6c757d; margin-left: 4px; }
        .view-details-button { width: 100%; background: #007bff; color: white; border: none; padding: 12px 20px; border-radius: 8px; font-size: 16px; font-weight: 500; cursor: pointer; transition: background 0.3s; text-align: center; }
        .view-details-button:hover { background: #0056b3; }
        .apartment-card-link { text-decoration: none; color: inherit; display: flex; flex-direction: column; height: 100%; }
    </style>
</head>
<body>

<%-- 导航栏部分保持不变 --%>
<div class="header">
    <div class="logo">房屋租赁系统</div>
    <div class="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/">返回首页</a></li>
        </ul>
    </div>
</div>

<%-- 【美化部分开始】 --%>
<div class="container">

    <%-- 重新设计的搜索标题和再次搜索框 --%>
    <div class="search-header">
        <h1>关于“<span class="query"><c:out value="${searchQuery}"/></span>”的搜索结果</h1>
        <form action="${pageContext.request.contextPath}/search" method="get" class="search-form">
            <input type="text" name="location" value="<c:out value="${searchQuery}"/>" placeholder="输入城市或地区搜索...">
            <button type="submit">重新搜索</button>
        </form>
    </div>

    <c:if test="${empty searchResults}">
        <p style="text-align: center; padding: 40px; font-size: 18px; color: #6c757d;">没有找到相关的房源。请尝试其他关键词。</p>
    </c:if>

    <%-- 使用和首页一致的卡片网格布局来展示房源 --%>
    <div class="apartments-grid">
        <%-- 注意 items 的值是 searchResults, 与 SearchHouseServlet 中 setAttribute 一致 --%>
        <c:forEach var="house" items="${searchResults}">
            <div class="apartment-card">
                    <%-- 【链接修正】将整个卡片包裹在链接中，指向正确的详情页 --%>
                <a href="${pageContext.request.contextPath}/rental/detail?id=${house.id}" class="apartment-card-link">
                    <div class="card-img-wrapper">
                        <c:set var="imagePath" value="images/default-house.png" />
                        <c:if test="${not empty house.imagePaths}">
                            <c:set var="images" value="${fn:split(house.imagePaths, ',')}" />
                            <c:set var="imagePath" value="${images[0]}" />
                        </c:if>
                        <div class="apartment-img" style="background-image: url('${pageContext.request.contextPath}/${imagePath}');"></div>
                    </div>

                    <div class="apartment-info">
                        <h3 class="apartment-name"><c:out value="${house.title}" /></h3>
                        <p class="apartment-address">
                            <i class="fas fa-map-marker-alt"></i> <c:out value="${house.city}"/>, <c:out value="${house.address}"/>
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
                            <div class="view-details-button">
                                查看详情
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<%-- 【美化部分结束】 --%>

</body>
</html>