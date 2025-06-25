<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f8fb; margin: 0; }
        .profile-container { display: flex; max-width: 1200px; margin: 40px auto; gap: 30px; }

        /* --- 侧边导航栏 --- */
        .profile-sidebar { flex: 0 0 250px; background: #fff; border-radius: 10px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); padding: 20px; }
        .user-avatar { text-align: center; margin-bottom: 20px; }
        .user-avatar .icon { font-size: 60px; color: #007bff; }
        .user-avatar h3 { margin: 10px 0 5px; }
        .user-avatar p { font-size: 0.9em; color: #6c757d; }
        .nav-menu { list-style: none; padding: 0; }
        .nav-menu li a { display: block; padding: 15px 20px; text-decoration: none; color: #333; font-weight: 500; border-radius: 8px; transition: background-color 0.3s, color 0.3s; }
        .nav-menu li a.active, .nav-menu li a:hover { background-color: #007bff; color: #fff; }
        .nav-menu li a i { margin-right: 15px; width: 20px; text-align: center; }

        /* --- 主内容区 --- */
        .profile-content { flex-grow: 1; }
        .content-card { background: #fff; border-radius: 10px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); padding: 40px; }
        .content-card h2 { font-size: 1.8em; margin-top: 0; border-bottom: 1px solid #eee; padding-bottom: 20px; margin-bottom: 30px; }

        /* --- 资金卡片 --- */
        .balance-card { background: linear-gradient(to right, #007bff, #0056b3); color: #fff; padding: 30px; border-radius: 10px; text-align: center; margin-bottom: 30px; }
        .balance-card .label { font-size: 1em; opacity: 0.8; }
        .balance-card .amount { font-size: 3em; font-weight: 700; margin: 10px 0; }

        /* --- 修改密码表单 --- */
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 500; }
        .form-group input { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 5px; }
        .submit-btn { padding: 12px 30px; background: #28a745; color: #fff; border: none; border-radius: 5px; cursor: pointer; font-size: 1em; }
    </style>
</head>
<body>
<div class="profile-container">
    <aside class="profile-sidebar">
        <div class="user-avatar">
            <i class="fas fa-user-circle icon"></i>
            <h3>${userInfo.username}</h3>
            <p>${userInfo.email}</p>
        </div>
        <ul class="nav-menu">
            <li><a href="#" class="active"><i class="fas fa-user"></i>我的资料</a></li>
            <li><a href="${pageContext.request.contextPath}/user/dashboard"><i class="fas fa-home"></i>我的房源</a></li>
            <li><a href="${pageContext.request.contextPath}/"><i class="fas fa-arrow-left"></i>返回首页</a></li>
            <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>退出登录</a></li>
        </ul>
    </aside>

    <main class="profile-content">
        <div class="content-card">
            <h2>账户概览</h2>
            <div class="balance-card">
                <p class="label">账户余额 (元)</p>
                <p class="amount">
                    <fmt:formatNumber value="${userInfo.balance}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                </p>
            </div>

            <h2>安全设置</h2>
            <form action="${pageContext.request.contextPath}/changePassword" method="post">
                <div class="form-group">
                    <label for="currentPassword">当前密码:</label>
                    <input type="password" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">新密码:</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>
                <div class="form-group">
                    <label for="confirmNewPassword">确认新密码:</label>
                    <input type="password" id="confirmNewPassword" name="confirmNewPassword" required>
                </div>
                <button type="submit" class="submit-btn">确认修改密码</button>
                <c:if test="${not empty param.passwordChanged}">
                    <p style="color: green;">密码修改成功，请重新登录！</p>
                </c:if>
                <c:if test="${not empty requestScope.error}">
                    <p style="color: red;">${requestScope.error}</p>
                </c:if>
            </form>
        </div>
    </main>
</div>
</body>
</html>