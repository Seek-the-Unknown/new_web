<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>发布新房源</title>
    <%-- 引入与您项目风格一致的字体和图标库 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

    <style>
        /* --- 页面基础和布局样式 --- */
        body {
            background-color: #f8f9fa;
            font-family: 'Noto Sans SC', sans-serif;
        }

        .post-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }

        /* --- 未登录提示信息样式 --- */
        .login-prompt {
            text-align: center;
            padding: 40px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .login-prompt h2 {
            font-size: 1.5rem;
            color: #333;
            margin: 0;
        }
        .login-prompt a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }
        .login-prompt a:hover {
            text-decoration: underline;
        }

        /* --- 表单卡片样式 --- */
        .form-card {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.08);
        }
        .form-card h1 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 2.5rem;
            color: #2c3e50;
        }

        /* --- 表单组和元素样式 --- */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        /* --- 用于并排布局的网格 --- */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        /* --- 美化文件上传按钮 --- */
        .file-upload-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            border: 1px dashed #007bff;
            padding: 2rem;
            border-radius: 8px;
            text-align: center;
            width: 100%;
            background-color: #f8f9fa;
        }
        .file-upload-wrapper input[type="file"] {
            display: none; /* 隐藏原生按钮 */
        }
        .file-upload-label {
            color: #007bff;
            cursor: pointer;
            font-weight: 500;
        }
        .file-upload-label i {
            margin-right: 8px;
        }

        /* --- 提交按钮样式 --- */
        .submit-btn {
            width: 100%;
            padding: 15px;
            font-size: 1.1rem;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(to right, #007bff, #0056b3);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .submit-btn:hover {
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
            transform: translateY(-2px);
        }

    </style>
</head>
<body>

<%-- 页头保持不变 --%>
<%@ include file="/jspf/header.jspf" %>

<%-- 【优化内容开始】 --%>
<div class="post-container">
    <%-- 场景一：用户未登录 --%>
    <c:if test="${empty sessionScope.currentUser}">
        <div class="login-prompt">
            <h2><i class="fas fa-exclamation-circle"></i> 请先<a href="${pageContext.request.contextPath}/index.jsp">登录</a>后再发布房源！</h2>
        </div>
    </c:if>

    <%-- 场景二：用户已登录，显示表单 --%>
    <c:if test="${not empty sessionScope.currentUser}">
        <div class="form-card">
            <h1>填写您的房源信息</h1>
                <%-- =================================================================== --%>
                <%-- 【已添加】用于显示来自 Session 的表单错误信息 --%>
            <c:if test="${not empty sessionScope.formError}">
                <style>
                    .form-error-message {
                        background-color: #f8d7da; /* 淡红色背景 */
                        color: #721c24; /* 深红色文字 */
                        border: 1px solid #f5c6cb; /* 红色边框 */
                        padding: 1rem;
                        border-radius: 8px; /* 与表单风格一致的圆角 */
                        margin-bottom: 2rem; /* 与下方表单的间距 */
                        text-align: center;
                        font-weight: 500;
                    }
                </style>
                <div class="form-error-message">
                    <i class="fas fa-exclamation-triangle"></i> <%-- 警告图标 --%>
                    <c:out value="${sessionScope.formError}" />
                </div>
                <%-- 显示后立即从 Session 中移除，防止刷新页面后再次显示 --%>
                <c:remove var="formError" scope="session" />
            </c:if>
                <%-- =================================================================== --%>

                <%-- 表单的功能性属性保持不变 --%>
            <form action="${pageContext.request.contextPath}/HousePostServlet" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" id="title" name="title" required>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="houseType">户型</label>
                        <input type="text" id="houseType" name="houseType" placeholder="例如：三室一厅" required>
                    </div>
                    <div class="form-group">
<%--                        <label for="city">城市 *</label>--%>
<%--                        <select id="city" name="city" required>--%>
<%--                            <option value="">请选择</option>--%>
<%--                            <option value="北京">北京</option>--%>
<%--                            <option value="上海">上海</option>--%>
<%--                            <option value="广州">广州</option>--%>
                        <label for="city">城市</label>
                        <input type="text" id="city" name="city" placeholder="例如：上海" required>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="price">价格 (元/月)</label>
                        <input type="number" id="price" name="price" required>
                    </div>
                    <div class="form-group">
                        <label for="area">面积 (平方米)</label>
                        <input type="number" step="0.01" id="area" name="area" placeholder="例如: 88.88" required>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="bedrooms">卧室数量</label>
                        <input type="number" id="bedrooms" name="bedrooms" value="1" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="bathrooms">卫生间数量</label>
                        <input type="number" id="bathrooms" name="bathrooms" value="1" min="1" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">详细地址</label>
                    <input type="text" id="address" name="address" required>
                </div>

                <div class="form-group">
                    <label for="description">详细描述</label>
                    <textarea id="description" name="description" rows="5"></textarea>
                </div>

                <div class="form-group">
                    <label>房源图片 (可多选)</label>
                    <div class="file-upload-wrapper">
                        <label for="images" class="file-upload-label">
                            <i class="fas fa-cloud-upload-alt"></i> 点击选择或拖拽图片到这里
                        </label>
                        <input type="file" id="images" name="images" multiple accept="image/*">
                    </div>
                </div>

                <div class="form-group" style="margin-top: 2.5rem;">
                    <button type="submit" class="submit-btn">确认发布</button>
                </div>
            </form>
        </div>
    </c:if>
</div>
<%-- 【优化内容结束】 --%>

<%-- 页脚保持不变 --%>
<%@ include file="/jspf/footer.jspf" %>

</body>
</html>