
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="zh-CN">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>房源综合管理</title>--%>

<%--    &lt;%&ndash; 引入公共资源 &ndash;%&gt;--%>
<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@300;400;500&display=swap" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">--%>


<%--    <style>--%>
<%--        /* --- 全局和公共样式优化 --- */--%>
<%--        * {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            box-sizing: border-box;--%>
<%--            font-family: 'Noto Sans SC', sans-serif;--%>
<%--        }--%>

<%--        body {--%>
<%--            background-color: #f8f9fa;--%>
<%--            color: #343a40;--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--            min-height: 100vh;--%>
<%--            line-height: 1.6;--%>
<%--        }--%>

<%--        .top-nav {--%>
<%--            background-color: white;--%>
<%--            padding: 15px 5%;--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>
<%--            box-shadow: 0 2px 10px rgba(0,0,0,0.08);--%>
<%--            position: sticky;--%>
<%--            top: 0;--%>
<%--            z-index: 100;--%>
<%--        }--%>

<%--        /* --- 主要内容区域加宽 --- */--%>
<%--        .admin-container {--%>
<%--            max-width: 1600px;--%>
<%--            width: 95%;--%>
<%--            margin: 2rem auto;--%>
<%--            padding: 0 1rem;--%>
<%--        }--%>

<%--        /* --- 租房信息横向布局优化 --- */--%>
<%--        .house-grid {--%>
<%--            display: grid;--%>
<%--            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));--%>
<%--            gap: 1.5rem;--%>
<%--        }--%>

<%--        /* --- 在 <style> 内添加这段代码 --- */--%>

<%--        .house-card {--%>
<%--            background-color: #ffffff;--%>
<%--            border: 1px solid #e0e0e0;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 2px 8px rgba(0,0,0,0.06);--%>
<%--            overflow: hidden;--%>

<%--            /* 关键：将卡片内部设置为Flex布局，方向为垂直 */--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>

<%--            /* 关键：为卡片内的绝对定位元素(如状态标签)提供定位参考 */--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .nav-left, .nav-right {--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            gap: 25px;--%>
<%--        }--%>

<%--        .logo {--%>
<%--            font-size: 24px;--%>
<%--            font-weight: 600;--%>
<%--            color: #0066ff;--%>
<%--            text-decoration: none;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--        }--%>

<%--        .logo i {--%>
<%--            margin-right: 8px;--%>
<%--            font-size: 22px;--%>
<%--        }--%>

<%--        .nav-link {--%>
<%--            color: #555;--%>
<%--            text-decoration: none;--%>
<%--            font-size: 15px;--%>
<%--            padding: 8px 12px;--%>
<%--            border-radius: 4px;--%>
<%--            transition: all 0.3s ease;--%>
<%--        }--%>

<%--        .page-title {--%>
<%--            font-size: 2rem;--%>
<%--            font-weight: 500;--%>
<%--            margin-bottom: 2rem;--%>
<%--            text-align: center;--%>
<%--            position: relative;--%>
<%--            color: #2c3e50;--%>
<%--        }--%>

<%--        .tabs {--%>
<%--            display: flex;--%>
<%--            border-bottom: 2px solid #e9ecef;--%>
<%--            margin-bottom: 2.5rem;--%>
<%--            position: relative;--%>
<%--            justify-content: center;--%>
<%--        }--%>

<%--        .tab-button {--%>
<%--            padding: 1rem 1.8rem;--%>
<%--            cursor: pointer;--%>
<%--            border: none;--%>
<%--            background: none;--%>
<%--            font-size: 1.1rem;--%>
<%--            font-weight: 500;--%>
<%--            color: #888;--%>
<%--            position: relative;--%>
<%--            transition: all 0.3s ease;--%>
<%--            border-radius: 8px 8px 0 0;--%>
<%--            margin: 0 5px;--%>
<%--        }--%>

<%--        .card-image-wrapper {--%>
<%--            width: 100%;--%>
<%--            height: 200px;--%>
<%--            position: relative;--%>
<%--            overflow: hidden;--%>
<%--        }--%>

<%--        .card-image {--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            object-fit: cover;--%>
<%--            transition: transform 0.5s ease;--%>
<%--        }--%>

<%--        .card-content {--%>
<%--            padding: 1.5rem;--%>
<%--            flex-grow: 1;--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--        }--%>

<%--        .card-title {--%>
<%--            font-size: 1.25rem;--%>
<%--            margin-bottom: 0.8rem;--%>
<%--            color: #2c3e50;--%>
<%--            font-weight: 600;--%>
<%--        }--%>

<%--        .card-status {--%>
<%--            position: absolute;--%>
<%--            top: 15px;--%>
<%--            right: 15px;--%>
<%--            padding: 6px 14px;--%>
<%--            border-radius: 20px;--%>
<%--            font-size: 0.8rem;--%>
<%--            font-weight: 500;--%>
<%--            color: white;--%>
<%--            z-index: 2;--%>
<%--            box-shadow: 0 2px 8px rgba(0,0,0,0.15);--%>
<%--        }--%>

<%--        .status-rented {--%>
<%--            background-color: #dc3545;--%>
<%--        }--%>

<%--        .status-available {--%>
<%--            background-color: #28a745;--%>
<%--        }--%>

<%--        .data-table {--%>
<%--            width: 100%;--%>
<%--            border-collapse: collapse;--%>
<%--            background: white;--%>
<%--            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);--%>
<%--            border-radius: 12px;--%>
<%--            overflow: hidden;--%>
<%--        }--%>

