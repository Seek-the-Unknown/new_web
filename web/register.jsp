<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <style>
        /* 基础重置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f0f2f5;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 1.2rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #5f6368;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #dadce0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 2px rgba(26, 115, 232, 0.2);
        }

        .gender-group {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .gender-option {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .button-group {
            margin-top: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        button[type="submit"] {
            background: #1a73e8;
            color: white;
            padding: 0.8rem;
            border: none;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
        }

        button[type="submit"]:hover {
            background: #1557b0;
        }

        .return-link {
            text-align: center;
            color: #1a73e8;
            text-decoration: none;
            font-size: 14px;
            display: block;
            margin-top: 1rem;
        }

        .return-link:hover {
            text-decoration: underline;
        }

        .error-message {
            background: #fce8e6;
            color: #d93025;
            padding: 0.8rem;
            border-radius: 6px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .error-message::before {
            content: "⚠";
            font-size: 16px;
        }
    </style>

</head>
<body>
<%--    <%--%>
<%--//        产生一个随机数，作为令牌--%>
<%--//        long number = new Random().nextInt(1999999)+System.currentTimeMillis();--%>
<%--//        String token = number+"";--%>
<%--    String token = TokenProcessor.getInstance().makeToken();--%>
<%--    %>--%>


<%--<form action="registerNewUser.jsp" method="post">--%>
<%--    <h1>注册页面</h1>--%>
<%--    用户名：<input type="text" name="uname" placeholder="请输入用户名"><br>--%>
<%--    真实姓名：<input type="text" name="rname" placeholder="请输入真实"><br>--%>
<%--    密码：<input type="password" name="password" placeholder="请输入密码"><br>--%>
<%--    确认密码：<input type="password" name="password2" placeholder="请再次输入密码"><br>--%>
<%--    用户角色：<input type="radio" name="role" value="Manager">管理员--%>
<%--    <input type="radio" name="role" value="User">用户<br>--%>
<%--    用户性别：<input type="radio" name="sex" value="1">男--%>
<%--    <input type="radio" name="sex" value="0">女<br>--%>
<%--    <input type="submit" value="注册">--%>
<%--</form>--%>
<div class="register-container">
    <h2>用户注册</h2>

    <% if(request.getAttribute("error") != null) { %>
    <div class="error-message">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/Lzs_register" method="post">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" required>
        </div>

        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" required>
        </div>

        <div class="form-group">
            <label for="confirmPwd">确认密码</label>
            <input type="password" id="confirmPwd" name="confirmPwd" required>
        </div>

        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label>性别</label>
            <div class="gender-group">
                <label class="gender-option">
                    <input type="radio" name="gender" value="男" checked>
                    男
                </label>
                <label class="gender-option">
                    <input type="radio" name="gender" value="女">
                    女
                </label>
            </div>
        </div>

        <div class="button-group">
            <button type="submit">立即注册</button>
            <a href="index.jsp" class="return-link">已有账号？立即登录</a>
        </div>
    </form>
</div>
</body>
</html>