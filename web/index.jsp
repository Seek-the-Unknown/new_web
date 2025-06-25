<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <style>
        /* 全局重置 */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #6B73FF 0%, #ff9900 100%);
            display: flex; align-items: center; justify-content: center;
            height: 100vh;
        }
        .login-card {
            background: #fff;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 100%; max-width: 400px;
        }
        .login-card h1 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #333;
            font-size: 1.75rem;
        }
        .input-group { margin-bottom: 1rem; }
        .input-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-size: 0.9rem;
        }
        .input-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        .input-group input:focus { border-color: #6B73FF; outline: none; }
        .remember-me {
            display: flex; align-items: center;
            margin-bottom: 1rem;
        }
        .remember-me input { margin-right: 0.5rem; }
        .captcha-group { display: flex; align-items: center; }
        .captcha-group input { flex: 1; }
        .captcha-group img {
            margin-left: 0.5rem;
            height: 40px;
            cursor: pointer;
            border-radius: 0.5rem;
        }
        .captcha-group .reload {
            margin-left: 0.5rem;
            font-size: 0.9rem;
            color: #6B73FF;
            text-decoration: none;
        }
        .login-btn {
            width: 100%;
            padding: 0.75rem;
            background: #6B73FF;
            color: #fff;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }
        .login-btn:hover { background: #5A63E5; }
        .links {
            display: flex; justify-content: space-between;
            margin-top: 1rem;
        }
        .links a {
            color: #6B73FF;
            font-size: 0.85rem;
            text-decoration: none;
        }
        .links a:hover { text-decoration: underline; }
    </style>
    <script>
        function reloadCaptcha() {
            document.getElementById('captchaImg').src =
                '${pageContext.request.contextPath}/image?d=' + Date.now();
        }
        function checkCaptchaForm(form) {
            if (!form.checkcode.value.trim()) {
                alert('请输入验证码');
                form.checkcode.focus();
                return false;
            }
            return true;
        }
        window.onload = function() {
            var err = '${error}';
            if (err && err.indexOf('验证码') !== -1) {
                alert(err);
                reloadCaptcha();
            }
        };
    </script>
</head>
<body>
<div class="login-card">
    <h1>欢迎登录</h1>
    <form action="${pageContext.request.contextPath}/Lzs_login"
          method="post"
          onsubmit="return checkCaptchaForm(this)">

        <div class="input-group">
            <label for="username">用户名</label>
            <input id="username" type="text" name="username"
                   placeholder="请输入用户名" required />
        </div>

        <div class="input-group">
            <label for="password">密码</label>
            <input id="password" type="password" name="password"
                   placeholder="请输入密码" required />
        </div>

        <div class="remember-me">
            <input type="checkbox" name="rememberMe" id="rememberMe" />
            <label for="rememberMe">记住我</label>
        </div>

        <div class="input-group captcha-group">
            <input type="text" name="checkcode" maxlength="4"
                   placeholder="验证码" />
            <img id="captchaImg"
                 src="${pageContext.request.contextPath}/image?d=${pageContext.session.id}"
                 alt="验证码"
                 onclick="reloadCaptcha()"
                 title="点击换一张" />
            <a href="javascript:reloadCaptcha()" class="reload">换一张</a>
        </div>

        <button type="submit" class="login-btn">登 录</button>

        <div class="links">
            <a href="${pageContext.request.contextPath}/register.jsp">注册账号</a>
            <a href="#">忘记密码？</a>
        </div>
    </form>
</div>
</body>
</html>
<%--${pageContext.request.contextPath}--%>