<%--        .data-table th, .data-table td {--%>
<%--            padding: 1rem;--%>
<%--            border-bottom: 1px solid #e9ecef;--%>
<%--            text-align: left;--%>
<%--        }--%>

<%--        /* --- 新页脚样式 --- */--%>
<%--        footer {--%>
<%--            background: linear-gradient(to right, #2c3e50, #1a252f);--%>
<%--            color: #ecf0f1;--%>
<%--            padding: 60px 0 30px;--%>
<%--            margin-top: auto;--%>
<%--        }--%>

<%--        .footer-container {--%>
<%--            max-width: 1200px;--%>
<%--            margin: 0 auto;--%>
<%--            padding: 0 20px;--%>
<%--            display: grid;--%>
<%--            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));--%>
<%--            gap: 30px;--%>
<%--        }--%>

<%--        .footer-column {--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--        }--%>

<%--        .footer-column h3 {--%>
<%--            font-size: 1.2rem;--%>
<%--            font-weight: 600;--%>
<%--            margin-bottom: 18px;--%>
<%--            padding-bottom: 12px;--%>
<%--            border-bottom: 2px solid #4a6587;--%>
<%--            color: #70a1ff;--%>
<%--        }--%>

<%--        .footer-column ul {--%>
<%--            list-style: none;--%>
<%--        }--%>

<%--        .footer-column ul li {--%>
<%--            margin-bottom: 12px;--%>
<%--        }--%>

<%--        .footer-column ul li a {--%>
<%--            color: #bdc3c7;--%>
<%--            text-decoration: none;--%>
<%--            transition: all 0.3s ease;--%>
<%--            display: block;--%>
<%--            padding: 4px 0;--%>
<%--        }--%>

<%--        .footer-column ul li a:hover {--%>
<%--            color: #70a1ff;--%>
<%--            transform: translateX(5px);--%>
<%--        }--%>

<%--        .social-links {--%>
<%--            display: flex;--%>
<%--            gap: 18px;--%>
<%--            margin-top: 15px;--%>
<%--        }--%>

<%--        .social-links a {--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            width: 40px;--%>
<%--            height: 40px;--%>
<%--            background-color: rgba(255, 255, 255, 0.1);--%>
<%--            border-radius: 50%;--%>
<%--            color: #ecf0f1;--%>
<%--            font-size: 18px;--%>
<%--            transition: all 0.3s ease;--%>
<%--        }--%>

<%--        .social-links a:hover {--%>
<%--            background-color: #70a1ff;--%>
<%--            transform: translateY(-3px);--%>
<%--        }--%>

<%--        .newsletter-text {--%>
<%--            margin: 15px 0;--%>
<%--            color: #95a5a6;--%>
<%--            font-size: 0.95rem;--%>
<%--            line-height: 1.5;--%>
<%--        }--%>

