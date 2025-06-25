<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码</title>
    <style>
        /* 使用更平滑的盒模型计算方式 */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            background-color: #f0f2f5; /* 更柔和的背景色 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px; /* 更圆润的边角 */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* 更明显的阴影 */
            width: 100%;
            max-width: 420px; /* 设定最大宽度 */
            text-align: center;
        }

        h2 {
            margin-bottom: 10px;
            font-size: 24px;
            color: #1c1e21;
        }

        p {
            margin-bottom: 25px;
            color: #606770;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #dddfe2;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.2s; /* 添加过渡效果 */
        }

        /* 输入框获取焦点时的效果 */
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #1877f2; /* 主题蓝色 */
            box-shadow: 0 0 0 2px rgba(24, 119, 242, 0.2);
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background-color: #1877f2; /* 主题蓝色 */
            color: white;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 10px;
        }

        /* 按钮悬停效果 */
        input[type="submit"]:hover {
            background-color: #166fe5;
        }

        hr {
            border: 0;
            height: 1px;
            background-color: #dddfe2;
            margin: 25px 0;
        }

        /* 错误信息样式 */
        .error-message {
            color: #fa383e;
            background-color: #ffebee;
            border: 1px solid #fa383e;
            padding: 10px;
            border-radius: 6px;
            margin-top: 20px;
            text-align: center;
        }

        .back-link {
            display: block;
            margin-top: 25px;
            color: #1877f2;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .back-link:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>重设密码</h2>
    <p>请填写以下信息来重设您的密码。</p>

    <form action="${pageContext.request.contextPath}/resetPassword" method="post">
        <div class="form-group">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="email">注册邮箱:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <hr>
        <div class="form-group">
            <label for="newPassword">新密码:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div class="form-group">
            <label for="confirmNewPassword">确认新密码:</label>
            <input type="password" id="confirmNewPassword" name="confirmNewPassword" required>
        </div>
        <div class="form-group">
            <input type="submit" value="确认重设">
        </div>
    </form>

    <%-- 显示可能出现的错误信息 --%>
    <% String error = (String) request.getAttribute("error");
        if (error != null) { %>
    <div class="error-message"><%= error %></div>
    <% } %>
    <a href="index.jsp" class="back-link">返回登录</a>
</div>
</body>
</html>