<%--        .copyright {--%>
<%--            text-align: center;--%>
<%--            padding-top: 30px;--%>
<%--            margin-top: 30px;--%>
<%--            border-top: 1px solid #34495e;--%>
<%--            color: #7f8c8d;--%>
<%--            font-size: 0.9rem;--%>
<%--        }--%>

<%--        /* --- 响应式设计优化 --- */--%>
<%--        @media (min-width: 1800px) {--%>
<%--            .house-grid {--%>
<%--                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));--%>
<%--            }--%>
<%--        }--%>

<%--        @media (min-width: 1400px) {--%>
<%--            .admin-container {--%>
<%--                padding: 0 3%;--%>
<%--            }--%>

<%--            .house-grid {--%>
<%--                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));--%>
<%--                gap: 1.8rem;--%>
<%--            }--%>
<%--        }--%>

<%--        @media (max-width: 1399px) and (min-width: 992px) {--%>
<%--            .admin-container {--%>
<%--                max-width: 1300px;--%>
<%--            }--%>

<%--            .house-grid {--%>
<%--                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));--%>
<%--            }--%>
<%--        }--%>

<%--        @media (max-width: 991px) {--%>
<%--            .admin-container {--%>
<%--                max-width: 100%;--%>
<%--                padding: 0 1rem;--%>
<%--            }--%>

<%--            .footer-container {--%>
<%--                grid-template-columns: repeat(2, 1fr);--%>
<%--            }--%>
<%--        }--%>

<%--        @media (max-width: 576px) {--%>
<%--            .footer-container {--%>
<%--                grid-template-columns: 1fr;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--&lt;%&ndash; 1. 公共页头 HTML &ndash;%&gt;--%>
<%--<nav class="top-nav">--%>
<%--    <div class="nav-left">--%>
<%--        <span class="language-selector">中文</span>--%>
<%--        <a href="${pageContext.request.contextPath}/" class="logo">公寓租房网</a>--%>
<%--    </div>--%>
<%--    <div class="nav-right">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${not empty sessionScope.currentUser}">--%>
<%--                <span>欢迎, <c:out value="${sessionScope.currentUser.username}"/>!</span>--%>
<%--                <c:if test="${sessionScope.currentUser.username == 'admin'}">--%>
<%--                    <a href="${pageContext.request.contextPath}/admin/manage" class="nav-link">管理中心</a>--%>
<%--                </c:if>--%>
<%--                <a href="${pageContext.request.contextPath}/logout" class="nav-link">退出登录</a>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">登录/注册</a>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--        <a href="${pageContext.request.contextPath}/rental/post-house.jsp" class="nav-link">发布房源</a>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--&lt;%&ndash; 2. 页面核心内容 HTML &ndash;%&gt;--%>
<%--<main class="admin-container">--%>
<%--    <h1 class="page-title">管理仪表盘</h1>--%>

<%--    <div class="tabs">--%>
<%--        <button class="tab-button" onclick="openTab(event, 'all-houses')">全部房源</button>--%>
<%--        <button class="tab-button" onclick="openTab(event, 'rented-records')">已租记录</button>--%>
<%--    </div>--%>

<%--    <div id="all-houses" class="tab-content">--%>
<%--        <div class="house-grid">--%>
<%--            <c:forEach var="house" items="${houseList}">--%>
<%--                <div class="house-card">--%>

<%--                    <c:if test="${house.rented}"><span class="card-status status-rented">已租</span></c:if>--%>
<%--                    <c:if test="${not house.rented}"><span class="card-status status-available">可租</span></c:if>--%>
<%--                    <div class="card-image-wrapper">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${not empty house.imagePaths}">--%>
<%--                                <c:set var="images" value="${fn:split(house.imagePaths, ',')}" />--%>
<%--                                <img src="${pageContext.request.contextPath}/${images[0]}" alt="${house.title}" class="card-image">--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise><span style="color: #aaa;">暂无图片</span></c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </div>--%>
<%--                    <div class="card-content">--%>
<%--                        <h3 class="card-title"><c:out value="${house.title}"/></h3>--%>
<%--                        <a href="${pageContext.request.contextPath}/admin/manage?action=delete&id=${house.id}" onclick="return confirm('确认删除？')">删除</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div id="rented-records" class="tab-content">--%>
<%--        <table class="data-table">--%>
<%--            <thead>--%>
<%--            <tr><th>房源标题</th><th>月租价格</th><th>承租人</th><th>承租人邮箱</th><th>租赁日期</th></tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:forEach var="rental" items="${rentalList}">--%>
<%--                <tr>--%>
<%--                    <td><c:out value="${rental.house.title}" /></td>--%>
<%--                    <td>￥${rental.house.price}</td>--%>
<%--                    <td><c:out value="${rental.user.username}" /></td>--%>
<%--                    <td><c:out value="${rental.user.email}" /></td>--%>
<%--                    <td><fmt:formatDate value="${rental.rentalDate}" pattern="yyyy-MM-dd HH:mm" /></td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--            <c:if test="${empty rentalList}">--%>
<%--                <tr><td colspan="5" style="text-align: center;">暂无租赁记录。</td></tr>--%>
<%--            </c:if>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</main>--%>

<%--&lt;%&ndash; 3. 页面独有的JavaScript &ndash;%&gt;--%>
<%--<script>--%>
<%--    function openTab(evt, tabName) {--%>
<%--        const tabcontent = document.getElementsByClassName("tab-content");--%>
<%--        for (let i = 0; i < tabcontent.length; i++) { tabcontent[i].style.display = "none"; }--%>
<%--        const tablinks = document.getElementsByClassName("tab-button");--%>
<%--        for (let i = 0; i < tablinks.length; i++) { tablinks[i].className = tablinks[i].className.replace(" active", ""); }--%>
<%--        document.getElementById(tabName).style.display = "block";--%>
<%--        evt.currentTarget.className += " active";--%>
<%--    }--%>
<%--    document.addEventListener("DOMContentLoaded", function() {--%>
<%--        const firstTab = document.querySelector(".tab-button");--%>
<%--        if (firstTab) { firstTab.click(); }--%>
<%--    });--%>
<%--</script>--%>

<%--<footer>--%>
<%--    <div class="footer-container">--%>
<%--        <div class="footer-column">--%>
<%--            <h3>关于我们</h3>--%>
<%--            <ul>--%>
<%--                <li><a href="#">公司简介</a></li>--%>
<%--                <li><a href="#">团队介绍</a></li>--%>
<%--                <li><a href="#">加入我们</a></li>--%>
<%--                <li><a href="#">新闻中心</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--        <div class="footer-column">--%>
<%--            <h3>帮助中心</h3>--%>
<%--            <ul>--%>
<%--                <li><a href="#">常见问题</a></li>--%>
<%--                <li><a href="#">租房指南</a></li>--%>
<%--                <li><a href="#">房东指南</a></li>--%>
<%--                <li><a href="#">联系我们</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--        <div class="footer-column">--%>
<%--            <h3>服务条款</h3>--%>
<%--            <ul>--%>
<%--                <li><a href="#">用户协议</a></li>--%>
<%--                <li><a href="#">隐私政策</a></li>--%>
<%--                <li><a href="#">免责声明</a></li>--%>
<%--                <li><a href="#">投诉建议</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--        <div class="footer-column">--%>
<%--            <h3>关注我们</h3>--%>
<%--            <p class="newsletter-text">订阅我们的新闻通讯，获取最新房源信息</p>--%>

<%--            <div class="social-links">--%>
<%--                <a href="#"><i class="fab fa-weixin"></i></a>--%>
<%--                <a href="#"><i class="fab fa-weibo"></i></a>--%>
<%--                <a href="#"><i class="fab fa-qq"></i></a>--%>
<%--                <a href="#"><i class="fab fa-tiktok"></i></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="copyright">--%>
<%--        <p>&copy; 2025 公寓租房网 版权所有 | 京ICP备12345678号</p>--%>
<%--    </div>--%>
<%--</footer>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>房源综合管理</title>

    <%-- 引入公共资源 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">


    <style>
        /* --- 全局和公共样式优化 --- */
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Noto Sans SC', sans-serif; }
        body { background-color: #f8f9fa; color: #343a40; display: flex; flex-direction: column; min-height: 100vh; line-height: 1.6; }
        .top-nav { background-color: white; padding: 15px 5%; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.08); position: sticky; top: 0; z-index: 100; }
        .admin-container { max-width: 1600px; width: 95%; margin: 2rem auto; padding: 0 1rem; }
        .house-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1.8rem; } /* 增加了卡片间距 */

        .house-card {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 12px; /* 增加圆角大小 */
            box-shadow: 0 4px 12px rgba(0,0,0,0.07); /* 优化阴影 */
            overflow: hidden;
            display: flex;
            flex-direction: column;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .house-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .nav-left, .nav-right { display: flex; align-items: center; gap: 25px; }
        .logo { font-size: 24px; font-weight: 600; color: #0066ff; text-decoration: none; display: flex; align-items: center; }
        .logo i { margin-right: 8px; font-size: 22px; }
        .nav-link { color: #555; text-decoration: none; font-size: 15px; padding: 8px 12px; border-radius: 4px; transition: all 0.3s ease; }
        .page-title { font-size: 2rem; font-weight: 500; margin-bottom: 2rem; text-align: center; position: relative; color: #2c3e50; }
        .tabs { display: flex; border-bottom: 2px solid #e9ecef; margin-bottom: 2.5rem; position: relative; justify-content: center; }
        .tab-button { padding: 1rem 1.8rem; cursor: pointer; border: none; background: none; font-size: 1.1rem; font-weight: 500; color: #888; position: relative; transition: all 0.3s ease; border-radius: 8px 8px 0 0; margin: 0 5px; }
        .tab-button.active { color: #0066ff; } /* 激活状态的标签页按钮 */
        .tab-button.active::after { /* 激活状态的下划线 */
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: #0066ff;
            border-radius: 3px;
        }

        .card-image-wrapper { width: 100%; height: 200px; position: relative; overflow: hidden; }
        .card-image { width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease; }

        .card-content {
            padding: 1.2rem; /* 调整内边距 */
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .card-title {
            font-size: 1.2rem; /* 调整字体大小 */
            color: #2c3e50;
            font-weight: 600;
            /* 【新增】为了让标题在多行时也能对齐，采用flex布局 */
            flex-grow: 1;
            margin-bottom: 1rem;
        }

        /* 【新增】包裹图片和标题的链接样式 */
        .details-link {
            text-decoration: none;
            color: inherit;
        }
        .details-link:hover .card-image {
            transform: scale(1.05); /* 鼠标悬浮在链接上时图片放大 */
        }
        .details-link:hover .card-title {
            color: #0066ff; /* 鼠标悬浮在链接上时标题变色 */
        }

        .card-status { position: absolute; top: 15px; right: 15px; padding: 6px 14px; border-radius: 20px; font-size: 0.8rem; font-weight: 500; color: white; z-index: 2; box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
        .status-rented { background-color: #6c757d; } /* 已租改为灰色，更柔和 */
        .status-available { background-color: #28a745; }

        /* 【新增】卡片底部操作按钮区域的样式 */
        .card-actions {
            display: flex;
            justify-content: flex-end; /* 让按钮靠右对齐 */
            padding-top: 1rem;
            border-top: 1px solid #f0f0f0;
            margin-top: auto; /* 将操作区推到卡片底部 */
        }

        /* 【新增】删除按钮的统一样式 */
        .delete-btn {
            background-color: #ffeef0;
            color: #dc3545;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px; /* 图标和文字的间距 */
            transition: all 0.3s ease;
        }
        .delete-btn:hover {
            background-color: #dc3545;
            color: white;
            box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
        }

        /* 已租记录表格样式 */
        .data-table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08); border-radius: 12px; overflow: hidden; }
        .data-table th, .data-table td { padding: 1rem; border-bottom: 1px solid #e9ecef; text-align: left; }
        .data-table th { background-color: #f8f9fa; font-weight: 600; }
        .data-table tr:last-child td { border-bottom: none; }
        .data-table tr:hover { background-color: #f1f3f5; }

        .tab-content { display: none; } /* 默认隐藏所有标签页内容 */
    </style>
</head>
<body>

<%-- 页头导航栏 (保持不变) --%>
<nav class="top-nav">
    <div class="nav-left">
        <span class="language-selector">中文</span>
        <a href="${pageContext.request.contextPath}/" class="logo">公寓租房网</a>
    </div>
    <div class="nav-right">
        <c:choose>
            <c:when test="${not empty sessionScope.currentUser}">
                <span>欢迎, <c:out value="${sessionScope.currentUser.username}"/>!</span>
                <c:if test="${sessionScope.currentUser.username == 'admin'}">
                    <a href="${pageContext.request.contextPath}/admin/manage" class="nav-link">管理中心</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/logout" class="nav-link">退出登录</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">登录/注册</a>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/rental/post-house.jsp" class="nav-link">发布房源</a>
    </div>
</nav>

<main class="admin-container">
    <h1 class="page-title">管理仪表盘</h1>

    <div class="tabs">
        <button class="tab-button" onclick="openTab(event, 'all-houses')">全部房源</button>
        <button class="tab-button" onclick="openTab(event, 'rented-records')">已租记录</button>
    </div>

    <%-- “全部房源”标签页 --%>
    <div id="all-houses" class="tab-content">
        <div class="house-grid">
            <c:forEach var="house" items="${houseList}">
                <div class="house-card">
                        <%-- 【修改一】将图片包裹在链接中，指向详情页，并在新标签页打开 --%>
                    <a href="${pageContext.request.contextPath}/rental/detail?id=${house.id}" target="_blank" class="details-link">
                        <div class="card-image-wrapper">
                            <c:if test="${house.rented}"><span class="card-status status-rented">已租</span></c:if>
                            <c:if test="${not house.rented}"><span class="card-status status-available">可租</span></c:if>

                            <c:choose>
                                <c:when test="${not empty house.imagePaths}">
                                    <c:set var="images" value="${fn:split(house.imagePaths, ',')}" />
                                    <img src="${pageContext.request.contextPath}/${images[0]}" alt="${house.title}" class="card-image">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/images/default-house.png" alt="暂无图片" class="card-image">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </a>

                    <div class="card-content">
                            <%-- 【修改二】将标题也包裹在同一个链接中 --%>
                        <a href="${pageContext.request.contextPath}/rental/detail?id=${house.id}" target="_blank" class="details-link">
                            <h3 class="card-title"><c:out value="${house.title}"/></h3>
                        </a>

                            <%-- 【修改三】美化删除按钮，并将其放入一个标准的操作区 --%>
                        <div class="card-actions">
                            <a href="${pageContext.request.contextPath}/admin/manage?action=delete&id=${house.id}"
                               class="delete-btn"
                               onclick="return confirm('您确定要永久删除房源《${fn:escapeXml(house.title)}》吗？此操作不可恢复！')">
                                <i class="fas fa-trash-alt"></i>
                                <span>删除</span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- “已租记录”标签页 (保持不变) --%>
    <div id="rented-records" class="tab-content">
        <table class="data-table">
            <thead>
            <tr><th>房源标题</th><th>月租价格</th><th>承租人</th><th>承租人邮箱</th><th>租赁日期</th></tr>
            </thead>
            <tbody>
            <c:forEach var="rental" items="${rentalList}">
                <tr>
                    <td><c:out value="${rental.house.title}" /></td>
                    <td>￥<fmt:formatNumber value="${rental.house.price}" minFractionDigits="2" maxFractionDigits="2"/></td>
                    <td><c:out value="${rental.user.username}" /></td>
                    <td><c:out value="${rental.user.email}" /></td>
                    <td><fmt:formatDate value="${rental.rentalDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                </tr>
            </c:forEach>
            <c:if test="${empty rentalList}">
                <tr><td colspan="5" style="text-align: center;">暂无租赁记录。</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</main>

<script>
    function openTab(evt, tabName) {
        let i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tab-content");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tab-button");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // 页面加载后自动点击第一个标签页
    document.addEventListener("DOMContentLoaded", function() {
        const firstTab = document.querySelector(".tab-button");
        if (firstTab) {
            firstTab.click();
        }
    });
</script>

<%-- 页脚部分可以根据需要添加或移除 --%>

</body>
</html>
